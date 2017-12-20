var documentWriteHtml = "";
Vue.component(_ConstantComponentMap._Tree, {
	props : [ 'id', 'datasource', 'columns', 'showLine' ],
	template : '<ul type="hidden"  :id="id+guid" class="ztree" v-on:click="incrementCounter"></ul>',

	data : function() {
		var dataList;
		return {
			guid : $._GenerateUUID()
		}
	},
	mounted : function() {
		this._initTreeData();
		this._addDefineTreeObjectScript();
	},
	created : function() {
		this._addTreeToMap();
	},
	methods : {
		incrementCounter : function() {
		},
		_addTreeToMap : function() {
			var domId = this._getTreeDomId();
			var tree = new AjaxTree(domId);
			tree.setDataSource($$pageContextPath+this.datasource);
			$._AddToLayuiObjectHashMap(domId, tree);
		},
		// 添加生命Tree对象脚本
		_addDefineTreeObjectScript : function() {
			var domId = this._getTreeDomId();
			var $script = $('<script type="text/javascript"></script>');
			$script.append('var ' + this.id + '=$._GetFromLayuiObjectHashMap("' + domId + '");');
			$script.append(this.id + '.datasource="' + this.datasource + '";');
			documentWriteHtml = $script.prop("outerHTML");
			$("body").append(documentWriteHtml);
		},
		_getTreeDomId : function() {
			var _domId = this.id + this.guid;
			return _domId;
		},
		_initTreeData : function() {
			var domid=this._getTreeDomId();
			var tree=$._GetFromLayuiObjectHashMap(domid);
			tree.render();
		}
	},
})

function AjaxTree(domId) {
	this.id = domId;
	this.treeObject = null;
	this.datasource=null;
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
			url : this.datasource,//$$pageContextPath + "/template/xt/cd-tree?isHasRoot=true",
			autoParam : [ "id", "name=n", "level=lv" ],
			otherParam : {
				"otherParam" : "zTreeAsyncTest"
			},
			dataFilter : this.filter
		},
		data : {
			key : {
				name : "cdmc",
				title : "cdmc",
				url : "cdbs",
				children : "childrenCDList"
			},
		},
		callback: {
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
	return this;
}