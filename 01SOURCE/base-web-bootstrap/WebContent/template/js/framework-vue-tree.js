Vue.component(_ConstantComponentMap._Tree, {
	props : [ 
	          'id', //id
	          'datasource',//数据源
	          'onnodeclick', //单击方法
	          'columns', //列
	          'showLine', //是否显示线条
	          'showcheckbox',
	          'onload'
	          ],
	template : '<ul type="hidden"  :id="id+guid" class="ztree"></ul>',

	data : function() {
		var dataList;
		return {
			guid : $.generateUUID()
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
			for ( var attrName in tree) {
				if (this[attrName] != null)
					tree[attrName] = this[attrName];
			}
			tree.setDataSource($$pageContextPath+this.datasource);
			$.addToLayuiObjectHashMap(domId, tree);
		},
		// 添加生命Tree对象脚本
		_MapComponent : function() {
			$.outputMapCompoment(this);
		},
		_GetComponentDomId : function() {
			var _domId = this.id + this.guid;
			return _domId;
		},
		_InitTreeData : function() {
			var domid=this._GetComponentDomId();
			var tree=$.getFromLayuiObjectHashMap(domid);
			tree.render();
		}
	},
})

function AjaxTree(domId) {
	this.domId = domId;
	this.treeObject = null;
	this.datasource=null;
	this.onnodeclick=null;
	this.showcheckbox=false;
	this.onload=null;
	
	this.setting = {
		view : {
			showLine : true,
			fontCss : {
				"font-size" : "30",
			},
			showIcon : true,
			dblClickExpand : true
		},
		check : {
			enable:false,
			chkStyle: "checkbox",
			chkboxType: { "Y": "ps", "N": "ps" }
		},
		async : {
			enable : true,
			url : this.datasource,
			autoParam : [ "code"],
			otherParam : {
				"otherParam" : "zTreeAsyncTest",
				"otherParam2" : "zTreeAsyncTest",
			},
			dataFilter : this.filter
		},
		data : {
			keep: {
				parent: true
			},
			key : {
				name : "name",
				title : "name",
				url : "url",
//				children : "childrenMenuList"
			},
		},
		callback: {
			
		}
	};
	this.resetCheckBoxState=function(){
		this.setting.check.enable=this.showcheckbox=="true"?true:false;
	};
	this.checkNode = function(node){
		this.getTreeObject().checkNode(node, true, true);
	};
	this.init = function(){
		this.initEvent();
	};
	this.initEvent = function(){
		this.initOnAsycSuccess();//初始化加载完成事件
		this.initOnClick();//初始化单击事件
	};
	this.initOnAsycSuccess = function(){
		//回调成功时展开第一层节点
		var treeDom=this;
		this.setting.callback.onAsyncSuccess=function(){
			var treeObj = $.fn.zTree.getZTreeObj(domId);
			var nodes = treeObj.getNodes();
			for (var i = 0; i < nodes.length; i++) { // 设置节点展开
				treeObj.expandNode(nodes[i], true, false, true);
			}
			if(treeDom.onload)
				$._Eval(treeDom.onload);
		}
	};
	this.initOnClick = function(){
		var treeDom=this;
		this.setting.callback.onClick=function(){
			if(treeDom.onnodeclick)
				$._Eval(treeDom.onnodeclick);
		}
	}
	//根据数据反选树节点 * srourceField 数据字段名称 * targetField 树节点的字段名称
	this.uncheckNodeByData = function(node,srourceField,targetField){
		var arr=new Array();
		arr.push(node);
		this.uncheckNodesByDataList(arr,srourceField,targetField);
	};
	//根据数据选择节点 * srourceField 数据字段名称 * targetField 树节点的字段名称
	this.checkNodeByData = function(node,srourceField,targetField){
		var arr=new Array();
		arr.push(node);
		this.checkNodesByDataList(arr,srourceField,targetField);
	};
	//根据数据List选择节点 * srourceField 数据字段名称 * targetField 树节点的字段名称(默认为id)
	this.checkNodesByDataList = function(dataList,srourceField,targetField){
		if(srourceField==null)
			srourceField="id";
		if(targetField==null)
			targetField="id";
		for(var i in dataList){
			var node=this.getTreeObject().getNodeByParam(targetField,dataList[i][srourceField]);
			if(node!=null)
				this.getTreeObject().checkNode(node, true, false);
		}
	};
	//根据数据List 反选择节点 * srourceField 数据字段名称 * targetField 树节点的字段名称
	this.uncheckNodesByDataList = function(dataList,srourceField,targetField){
		if(srourceField==null)
			srourceField="id";
		if(targetField==null)
			targetField="id";
		for(var i in dataList){
			var node=this.getTreeObject().getNodeByParam(targetField,dataList[i][srourceField]);
			if(node!=null)
				this.getTreeObject().checkNode(node, false, false);
		}
	};
	this.getTreeObject = function() {
		if (this.treeObject == null)
			this.treeObject = $.fn.zTree.getZTreeObj(this.domId);
		return this.treeObject;
	}
	this.getCheckedNodes=function(){
		return this.getTreeObject().getCheckedNodes(true);
	}
	this.getSelectedNodes = function() {
		return this.getTreeObject().getSelectedNodes();
	}
	this.setDataSource=function(datasource){
		this.setting.async.url=datasource;
	}
	this.render = function() {
		//设置checkbox的显示
		this.resetCheckBoxState();
		this.init();
		$.fn.zTree.init($("#" + this.domId + ""), this.setting);
	}
	this.setSetting = function(setting) {
		this.setting = setting;
	}
	
	/*this.setOnclick=function(evt){
		var funcitonname=evt;
		this.setting.callback.onClick=function(event, treeId, treeNode){
			$._Eval(funcitonname,[event, treeId, treeNode]);
			return false;
		};
	}*/
	
	return this;
}