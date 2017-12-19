var documentWriteHtml = "";
Vue.component(_ConstantComponentMap._FormInputButton, {
	props : [ 'id', 'onclick','field','title'],
	template : 
	'<div class="layui-form-item">'+
		'<label class="layui-form-label">{{title}}</label>'+
		'<div class="layui-input-block">'+
			'<input :id="id+guid" type="text" :field="field" lay-verify="title" autocomplete="off" class="layui-input" style="padding-right:45px;">'+
			'<a href="#" class="layui-btn inputbutton">...</a>'+
		'</div>'+
	'</div>',

	data : function() {
		return {
			guid : $._GenerateUUID()
		}
	},
	mounted:function(){
		this._addDefineFormInputbuttonObjectScript();
		this._addFormFieldToAjaxForm();
	},
	created : function() {
		this._addFormInputbuttonToMap();
	},
	methods : {
		incrementCounter : function() {
		},
		_addFormInputbuttonToMap:function(){
			var domId=this._getFormInputbuttonDomId();
			var formInputbutton = new FormInputbutton(domId);
			formInputbutton.field=this.field;
			$._AddToLayuiObjectHashMap(domId, formInputbutton);
			
		},
		//添加生命ajaxDataGrid对象脚本
		_addDefineFormInputbuttonObjectScript:function(){
			var domId=this._getFormInputbuttonDomId();
			var $script = $('<script type="text/javascript"></script>');
			$script.append('var ' + this.id + '=$._GetFromLayuiObjectHashMap("' + domId + '");');
			documentWriteHtml = $script.prop("outerHTML");
			$("body").append(documentWriteHtml);
		},
		_getFormInputbuttonDomId:function(){
			var _domId = this.id + this.guid;
			return _domId;
		},
		//将本标签作为ajaxform的一个属性
		_addFormFieldToAjaxForm:function(){
			var domId = this._getFormInputbuttonDomId();
			var formElement=$._GetFromLayuiObjectHashMap(domId);
			
			var ajaxformdom=$("#"+domId).parents(".layui-form");
			var ajaxform=$._GetFromLayuiObjectHashMap(ajaxformdom.attr("id"));
			ajaxform.addFormItem(formElement);
		}
		
	},
})


function FormInputbutton(domId) {
	this.id = domId;
	this.maxlen = null;
	this.readonly = false;
	this.contentalign = "left";
	this.visible = true;
	// this.onclick=function(){};
	this.field = null;
	this.title = null;
	this.type = "text";// 文本框的显示格式,取值为text和password，默认为text
	this.errmsg = "表达式有误";
	this.data="";
	this.setData = function(aData) {
		this.data=aData;
		$("#"+this.id).val(this.data);
	};
	this.setReadonly= function(aReadonly){
		this.readonly=aReadonly;
		$("#"+this.id).attr("readonly",this.readonly);
	};
	this.setVisible= function(aVisible){
		this.visible=aVisible;
		if(aVisible){
			$("#"+this.id).show();
		}
		else{
			$("#"+this.id).hide();
		}
	};
	return this;
}

