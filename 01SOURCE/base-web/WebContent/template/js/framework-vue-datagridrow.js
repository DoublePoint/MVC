
Vue.component('ll-gridrow', {
	props : [ 'field', 'title', 'width', 'sort', 'fixed' ],
	template : '<th type="hidden" :id="baseId+guid" :field="field" :width="width" :sort="sort" :fixed="fixed"/></th>',
	data : function() {
		return {
			guid : Date.now(),
			baseId:"ajaxdatagridrow"
		}
	},
	mounted : function() {
		//添加本空间所属的ajaxdatagrid的列定义
		this.addAjaxDataGridColumnsDefine();
	},
	methods : {
		addAjaxDataGridColumnsDefine:function(){
			var _rowId=this.baseId+this.guid;
			var _ajaxDataGridId=$("#"+_rowId).parent().attr("id");
			var _col = new AjaxDataGridColumns(
				this.field,
				this.title,
				this.width,
				this.sort,
				this.fixed
			);
			var _AjaxDatagrid=$.getAjaxDataGrid(_ajaxDataGridId);
			_AjaxDatagrid.addCol(_col);
		}
	},
})
