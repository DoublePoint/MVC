Vue.component(_ConstantComponentMap._AjaxDataGridRow, {
	props : [ 'field', 'title', 'width', 'sort', 'fixed', 'onclick', 'template' ],
	template : '<th :id="baseId+guid" :field="field" :data-field="field" :width="width" :sort="sort" :fixed="fixed" :title="title" :template="template" >{{ title }}</th>',
	data : function() {
		return {
			guid : $._GenerateUUID(),
			baseId : "ajaxdatagridrow",
		}
	},
	mounted : function() {
		// 添加本空间所属的ajaxdatagrid的列定义
		this._AddToLayuiObjectHashMapColumnsDefine();
	},
	methods : {
		_AddToLayuiObjectHashMapColumnsDefine : function() {
			var _rowId = this.baseId + this.guid;
			var _AjaxDataGridId = $("#" + _rowId).parent().parent().parent().attr("id");
			var _col = new AjaxDataGridColumns(this.field, this.title, this.width, this.sort, this.fixed, this.onclick);
			if (this.template != null && this.template == "datetime")
				_col.setTemplet(function(d) {
					var datetime = d.cjsj;
					return "<span>" + $._FormatToDate(datetime) + "</span>"
				});
			var _AjaxDatagrid = $._GetFromLayuiObjectHashMap(_AjaxDataGridId);
			_AjaxDatagrid.addCol(_col);
		}
	},
})
