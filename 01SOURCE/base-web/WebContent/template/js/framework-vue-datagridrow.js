var documentWriteHtml = "";
Vue.component('ll-gridrow', {
	props : [ 'field', 'title', 'width', 'sort', 'fixed' ],
	template : '<th :id="baseId+guid" :field="field" :width="width" :sort="sort" :fixed="fixed">{{title}}</th>',
	data : function() {
		return {
			guid : Date.now(),
			baseId:"ajaxdatagridrow"
		}
	},
	mounted : function() {
		var rowId=this.baseId+this.guid;
		var ajaxDataGridId=$("#"+rowId).parent().attr("id");
		
		var col = new AjaxDataGridColumns(
			this.field,
			this.title,
			this.width,
			this.sort,
			this.fixed
		);
		var datagrid=$.getAjaxDataGrid(ajaxDataGridId);
		datagrid.addCol(col);
	},
	methods : {},
})
