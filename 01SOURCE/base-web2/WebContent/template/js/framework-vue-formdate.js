var documentWriteHtml = "";
Vue.component(_ConstantComponentMap._FormDate, {
	props : [ 'id', 'onrowclick','field','title','placeholder'],
	template : 
	'<div class="layui-form-item">'+
    	'<label class="layui-form-label">{{title}}</label>'+
    	'<div class="layui-input-inline">'+
    		'<input :id="id+guid" type="text" class="layui-input" lay-verify="title" :field="field" :id="id+guid" :placeholder="placeholder">'+
    	' </div>'+
    '</div>',

	data : function() {
		return {
			guid : $._GenerateUUID()
		}
	},
	mounted:function(){
		this._addDefineFormDateObjectScript();
		$laydate.render({
		    elem: "#"+this._getFormDateDomId()
		    ,theme: 'molv'
		});
		this._addFormFieldToAjaxForm();
	},
	created : function() {
		this._addFormDateToMap();
	},
	methods : {
		incrementCounter : function() {
		},
		_addFormDateToMap:function(){
			var domId=this._getFormDateDomId();
			var formDate = new FormDate(domId);
			formDate.field=this.field;
			$._AddToLayuiObjectHashMap(domId, formDate);
			
		},
		//添加生命ajaxDataGrid对象脚本
		_addDefineFormDateObjectScript:function(){
			var domId=this._getFormDateDomId();
			var $script = $('<script type="text/javascript"></script>');
			$script.append('var ' + this.id + '=$._GetFromLayuiObjectHashMap("' + domId + '");');
			documentWriteHtml = $script.prop("outerHTML");
			$("body").append(documentWriteHtml);
		},
		_getFormDateDomId:function(){
			var _domId = this.id + this.guid;
			return _domId;
		},
		//将本标签作为ajaxform的一个属性
		_addFormFieldToAjaxForm:function(){
			var domId = this._getFormDateDomId();
			var formElement=$._GetFromLayuiObjectHashMap(domId);
			
			var ajaxformdom=$("#"+domId).parents(".layui-form");
			var ajaxform=$._GetFromLayuiObjectHashMap(ajaxformdom.attr("id"));
			ajaxform.addFormItem(formElement);
		}
		
	},
})


function FormDate(domId) {
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

