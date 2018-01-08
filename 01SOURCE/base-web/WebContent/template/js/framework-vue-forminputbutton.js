var documentWriteHtml = "";
Vue.component(_ConstantComponentMap._FormInputButton, {
	props : [ 'id', 'onclick','field','title','colspan'],
	template : 
	'<div class="layui-inline">'+
		'<label class="layui-form-label">{{title}}</label>'+
		'<div class="layui-input-block">'+
			'<input :id="id+guid" type="text" :field="field" lay-verify="title" autocomplete="off" class="layui-input" style="padding-right:38px;"/>'+
			'<input :id="id+guid+hidden" type="hidden" value="" :name="field" />'+
			'<a :id="id+guid+a" href="#" class="layui-btn inputbutton">...</a>'+
		'</div>'+
	'</div>',

	data : function() {
		return {
			hidden:"hidden",
			a:"a",
			guid : $._GenerateUUID()
		}
	},
	mounted:function(){
		this._AddDefineFormInputbuttonObjectScript();
		this._AddFormFieldToAjaxForm();
		this._InitOnClick();//初始化鼠标单击事件
	},
	created : function() {
		this._AddFormInputbuttonToMap();
	},
	methods : {
		_AddFormInputbuttonToMap:function(){
			var domId=this._GetFormInputbuttonDomId();
			var formInputbutton = new FormInputbutton(domId);
			formInputbutton.field=this.field;
			if (this.colspan != null)
				formInputbutton.setColspan(this.colspan);
			$._AddToLayuiObjectHashMap(domId, formInputbutton);
			
		},
		//添加生命ajaxDataGrid对象脚本
		_AddDefineFormInputbuttonObjectScript:function(){
			var domId=this._GetFormInputbuttonDomId();
			var $script = $('<script type="text/javascript"></script>');
			$script.append('var ' + this.id + '=$._GetFromLayuiObjectHashMap("' + domId + '");');
			documentWriteHtml = $script.prop("outerHTML");
			$("body").append(documentWriteHtml);
		},
		_GetFormInputbuttonDomId:function(){
			var _domId = this.id + this.guid;
			return _domId;
		},
		_GetFormInputbuttonADomId:function(){
			var _domId = this.id + this.guid + this.a;
			return _domId;
		},
		//将本标签作为ajaxform的一个属性
		_AddFormFieldToAjaxForm:function(){
			var domId = this._GetFormInputbuttonDomId();
			var formElement=$._GetFromLayuiObjectHashMap(domId);
			
			var ajaxformdom=$("#"+domId).parents(".layui-form");
			var ajaxform=$._GetFromLayuiObjectHashMap(ajaxformdom.attr("id"));
			ajaxform.addFormItem(formElement);
		},
		_InitOnClick:function(){
			var aClickId=this._GetFormInputbuttonADomId();
			var onclick=this.onclick;
			$("#"+aClickId).click(function(){
				if(onclick==null) return;
				$._Eval(onclick);
			});
		}
	},
})


function FormInputbutton(domId) {
	this.id = domId;
	this.maxlen = null;
	this.readonly = false;
	this.contentalign = "left";
	this.colspan=1;
	this.visible = true;
	// this.onclick=function(){};
	this.field = null;
	this.title = null;
	this.type = "text";// 文本框的显示格式,取值为text和password，默认为text
	this.errmsg = "表达式有误";
	this.data="";
	this.key="";
	this.setData = function(aKey,aValue) {
		this.key=aKey;
		this.data=aValue;
		this.getInputDom().val(this.data);
		$("#"+this.id+"hidden").val(this.key);
	};
	this.setReadonly= function(aReadonly){
		this.readonly=aReadonly;
		this.getInputDom().attr("readonly",this.readonly);
	};
	this.setVisible= function(aVisible){
		this.visible=aVisible;
		if(aVisible){
			this.getInputDom().show();
		}
		else{
			this.getInputDom().hide();
		}
	};
	this.setColspan=function(colspan){
		this.colspan=colspan;
	}
	this.getColspan=function(){
		return this.colspan;
	}
	this.getInputDom = function() {
		return $("#" + this.id);
	}
	this.getRoot=function(){
		return this.getInputDom().parents(".layui-inline");
	}
	this.getLabel = function() {
		return this.getRoot().children("label");
	}
	this.addLineStart=function(){
		this.getRoot().before('<div class="layui-form-item">' );
	}
	this.addLineEnd=function(){
		this.getRoot().after('</div>' );
	}
	return this;
}

