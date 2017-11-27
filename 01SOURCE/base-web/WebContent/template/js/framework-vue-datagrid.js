var documentWriteHtml = "";
Vue.component(ConstantComponentMap._AjaxDataGrid, {
	props : [ 'id', 'datasource', 'columns','onrowclick' ],
	template : '<table  :lay-filter="id+guid"  :id="id+guid" v-on:click="incrementCounter"><slot></slot></table>',

	data : function() {
		var dataList;
		return {
			guid : $._GenerateUUID()
		}
	},
	mounted:function(){
		this._initAjaxDataGridData();
		this._addDefineAjaxDataGridObjectScript();
	},
	created : function() {
		this._addAjaxDataGridToMap();
	},
	methods : {
		incrementCounter : function() {
		},
		_addAjaxDataGridToMap:function(){
			var domId=this._getAjaxDataGridDomId();
			var ajaxDataGrid = new AjaxDataGrid(domId);
			$._AddToLayuiObjectHashMap(domId, ajaxDataGrid);
		},
		//添加生命ajaxDataGrid对象脚本
		_addDefineAjaxDataGridObjectScript:function(){
			var domId=this._getAjaxDataGridDomId();
			var $script = $('<script type="text/javascript"></script>');
			$script.append('var ' + this.id + '=$._GetFromLayuiObjectHashMap("' + domId + '");');
			$script.append(this.id + '.datasource="' + this.datasource + '";');
			documentWriteHtml = $script.prop("outerHTML");
			$("body").append(documentWriteHtml);
		},
		_getAjaxDataGridDomId:function(){
			var _domId = this.id + this.guid;
			return _domId;
		},
		_initAjaxDataGridData:function(){
			var cd = {};
			var domId=this._getAjaxDataGridDomId();
			$.ajax({
				url : $$pageContextPath + this.datasource,
				type : "POST",
				contentType : 'application/json;charset=UTF-8',
				dataType : "json",
				data : JSON.stringify(cd),
				async : false,
				success : function(data) {
					var _ajaxdatagrid=$._GetFromLayuiObjectHashMap(domId);
					_ajaxdatagrid.setData(data);
//					$._SetLayuiTableData(domId, data, cols);
				},
				error : function() {
					alert("error");
				}
			});
			var str=this.onrowclick
			$table.on('tool('+this._getAjaxDataGridDomId()+')', function(obj){
				if(str==null)
					return;
			    var data = obj.data;
			    $._Eval(str);
			 });
		}
		
	},
})
