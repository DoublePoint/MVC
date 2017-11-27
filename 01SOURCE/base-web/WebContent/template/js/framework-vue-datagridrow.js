Vue.component(ConstantComponentMap._AjaxDataGridRow, {
	props : [ 'field', 'title', 'width', 'sort', 'fixed','onclick' ],
	template : '<th type="hidden" :id="baseId+guid" :field="field" :width="width" :sort="sort" :fixed="fixed"/></th>',
	data : function() {
		return {
			guid : $._GenerateUUID(),
			baseId:"ajaxdatagridrow"
		}
	},
	mounted : function() {
		//添加本空间所属的ajaxdatagrid的列定义
		this._AddToLayuiObjectHashMapColumnsDefine();
	},
	methods : {
		_AddToLayuiObjectHashMapColumnsDefine:function(){
			var _rowId=this.baseId+this.guid;
			var _ajaxDataGridId=$("#"+_rowId).parent().attr("id");
			var _col = new AjaxDataGridColumns(
				this.field,
				this.title,
				this.width,
				this.sort,
				this.fixed,
				this.onclick
			);
			var _AjaxDatagrid=$._GetFromLayuiObjectHashMap(_ajaxDataGridId);
			_AjaxDatagrid.addCol(_col);
		}
	},
})


