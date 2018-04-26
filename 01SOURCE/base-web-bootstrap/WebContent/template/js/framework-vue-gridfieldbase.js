function _LLGridFieldComponent(type){
	var template='<th :id="id+guid" >{{ title }}</th>';
	var gridColumnDefaultWidth=100;//列默认宽度（checkbox)除外
	Vue.component(type, {
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
		template : template,
		data : function() {
			//针对不同的类型 分别进行相关数据的初始化
			if(type==_ConstantComponentMap._GridCheck){
				this.checkbox=true;
			}
			else{
				if(!this.width){
					//this.width=100;
				}
			}
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
				$._AddToLayuiObjectHashMap(domId, field);
				
				var _AjaxGridId = this.$parent._GetComponentDomId();
				var _AjaxDatagrid = $._GetFromLayuiObjectHashMap(_AjaxGridId);
				if(type!=_ConstantComponentMap._GridCheck){
					_AjaxDatagrid.addCol(field);
				}
			}
		},
	});
}

function GridField(domId) {
	this.domId = domId;

	/* bootstrap */
	this.radio=null;
	this.checkbox=null;
	this.field=null;
	this.title=null;
	this.titleTooltip=null;
	this.class=null;
	this.rowspan=null;
	this.colspan=null;
	this.align=null;
	this.halign=null;
	this.falign=null;
	this.valign=null;
	this.width=null;
	this.sortable=null;
	this.order=null;
	this.visible=null;
	this.cardVisible=null;
	this.switchable=null;
	this.clickToSelect=null;
	this.formatter=null;
	this.footerFormatter=null;
	this.events=null;
	this.sorter=null;
	this.sortName=null;
	this.cellStyle=null;
	this.searchable=null;
	this.searchFormatter=null;
	this.escape=null;
	this.showSelectTitle=null;
	
	//构造使用于bootstrap的field
	this.getBoostrapField=function(){
		var field={};
		
		for(var i in this){
			if(i!="getBoostrapField"&&i!="domId"){
				if(this[i]){
					field[i]=this[i];
				}
			}
		}
		return field;
	}
	return this;
}
