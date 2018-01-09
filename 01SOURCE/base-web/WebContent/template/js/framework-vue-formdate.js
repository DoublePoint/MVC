(function($) {
	component(_ConstantComponentMap._FormDate);
})(jQuery);





//// 创建style映射
//var LABEL_ALIGN = "labelalign";
//
//var _ClientStyleMap = {};
//var _ClientStyleArr;
//var _ClientPropsArr = [];// 私有attr
//var _ClientPropsArrAll;
//
//_InitClientStyleArr();// 私有Style属性 值为供用户使用的attr名称
//_InitClientStyleMap();
//_InitClientAllAttrArr();
//Vue.component(_ConstantComponentMap._FormDate, {
//	props : _ClientPropsArrAll,
//	template : '<div class="layui-form-item">' 
//		+ '<label class="layui-form-label">{{title}}</label>' 
//		+ '<div class="layui-input-inline">'
//		+ '<input :id="id+guid" type="text" class="layui-input" lay-verify="title" :field="field" :id="id+guid" :placeholder="placeholder">' 
//		+ ' </div>' + '</div>',
//
//	data : function() {
//		return {
//			guid : $._GenerateUUID()
//		}
//	},
//	mounted : function() {
//		this._MapComponent();
//		$laydate.render({
//			elem : "#" + this._GetComponentDomId(),
//			theme : 'molv'
//		});
//		this._AddToAjaxForm();
//	},
//	created : function() {
//		this._RegisterComponent();
//	},
//	methods : {
//		_RegisterComponent : function() {
//			var domId = this._GetComponentDomId();
//			var formDate = new FormDate(domId);
//			formDate.field = this.field;
//			$._AddToLayuiObjectHashMap(domId, formDate);
//
//		},
//		// 添加生命ajaxDataGrid对象脚本
//		_MapComponent : function() {
//			var documentWriteHtml = "";
//			var domId = this._GetComponentDomId();
//			var $script = $('<script type="text/javascript"></script>');
//			$script.append('var ' + this.id + '=$._GetFromLayuiObjectHashMap("' + domId + '");');
//			documentWriteHtml = $script.prop("outerHTML");
//			$("body").append(documentWriteHtml);
//		},
//		_GetComponentDomId : function() {
//			var _domId = this.id + this.guid;
//			return _domId;
//		},
//		// 将本标签作为ajaxform的一个属性
//		_AddToAjaxForm : function() {
//			var domId = this._GetComponentDomId();
//			var formElement = $._GetFromLayuiObjectHashMap(domId);
//
//			var ajaxformdom = $("#" + domId).parents(".layui-form");
//			var ajaxform = $._GetFromLayuiObjectHashMap(ajaxformdom.attr("id"));
//			ajaxform.addFormItem(formElement);
//		}
//
//	},
//})
//
//function FormDate(domId) {
//	this.id = domId;
//	this.maxlen = null;
//	this.readonly = false;
//	this.contentalign = "left";
//	this.colspan = 1;
//	this.visible = true;
//	this.validtype = "text";// 验证方式
//	// this.onclick=function(){};
//	this.field = null;
//	this.title = null;
//	this.type = "text";// 文本框的显示格式,取值为text和password，默认为text
//	this.errmsg = "表达式有误";
//	this.data = "";
//	this.getColspan = function() {
//		return this.colspan;
//	}
//	this.getInputDom = function() {
//		return $("#" + this.id);
//	}
//	this.getRoot = function() {
//		return $("#" + this.id).parents(".layui-inline");
//	}
//	this.getLabel = function() {
//		return $("#" + this.id).parents(".layui-inline").children("label");
//	}
//	this.setColspan = function(colspan) {
//		this.colspan = colspan;
//	}
//
//	this.setData = function(aData) {
//		this.data = aData;
//		this.getInputDom().val(this.data);
//	};
//	this.setField = function(aField) {
//		this.field = aField;
//	};
//	this.setMaxlen = function(aMaxlen) {
//		this.maxlen = aMaxlen;
//	}
//	this.setLabelText = function(labeltext) {
//		this.getLabel().html(labeltext);
//	}
//	this.setLabelStyle = function(cssKey, cssValue) {
//		this.getLabel().css(cssKey, cssValue);
//	}
//	this.setReadonly = function(aReadonly) {
//		this.readonly = aReadonly;
//		this.getInputDom().attr("readonly", this.readonly);
//	};
//	this.setValidType = function(vatype) {
//		this.validtype = vatype;
//	}
//	this.setVisible = function(aVisible) {
//		this.visible = aVisible;
//	};
//	this.getVisible = function() {
//		return this.visible;
//	};
//	this.addLineStart = function() {
//		this.getRoot().before('<div class="layui-form-item">');
//	}
//	this.addLineEnd = function() {
//		this.getRoot().after('</div>');
//	}
//	this.show = function() {
//		this.getRoot().show();
//	}
//	this.hide = function() {
//		this.getRoot().hide();
//	}
//	return this;
//}
//// 获取私有Style的对应的属性名称
//function _InitClientStyleArr() {
//	_ClientStyleArr = [ LABEL_ALIGN ];
//}
//// 获取私有Style的对应的属性名称[key]:style样式名称[value] 例如 labelalign:text-align
//function _InitClientStyleMap() {
//	_ClientStyleMap[LABEL_ALIGN] = "text-align";
//}
//function _InitClientAllAttrArr() {
//	_ClientPropsArrAll = _ClientStyleArr.concat(_ClientStyleArr, _ConstantFormFieldInheritParams);
//}