/*------AjaxDataGrid-------*/
var _ConstantAjaxDataGrid = {
	_DEFAULT_COLUMN_WIDTH : 180,
	_DEFAULT_COLUMN_SORT : false,
	_DEFAULT_COLUMN_FIXED : false,
	_DEFAULT_MIN_HEIGHT : 100,
	_DEFAULT_MIN_WIDTH :200,
	_DEFAULT_PAGE_SIZE : 20,
};
var _ConstantLayoutArea = {
	_DEFAULT_MIN_HEIGHT : _ConstantAjaxDataGrid._DEFAULT_MIN_HEIGHT,
	_DEFAULT_MIN_WIDTH_LEFT : _ConstantAjaxDataGrid._DEFAULT_MIN_WIDTH
};
var _ConstantComponentMap = {
	_AjaxDataGrid : "ll-ajaxdatagrid",
	_AjaxDataGridRow : "ll-gridrow",
	_GridCheck : "ll-gridcheck",
	_AjaxMenu : "ll-menu",
	_AjaxFormLine : "ll-ajaxformline",
	_Tree : "ll-tree",
	_FillLayOut : "ll-filllayout",
	_FillAreaTB : "ll-fillarea-tb",
	_FillAreaLR : "ll-fillarea-lr",
	_AjaxForm : "ll-ajaxform",
	_FormDropTree:"ll-formdroptree",
	_FormField : "ll-formfield",
	_FormCheck : "ll-formcheck",
	_FormDate : "ll-formdate",
	_FormSelect : "ll-formselect",
	_FormInputButton : "ll-forminputbutton",
	_FormToolBar : "ll-formtoolbar",
	_ToolBar : "ll-toolbar",
	_Region  :"ll-region"
};
var _ConstantPageDefaultParam = {
	_IS_DO_INIT_FUNTION : "_is_do_init_function",
};
var ConstantState = {
	_YES_NO_STATE_Y : "Y",
	_YES_NO_STATE_N : "N"
};
var _ConstantDialog = {
	_DEFAULT_SHOW_TIME:3000	
};

/*------AjaxForm-------*/
var _FormFieldCommonInheritParams = [ 'id', //
'maxlen', //
'readonly', //
'contentalign', //
'visible',//
'onclick',//
'field', //
'title',//
'type',//
'validtype', 
'colspan',
'placeholder',
'parentId',
'datasource',
// 文本框的显示格式,取值为text和password，默认为text
'errmsg' ];
