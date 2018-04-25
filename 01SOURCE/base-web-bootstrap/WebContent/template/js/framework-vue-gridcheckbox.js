Vue.component(_ConstantComponentMap._GridCheck, {
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
	template : '<th id="" data-field="state" ></th>',
	data : function() {
		return {
			guid : $._GenerateUUID()
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
			field.checkbox=true;
			$._AddToLayuiObjectHashMap(domId, field);
			
			var _AjaxGridId = this.$parent._GetComponentDomId();
			var _AjaxDatagrid = $._GetFromLayuiObjectHashMap(_AjaxGridId);
			_AjaxDatagrid.addCol(field);
		}
	},
})
