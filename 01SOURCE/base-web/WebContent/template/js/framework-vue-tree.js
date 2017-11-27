var documentWriteHtml = "";
Vue.component(ConstantComponentMap._Tree, {
	props : [ 'id', 'datasource', 'columns','showLine' ],
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
			var setting = {
				view: {
					showLine: true,
					fontCss : {"font-size":"30",},
			showIcon: false,
			dblClickExpand: true
				},
				async : {
					enable : true,
					showLine:false,
					url : $$pageContextPath + "/template/xt/cdTree?isHasRoot=true",
					autoParam : [ "id", "name=n", "level=lv" ],
					otherParam : {
						"otherParam" : "zTreeAsyncTest"
					},
					dataFilter : this.filter
				},
				data : {
					key : {
						name : "cdmc",
						children : "childrenCDList"
					},
				},
//				callback : {
//					onClick : zTreeOnClick
//				}
			};
			$.fn.zTree.init($("#"+this._getTreeDomId()+""), setting);
		}

	},
})
