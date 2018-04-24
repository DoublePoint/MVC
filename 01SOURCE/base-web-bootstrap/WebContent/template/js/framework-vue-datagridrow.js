Vue.component(_ConstantComponentMap._AjaxDataGridRow, {
	props : [ 'id','field', 'title', 'width', 'sort', 'fixed', 'onclick', 'template','formatter' ],
	template : '<th :id="id+guid" :field="field" :data-field="field" :width="width" :sort="sort" :fixed="fixed" :title="title" :template="template" >{{ title }}</th>',
	data : function() {
		return {
			guid : $._GenerateUUID(),
			baseId : "ajaxdatagridrow",
		}
	},
	mounted : function() {
		// 添加本空间所属的ajaxdatagrid的列定义
		this._RegisterComponent();
	},
	methods : {
		_GetComponentDomId : function() {
			return this.id+this.guid;
		},
		_GetComponentDom : function(){
			var dom = $._GetFromLayuiObjectHashMap(this._GetComponentDomId());
			return dom;
		},
		_RegisterComponent : function() {
			
			
			var domId = this._GetComponentDomId();
			var dataRow = new AjaxDataGridColumn(domId);
			for ( var attrName in dataRow) {
				if (this[attrName] != null)
					dataRow[attrName] = this[attrName];
			}
			$._AddToLayuiObjectHashMap(domId, dataRow);
			
			var _AjaxDataGridId = this.$parent._GetComponentDomId();
			if (this.template != null && this.template == "datetime")
				dataRow.setTemplate(function(d) {
					var datetime = d.cjsj;
					return "<span>" + $._FormatToDate(datetime) + "</span>"
				});
			var _AjaxDatagrid = $._GetFromLayuiObjectHashMap(_AjaxDataGridId);
			_AjaxDatagrid.addCol(_col);
		}
	},
});


function AjaxDataGridColumn(domId) {
	this.domId = domId;
	this.field = field;
	this.title = title;
	this.event = "CLICK";
	this.templet = null;
	this.width = width == null ? _ConstantAjaxDataGrid._DEFAULT_COLUMN_WIDTH : width;
	this.sort = sort == null ? _ConstantAjaxDataGrid._DEFAULT_COLUMN_SORT : sort;
	this.fixed = fixed == null ? _ConstantAjaxDataGrid._DEFAULT_COLUMN_FIXED : fixed;

	/* bootstrap */
	this.radio;
	this.checkbox;
	this.field;
	this.title;
	this.titleTooltip;
	this.class;
	this.rowspan;
	this.colspan;
	this.align;
	this.halign;
	this.falign;
	this.valign;
	this.width;
	this.sortable;
	this.order;
	this.visible;
	this.cardVisible;
	this.switchable;
	this.clickToSelect;
	this.formatter="";
	this.footerFormatter;
	this.events;
	this.sorter;
	this.sortName;
	this.cellStyle;
	this.searchable;
	this.searchFormatter;
	this.escape;
	this.showSelectTitle;
	
	
	this.setTemplate = function(tem) {
		this.templet = tem;
	}
	return this;
}
