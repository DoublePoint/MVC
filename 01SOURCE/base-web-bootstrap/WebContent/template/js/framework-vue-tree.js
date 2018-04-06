Vue.component(_ConstantComponentMap._Tree, {
	props : [ 'id', 'datasource','onclick', 'columns', 'showLine' ],
	template : '<ul type="hidden"  :id="id+guid" class="ztree" :onclick="onclick"></ul>',

	data : function() {
		var dataList;
		return {
			guid : $._GenerateUUID()
		}
	},
	mounted : function() {
		this._InitTreeData();
		this._MapComponent();
	},
	created : function() {
		this._RegisterComponent();
	},
	methods : {
		_RegisterComponent : function() {
			var domId = this._GetComponentDomId();
			var tree = new AjaxTree(domId);
			tree.setDataSource($$pageContextPath+this.datasource);
			tree.setOnclick(this.onclick);
			$._AddToLayuiObjectHashMap(domId, tree);
		},
		// 添加生命Tree对象脚本
		_MapComponent : function() {
			$._OutputMapCompoment(this);
//			var documentWriteHtml = "";
//			var domId = this._GetComponentDomId();
//			var $script = $('<script type="text/javascript"></script>');
//			$script.append('var ' + this.id + '=$._GetFromLayuiObjectHashMap("' + domId + '");');
//			documentWriteHtml = $script.prop("outerHTML");
//			$("body").append(documentWriteHtml);
		},
		_GetComponentDomId : function() {
			var _domId = this.id + this.guid;
			return _domId;
		},
		_InitTreeData : function() {
			var domid=this._GetComponentDomId();
			var tree=$._GetFromLayuiObjectHashMap(domid);
			tree.render();
		}
	},
})

function AjaxTree(domId) {
	this.id = domId;
	this.treeObject = null;
	this.datasource=null;
	this.onclick=null;
	this.setting = {
		view : {
			showLine : true,
			fontCss : {
				"font-size" : "30",
			},
			showIcon : true,
			dblClickExpand : true
		},
		async : {
			enable : true,
			showLine : true,
			url : this.datasource,
			autoParam : [ "id", "name=n", "level=lv" ],
			otherParam : {
				"otherParam" : "zTreeAsyncTest"
			},
			dataFilter : this.filter
		},
		data : {
			key : {
				name : "name",
				title : "name",
				url : "null",
				children : "childrenMenuList"
			},
		},
		callback: {
			//回调成功时展开第一层节点
			onAsyncSuccess: function(){
				var treeObj = $.fn.zTree.getZTreeObj(domId);
				var nodes = treeObj.getNodes();
				for (var i = 0; i < nodes.length; i++) { // 设置节点展开
					treeObj.expandNode(nodes[i], true, false, true);
				}
			}
		}
	};
	this.getTreeObject = function() {
		if (this.treeObject == null)
			treeObject = $.fn.zTree.getZTreeObj(this.id);
		return treeObject;
	}
	this.getSelectedNodes = function() {
		return this.getTreeObject().getSelectedNodes();
	}
	this.setDataSource=function(datasource){
		this.setting.async.url=datasource;
	}
	this.setData = function(data) {
		$.fn.zTree.init($("#" + this.id + ""), this.setting);
	}
	this.render = function() {
		$.fn.zTree.init($("#" + this.id + ""), this.setting);
	}
	this.setSetting = function(setting) {
		this.setting = setting;
	}
	
	this.setOnclick=function(evt){
		var funcitonname=evt;
		this.setting.callback.onClick=function(event, treeId, treeNode){
			$._Eval(funcitonname,[event, treeId, treeNode]);
			return false;
		};
	}
	
	return this;
}