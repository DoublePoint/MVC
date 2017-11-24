var documentWriteHtml = "";
Vue.component('ll-ajaxdatagrid', {
	props : [ 'id', 'datasource', 'columns' ],
	template : '<table type="hidden" style="display:none;"   :id="id+guid" v-on:click="incrementCounter"><slot></slot></table>',

	data : function() {
		var dataList;
		return {
			guid : Date.now()
		}
	},
	mounted:function(){
		this._initAjaxDataGridData();
	},
	created : function() {
		this._addDefineAjaxDataGridObjectScript();
		this._addAjaxDataGridToMap();
		
	},
	methods : {
		incrementCounter : function() {
		},
		_addAjaxDataGridToMap:function(){
			var domId=this._getAjaxDataGridDomId();
			var ajaxDataGrid = new AjaxDataGrid(domId);
			$.addAjaxDataGrid(domId, ajaxDataGrid);
		},
		//添加生命ajaxDataGrid对象脚本
		_addDefineAjaxDataGridObjectScript:function(){
			var domId=this._getAjaxDataGridDomId();
			var $script = $('<script type="text/javascript"></script>');
			$script.append('var ' + this.id + '=$.getAjaxDataGrid("' + domId + '");');
			$script.append(this.id + '.datasource="' + this.datasource + '";');
			documentWriteHtml = $script.prop("outerHTML");
//			$("body").append(documentWriteHtml);
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
					var _ajaxdatagrid=$.getAjaxDataGrid(domId);
					_ajaxdatagrid.setData(data);
//					$.setLayuiTableData(domId, data, cols);
				},
				error : function() {
					alert("error");
				}
			});
		}
		
	},
})
