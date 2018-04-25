Vue.component(_ConstantComponentMap._GridField, {
	props : [  'id','radio', 
	           'checkbox', 
	           'field',//字段名称
				'title',//列标题
				'titleTooltip',
				'class',
				'rowspan',
				'colspan',
				'align',
				'halign',
				'falign',
				'valign',
				'width',
				'sortable',
				'order',
				'visible',
				'cardVisible',
				'switchable',
				'clickToSelect',
				'formatter',
				'footerFormatter',
				'events',
				'sorter',
				'sortName',
				'cellStyle',
				'searchable',
				'searchFormatter',
				'escape',
				'showSelectTitle'],
	template : '<th :id="id+guid"  :field="field" :data-field="field" :width="width" :sort="sort" :fixed="fixed" :title="title" :template="template" >{{ title }}</th>',
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
			var field = new GridField(domId);
			for ( var attrName in field) {
				if (this[attrName] != null)
					field[attrName] = this[attrName];
			}
			$._AddToLayuiObjectHashMap(domId, field);
			
			var _AjaxGridId = this.$parent._GetComponentDomId();
			var _AjaxDatagrid = $._GetFromLayuiObjectHashMap(_AjaxGridId);
			_AjaxDatagrid.addCol(field);
		}
	},
});



function GridField(domId) {
	this.domId = domId;

	/* bootstrap */
	this.radio=null;
	this.checkbox=null;
	this.field=null;
	this.title=null;
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
	this.formatter=null;
	this.footerFormatter;
	this.events;
	this.sorter;
	this.sortName;
	this.cellStyle;
	this.searchable;
	this.searchFormatter;
	this.escape;
	this.showSelectTitle;
	
	return this;
}
