//公共常量类
var _LL_Constant = new function() {
	var contObj=this;
	this._ConstantAjaxDataGrid = {
		_DEFAULT_COLUMN_WIDTH : 180,
		_DEFAULT_COLUMN_SORT : false,
		_DEFAULT_COLUMN_FIXED : false,
		_DEFAULT_MIN_HEIGHT : 100,
		_DEFAULT_MIN_WIDTH : 200,
		_DEFAULT_PAGE_SIZE : 20,
	};
	this._ConstantLayoutArea = {
		_DEFAULT_MIN_HEIGHT : contObj._ConstantAjaxDataGrid._DEFAULT_MIN_HEIGHT,
		_DEFAULT_MIN_WIDTH_LEFT : contObj._ConstantAjaxDataGrid._DEFAULT_MIN_WIDTH
	};
	this._ConstantAjaxForm = {
		_FormFieldProps:[],	
	};
	this._ConstantComponentMap = {
		_AjaxGrid : "ll-ajaxgrid",
		_AjaxForm : "ll-ajaxform",
		_AjaxMenu : "ll-menu",
		_AjaxFormLine : "ll-ajaxformline",
		_Card :"ll-card",
		_Tree : "ll-tree",
		_FillLayOut : "ll-filllayout",
		_FillAreaTB : "ll-fillarea-tb",
		_FillAreaLR : "ll-fillarea-lr",
		_FormDropTree : "ll-formdroptree",
		_FormField : "ll-formfield",
		_FormCheck : "ll-formcheck",
		_FormDate : "ll-formdate",
		_FormFileInput : "ll-formfileinput",
		_FormSelect : "ll-formselect",
		_FormSwitch : "ll-formswitch",
		_FormInputButton : "ll-forminputbutton",
		_FormToolBar : "ll-formtoolbar",
		_GridField : "ll-gridfield",
		_GridCheck : "ll-gridcheck",
		_GridCustom : "ll-gridcustom",
		_ToolBar : "ll-toolbar",
		_TabPanel : "ll-tabpanel",
		_Tab : "ll-tab",
		_StepPanel : "ll-steppanel",
		_Step : "ll-step",
		_Region : "ll-region"
	};
	this._ConstantDialog = {
		_DEFAULT_SHOW_TIME : 3000
	};
	return this;
}
