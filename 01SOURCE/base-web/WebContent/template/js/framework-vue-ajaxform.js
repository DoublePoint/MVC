var documentWriteHtml = "";
Vue.component(_ConstantComponentMap._AjaxForm, {
	props : [ 'id', 'onrowclick','cols' ],
	template : '<form class="layui-form " :id="id+guid" action=""><slot></slot></form>',

	data : function() {
		return {
			guid : $._GenerateUUID()
		}
	},
	mounted : function() {
		this._AddDefineAjaxFormObjectScript();
		this._RefreshForm();
	},
	created : function() {
		this._AddAjaxFormToMap();
	},
	methods : {
		_AddAjaxFormToMap : function() {
			var domId = this._GetAjaxFormDomId();
			var ajaxForm = new AjaxForm(domId);
			ajaxForm.cols=this.cols;
			$._AddToLayuiObjectHashMap(domId, ajaxForm);

		},
		// 添加生命ajaxDataGrid对象脚本
		_AddDefineAjaxFormObjectScript : function() {
			var domId = this._GetAjaxFormDomId();
			var $script = $('<script type="text/javascript"></script>');
			$script.append('var ' + this.id + '=$._GetFromLayuiObjectHashMap("' + domId + '");');
			documentWriteHtml = $script.prop("outerHTML");
			$("body").append(documentWriteHtml);
		},
		_GetAjaxFormDomId : function() {
			var _domId = this.id + this.guid;
			return _domId;
		},
		_RefreshForm:function(){
			var domId = this._GetAjaxFormDomId();
			var _Ajaxform = $._GetFromLayuiObjectHashMap(domId);
			_Ajaxform.refresh();
		}
	},
})

function AjaxForm(domId) {
	this.id = domId;
	this.colproportion = "";
	this.cols = "100";
	
	this.formItems = new Array();
	this.formLines = new Array();
	this.setCols=function(cols){
		this.cols=cols;
	}
	this.getCols=function(){
		return this.cols;
	}
	this.setData = function(data) {

	}
	
	this.getFormItems = function(item) {
		return this.formItems;
	}
	/**
	 * 设置字段值
	 */
	this.setFieldValue = function(name, value) {
		var items = this.formItems;
		for (var i = 0; i < items.length; i++) {
			if (items[i].field == name) {
				items[i].setData(value);
			}
		}
	}
	this.addFormItem = function(item) {
		var isNextLine=false;
		var formLinesLength=this.formLines.length;
		var formLine;
		if(formLinesLength<=0){
			formLine=new AjaxFormLine();
			this.formLines.push(formLine);
		}
		else
			formLine=this.formLines[formLinesLength-1];
		//获取当前行的所有元素所占列数 一个字段算一列
		var totalColspan=formLine.getTotalColspan();
		var colspan=item.getColspan();
		
		if(totalColspan+colspan>this.cols){
			isNextLine=true;
		}
		
		if(isNextLine){
			formLine=new AjaxFormLine();
			formLine.push(item);
			this.formLines.push(formLine);
		}
		else{
			formLine.push(item);
		}
		this.formItems.push(item);
	}
	this.refresh = function(){
		var formLines=this.formLines;
		for(index in this.formLines)
		{
			formLines[index].generateToOneLine();
		}
	}
	this.showField = function(name) {

	}
	this.hideField = function(name, isLeaveLocation) {

	}
	return this;
}
function AjaxFormLine() {
	this.rowIndex = 0;
	this.formItems = new Array();
	
	this.getTotalColspan=function(){
		var totalColspan=0;
		var formItems=this.formItems;
		for(index in formItems){
			totalColspan+=parseInt(formItems[index].getColspan());
		}
		return totalColspan;
	}
	//自动将该Line下的所有数据转变成一行 即添加div
	this.generateToOneLine=function(){
		var formItems=this.formItems;
		if(formItems.length>0){
			formItems[0].addLineStart();
			formItems[formItems.length-1].addLineEnd();
		}
	}
	
	this.push=function(item){
		this.formItems.push(item);
	}
}
