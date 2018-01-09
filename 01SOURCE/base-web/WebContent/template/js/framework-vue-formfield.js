(function($) {
	component(_ConstantComponentMap._FormField);
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
//
//Vue
//		.component(
//				_ConstantComponentMap._FormField,
//				{
//					props : _ClientPropsArrAll,
//					template : '<div class="layui-inline">'
//							+ '<label class="layui-form-label" :style="labelclientStyle">{{title}}</label>'
//							+ '<div class="layui-input-block">'
//							+ '<input :id="id+guid" type="text" lay-verify="title" :validtype="validtype" :field="field" :name="field" autocomplete="off" class="layui-input" :placeholder="placeholder" >'
//							+ '</div>' + '</div>',
//
//					data : function() {
//						// 设置label样式
//						var labelclientStyleBuffer = $._CreateStringBuffer();
//						for (clientStyleName in _ClientStyleArr) {
//							var stylekey = _ClientStyleArr[clientStyleName];
//							if (this[stylekey] != null) {
//								var labelalignbuffer = $._CreateStyleBuffer(_ClientStyleMap[stylekey], this[stylekey]);
//								labelclientStyleBuffer.append(labelalignbuffer.toString());
//							}
//						}
//						return {
//							labelclientStyle : labelclientStyleBuffer.toString(),
//							guid : $._GenerateUUID(),
//						}
//					},
//					mounted : function() {
//						this._MapComponent();
//						// 将formfield添加到form中
//						this._AddToAjaxForm();
//						this._SetStyle();
//					},
//					created : function() {
//						this._RegisterComponent();
//					},
//					methods : {
//						_RegisterComponent : function() {
//							var domId = this._GetComponentDomId();
//							var formField = new FormField(domId);
//
//							if (this.maxlen != null)
//								formField.setMaxlen(this.maxlen);
//							if (this.colspan != null)
//								formField.setColspan(this.colspan);
//							if (this.field != null)
//								formField.setField(this.field);
//							if (this.validtype != null)
//								formField.setValidType(this.validtype);
//							if (this.errmsg != null)
//								formField.errmsg = this.errmsg;
//							if (this.visible != null)
//								formField.setVisible(this.visible);
//
//							$._AddToLayuiObjectHashMap(domId, formField);
//						},
//						// 添加生命ajaxDataGrid对象脚本
//						_MapComponent : function() {
//							var documentWriteHtml = "";
//							var domId = this._GetComponentDomId();
//							var $script = $('<script type="text/javascript"></script>');
//							$script.append('var ' + this.id + '=$._GetFromLayuiObjectHashMap("' + domId + '");');
//							documentWriteHtml = $script.prop("outerHTML");
//							$("body").append(documentWriteHtml);
//						},
//						_GetComponentDomId : function() {
//							var _domId = this.id + this.guid;
//							return _domId;
//						},
//						// 将本标签作为ajaxform的一个属性
//						_AddToAjaxForm : function() {
//							var domId = this._GetComponentDomId();
//							var formElement = $._GetFromLayuiObjectHashMap(domId);
//							var ajaxformdom = $("#" + domId).parents(".layui-form");
//							var ajaxform = $._GetFromLayuiObjectHashMap(ajaxformdom.attr("id"));
//							ajaxform.addFormItem(formElement);
//						},
//						_SetStyle : function() {
//							if (this.visible != null) {
//								var domId = this._GetComponentDomId();
//								var formElement = $._GetFromLayuiObjectHashMap(domId);
//								if ((this.visible + "").toLowerCase() == "true") {
//									formElement.show();
//								} else {
//									formElement.hide();
//								}
//							}
//						}
//
//					},
//				});
//
//function FormField(domId) {
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
//
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