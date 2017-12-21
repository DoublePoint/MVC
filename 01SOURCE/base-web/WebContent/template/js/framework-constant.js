/*------AjaxDataGrid-------*/
var _ConstantAjaxDataGrid = {
	_DEFAULT_COLUMN_WIDTH : 180,
	_DEFAULT_COLUMN_SORT : false,
	_DEFAULT_COLUMN_FIXED : false,
	_DEFAULT_MIN_HEIGHT : 100
};
var _ConstantLayoutArea = {
	_DEFAULT_MIN_HEIGHT : _ConstantAjaxDataGrid._DEFAULT_MIN_HEIGHT
};
var _ConstantComponentMap = {
	_AjaxDataGrid : "ll-ajaxdatagrid",
	_AjaxDataGridRow : "ll-gridrow",
	_AjaxMenu : "ll-menu",
	_AjaxForm : "ll-ajaxform",
	_Tree : "ll-tree",
	_LayOut : "ll-filllayout",
	_LayOutFieldH : "ll-fillarea",
	_LayOutFieldV : "ll-fillarea2",
	_AjaxForm : "ll-ajaxform",
	_FormField : "ll-formfield",
	_FormCheck : "ll-formcheck",
	_FormDate : "ll-formdate",
	_FormInputButton : "ll-forminputbutton",
};
var _ConstantPageDefaultParam = {
	_IS_DO_INIT_FUNTION : "_is_do_init_function",
};
var ConstantState = {
	_YES_NO_STATE_Y : "Y",
	_YES_NO_STATE_N : "N"
};

/*------AjaxForm-------*/
var _ConstantFormFieldInheritParams = [ 'id', //
'maxlen', //
'readonly', //
'contentalign', //
'visible',//
'onclick',//
'field', //
'title',//
'type',//
'validtype',
// 文本框的显示格式,取值为text和password，默认为text
'errmsg' ];