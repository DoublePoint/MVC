function component(fieldType) {
	var fieldTemplate = "";
	if (_ConstantComponentMap._FormField == fieldType) {
		fieldTemplate = '<div class="layui-inline">'
				+ '<label class="layui-form-label" :style="labelclientStyle">{{title}}</label>'
				+ '<div class="layui-input-block">'
				+ '<input :id="id+guid" type="text" lay-verify="title" :validtype="validtype" :field="field" :name="field" autocomplete="off" class="layui-input" :placeholder="placeholder" >'
				+ '</div>' + '</div>';
	} else if (_ConstantComponentMap._FormDate == fieldType) {
		fieldTemplate = '<div class="layui-form-item">' + '<label class="layui-form-label">{{title}}</label>' + '<div class="layui-input-inline">'
				+ '<input :id="id+guid" type="text" class="layui-input" lay-verify="title" :field="field" :id="id+guid" :placeholder="placeholder">' + ' </div>' + '</div>';
	} else if (_ConstantComponentMap._FormInputButton == fieldType) {
		fieldTemplate = '<div class="layui-inline">' + '<label class="layui-form-label" :style="labelclientStyle">{{title}}</label>' + '<div class="layui-input-block">'
				+ '<input :id="id+guid" type="text" :field="field" lay-verify="title" autocomplete="off" class="layui-input" style="padding-right:38px;"/>'
				+ '<input :id="id+guid+hidden" type="hidden" value="" :name="field" />' + '<a :id="id+guid+a" href="#" class="layui-btn inputbutton">...</a>' + '</div>' + '</div>';
	}

	// 创建style映射
	var LABEL_ALIGN = "labelalign";

	var _ClientStyleMap = {};
	var _ClientStyleArr;
	var _ClientPropsArr = [];// 私有attr
	var _ClientPropsArrAll;

	_InitClientStyleArr();// 私有Style属性 值为供用户使用的attr名称
	_InitClientStyleMap();
	_InitClientAllAttrArr();
	Vue.component(fieldType, {
		props : _ClientPropsArrAll,
		template : fieldTemplate,

		data : function() {
			// 设置label样式
			var labelclientStyleBuffer = $._CreateStringBuffer();
			for (clientStyleName in _ClientStyleArr) {
				var stylekey = _ClientStyleArr[clientStyleName];
				if (this[stylekey] != null) {
					var labelalignbuffer = $._CreateStyleBuffer(_ClientStyleMap[stylekey], this[stylekey]);
					labelclientStyleBuffer.append(labelalignbuffer.toString());
				}
			}
			return {
				hidden : "hidden",
				a : "a",
				labelclientStyle : labelclientStyleBuffer.toString(),
				guid : $._GenerateUUID(),
			}
		},
		mounted : function() {
			this._MapComponent();
			// 将formfield添加到form中
			this._AddToAjaxForm();
			this._SetStyle();

			if (_ConstantComponentMap._FormInputButton == fieldType) {
				this._InitInputbuttonOnClick();// 初始化鼠标单击事件
			}
		},
		created : function() {
			this._RegisterComponent();
		},
		methods : {
			// 将本标签作为ajaxform的一个属性
			_AddToAjaxForm : function() {
				var domId = this._GetComponentDomId();
				var formElement = $._GetFromLayuiObjectHashMap(domId);
				var ajaxformdom = $("#" + domId).parents(".layui-form");
				var ajaxform = $._GetFromLayuiObjectHashMap(ajaxformdom.attr("id"));
				ajaxform.addFormItem(formElement);
			},
			_GetComponentDomId : function() {
				var _domId = this.id + this.guid;
				return _domId;
			},
			// 添加生命ajaxDataGrid对象脚本
			_MapComponent : function() {
				var documentWriteHtml = "";
				var domId = this._GetComponentDomId();
				var $script = $('<script type="text/javascript"></script>');
				$script.append('var ' + this.id + '=$._GetFromLayuiObjectHashMap("' + domId + '");');
				documentWriteHtml = $script.prop("outerHTML");
				$("body").append(documentWriteHtml);
			},
			_RegisterComponent : function() {
				var domId = this._GetComponentDomId();
				var formField = new FormField(domId);
				// if (this.maxlen != null)
				// formField.setMaxlen(this.maxlen);
				// if (this.colspan != null)
				// formField.setColspan(this.colspan);
				// if (this.field != null)
				// formField.setField(this.field);
				// if (this.validtype != null)
				// formField.setValidType(this.validtype);
				// if (this.errmsg != null)
				// formField.errmsg = this.errmsg;
				// if (this.visible != null)
				// formField.setVisible(this.visible);
				// var obj=this;
				// var arr =Object.getOwnPropertyNames(formField);
				// for ( var attrName in arr) {
				// if (this[arr[attrName]] != null)
				// formField[attrName] = this[arr[attrName]];
				// }

				for ( var attrName in formField) {
					if (this[attrName] != null)
						formField[attrName] = this[attrName];
				}
				$._AddToLayuiObjectHashMap(domId, formField);
			},

			_SetStyle : function() {
				if (this.visible != null) {
					var domId = this._GetComponentDomId();
					var formElement = $._GetFromLayuiObjectHashMap(domId);
					if ((this.visible + "").toLowerCase() == "true") {
						formElement.show();
					} else {
						formElement.hide();
					}
				}
			},

			/* input-button */
			_GetFormInputbuttonADomId : function() {
				var _domId = this.id + this.guid + this.a;
				return _domId;
			},
			_InitInputbuttonOnClick : function() {
				var aClickId = this._GetFormInputbuttonADomId();
				var onclick = this.onclick;
				$("#" + aClickId).click(function() {
					if (onclick == null)
						return;
					$._Eval(onclick);
				});
			},
		},
	});
	// 获取私有Style的对应的属性名称
	function _InitClientStyleArr() {
		_ClientStyleArr = [ LABEL_ALIGN ];
	}
	// 获取私有Style的对应的属性名称[key]:style样式名称[value] 例如 labelalign:text-align
	function _InitClientStyleMap() {
		_ClientStyleMap[LABEL_ALIGN] = "text-align";
	}
	function _InitClientAllAttrArr() {
		_ClientPropsArrAll = _ClientStyleArr.concat(_ClientStyleArr, _ConstantFormFieldInheritParams);
	}
}

function FormField(domId) {
	this.domId = domId;
	this.maxlen = null;
	this.readonly = false;
	this.contentalign = "left";
	this.colspan = 1;
	this.visible = true;
	this.validtype = "text";// 验证方式
	// this.onclick=function(){};
	this.field = null;
	this.title = null;
	this.type = "text";// 文本框的显示格式,取值为text和password，默认为text
	this.errmsg = "表达式有误";
	this.data = "";
	this.getColspan = function() {
		return this.colspan;
	}
	this.getInputDom = function() {
		return $("#" + this.domId);
	}
	this.getRoot = function() {
		return this.getInputDom().parents(".layui-inline");
	}
	this.getLabel = function() {
		return this.getInputDom().parents(".layui-inline").children("label");
	}
	this.setColspan = function(colspan) {
		this.colspan = colspan;
	}

	this.setData = function(aData) {
		this.data = aData;
		this.getInputDom().val(this.data);
	};
	this.setField = function(aField) {
		this.field = aField;
	};
	this.setMaxlen = function(aMaxlen) {
		this.maxlen = aMaxlen;
	}
	this.setInputStyle=function(cssKey,cssValue){
		this.getInputDom().css(cssKey, cssValue);
	}
	this.setLabelText = function(labeltext) {
		this.getLabel().html(labeltext);
	}
	this.setLabelStyle = function(cssKey, cssValue) {
		this.getLabel().css(cssKey, cssValue);
	}
	this.setReadonly = function(aReadonly) {
		this.readonly = aReadonly;
		this.getInputDom().attr("readonly", this.readonly);
	};
	this.setRootStyle=function(cssKey,cssValue){
		this.getRoot().css(cssKey, cssValue);
	}
	this.setWidthByColproportion = function(linewidth,itemColproportion) {
		linewidth=linewidth-1;//减少四舍五入的误差
		if(itemColproportion.length==2){
			var labelPercent=null;
			var inputPercent=null;
			var totalWidthPercent=parseInt(itemColproportion[0])+parseInt(itemColproportion[1]);
			/*var labelPaddingMarginWidth=30;
			var inputPaddingMarginWidth=12;*/
			var labelPaddingMarginWidth=5;//5:layui-inline的左右margin
			var inputPaddingMarginWidth=5;
			labelPercent=parseInt(itemColproportion[0])/totalWidthPercent*linewidth-labelPaddingMarginWidth+"px";
			inputPercent=parseInt(itemColproportion[1])/totalWidthPercent*linewidth-inputPaddingMarginWidth+"px";
			this.setLabelStyle("width",labelPercent);
			this.setInputStyle("width",inputPercent);
		}
		if(linewidth!=null){
			this.setRootStyle("width",linewidth+"px");
		}
//		else if(labelwidth!=null){
//			this.setRootStyle((labelwidth)*100+"%");
//			this.setLabelStyle("width",labelwidth);
//		}
//		if(inputwidth!=null){
//			this.setRootStyle((inputwidth)*100+"%");
//			this.setInputStyle("width",inputwidth);
//		}
	}
	this.setValidType = function(vatype) {
		this.validtype = vatype;
	}
	this.setVisible = function(aVisible) {
		this.visible = aVisible;
	};
	this.getVisible = function() {
		return this.visible;
	};
	this.addLineStart = function() {
		this.getRoot().before('<div class="layui-form-item">');
	}
	this.addLineEnd = function() {
		this.getRoot().after('</div>');
	}
	this.show = function() {
		this.getRoot().show();
	}
	this.hide = function() {
		this.getRoot().hide();
	}
	return this;
}
