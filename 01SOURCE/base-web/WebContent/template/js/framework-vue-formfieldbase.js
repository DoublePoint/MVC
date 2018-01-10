function component(fieldType) {
	var fieldTemplate = "";
	if (_ConstantComponentMap._FormField == fieldType) {
		fieldTemplate = '<div class="layui-inline" >'
				+ '<label class="layui-form-label" :style="labelclientStyle">{{"&nbsp;&nbsp;"+title+"："}}</label>'
				+ '<div class="layui-input-block">'
				+ '<input :id="id+guid" type="text" lay-verify="title" :validtype="validtype" :field="field" :name="field" autocomplete="off" class="layui-input" :placeholder="placeholder" >'
				+ '</div>' + '</div>';
	} else if (_ConstantComponentMap._FormDate == fieldType) {
		fieldTemplate = '<div class="layui-inline">' + '<label class="layui-form-label">{{"&nbsp;&nbsp;"+title+"："}}</label>' + '<div class="layui-input-block">'
				+ '<input :id="id+guid" type="text" class="layui-input" lay-verify="title" :field="field" :id="id+guid" :placeholder="placeholder">' + ' </div>' + '</div>';
	} else if (_ConstantComponentMap._FormInputButton == fieldType) {
		fieldTemplate = '<div class="layui-inline" >' + '<label class="layui-form-label" :style="labelclientStyle">{{"&nbsp;&nbsp;"+title+"："}}</label>'
				+ '<div class="layui-input-block">'
				+ '<input :id="id+guid" type="text" :field="field" lay-verify="title" autocomplete="off" class="layui-input" style="padding-right:38px;"/>'
				+ '<input :id="id+guid+hidden" type="hidden" value="" :name="field" />' + '<a :id="id+guid+a" href="#" class="layui-btn inputbutton">...</a>' + '</div>' + '</div>';
	} else if (_ConstantComponentMap._FormSelect == fieldType) {
		fieldTemplate = '<div class="layui-inline">' + '<label class="layui-form-label" :style="labelclientStyle">{{"&nbsp;&nbsp;"+title+"："}}</label>'
				+ '<div class="layui-input-block" >' + '<select :id="id+guid" :field="field"  :name="field" lay-filter="aihao">' + '</select>'
				+ '<div class="layui-unselect layui-form-select layui-form-selected">' + '<div class="layui-select-title">'
				+ '<input type="text" placeholder="请选择"  value="阅读" readonly=""' + 'class="layui-input layui-unselect">' + '<i class="layui-edge"></i>' + ' </div>'
				+ ' <dl class="layui-anim layui-anim-upbit"  >' + ' <dd lay-value="" class="layui-select-tips">请选择</dd>' + ' <dd lay-value="0" class="">写作</dd>'
				+ ' <dd lay-value="1" class="layui-this">阅读</dd>' + ' <dd lay-value="2" class="">游戏</dd>' + '</dl>' + '</div>'

				+ '</div>' + '</div>';
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
		beforeMount : function() {
			// 将formfield添加到form中
			this._AddToAjaxForm();
			var ajaxformDomId = this.$parent._GetComponentDomId();
			var ajaxform = $._GetFromLayuiObjectHashMap(ajaxformDomId);
			ajaxform.addLine();
		},
		mounted : function() {
			this._MapComponent();
			this._SetStyle();
			if (_ConstantComponentMap._FormInputButton == fieldType) {
				this._InitInputbuttonOnClick();// 初始化鼠标单击事件
			} else if (_ConstantComponentMap._FormDate == fieldType) {
				this._InitDateOnClick();// 初始化日期控件
			} else if (_ConstantComponentMap._FormSelect == fieldType) {
				this._InitSelectOnClick();// 初始化select
				this._InitSelectMouseEnter();
				this._InitSelectMouseOut();
				this._InitSelectInputOnClick();
				this._InitSelectInputMouseOut();
				
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
				var ajaxformDomId = this.$parent._GetComponentDomId();
				var ajaxform = $._GetFromLayuiObjectHashMap(ajaxformDomId);
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

				for ( var attrName in formField) {
					if (this[attrName] != null)
						formField[attrName] = this[attrName];
				}
				formField.setFieldType(fieldType);
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

			/* date */
			_InitDateOnClick : function() {
				$laydate.render({
					elem : "#" + this._GetComponentDomId(),
					theme : 'molv'
				});
			},
			/* select */
			_InitSelectOnClick : function() {
				var domId = this._GetComponentDomId();
				var formField = new FormField(domId);
				formField.getSelectDl().children("dd").click(function() {
					formField.getSelectDl().children().removeClass();
					clearTimeout(timeoutInterval);
					$(this).addClass("layui-this");
					$(this).parent().hide();
				})
			},
			_InitSelectMouseEnter : function() {
				var domId = this._GetComponentDomId();
				var formField = new FormField(domId);
				formField.getSelectDl().children("dd").mouseenter(function() {
					clearTimeout(timeoutInterval);
				})
			},
			_InitSelectMouseOut : function() {
				var domId = this._GetComponentDomId();
				var formField = new FormField(domId);
				formField.getSelectDl().mouseout(function() {
					timeoutInterval=setTimeout(function() {
						formField.getSelectDl().hide()
					}, 1000);
				});
			},
			_InitSelectInputOnClick : function() {
				var domId = this._GetComponentDomId();
				var formField = new FormField(domId);
				formField.getSelectInput().click(function() {
					formField.getSelectDl().show();
				});
			},
			_InitSelectInputMouseOut : function(){
				/*var domId = this._GetComponentDomId();
				var formField = new FormField(domId);
				formField.getSelectInput().mouseout(function() {
					timeoutInterval=setTimeout(function() {
						formField.getSelectDl().hide()
					}, 1000);
				});*/
			}
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
	this.fieldType = "";
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
	this.getSelectDl = function() {
		return this.getInputDom().next().children("dl");
	}
	this.getSelectInput = function() {
		return this.getInputDom().next().children("div").children("input");
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
	this.setFieldType = function(aFieldType) {
		this.fieldType = aFieldType;
	};
	this.setMaxlen = function(aMaxlen) {
		this.maxlen = aMaxlen;
	}
	this.setInputStyle = function(cssKey, cssValue) {
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
	this.setRootStyle = function(cssKey, cssValue) {
		this.getRoot().css(cssKey, cssValue);
	}
	this.setWidthByColproportion = function(linewidthPercent, itemColproportion) {
		/* 避免浏览器闪现调整过程，那么需要对数据进行宽度的设置 首先为0 然后显示 */
		if (itemColproportion.length >= 2) {
			var labelPercent = null;
			var inputPercent = null;
			var totalWidthPercent = parseInt(itemColproportion[0]) + parseInt(itemColproportion[1]);
			// 舍掉后面两位小数
			labelPercent = parseInt(itemColproportion[0]) / totalWidthPercent;
			inputPercent = parseInt(itemColproportion[1]) / totalWidthPercent;
			this.setLabelStyle("display", "inline-block");
			this.setInputStyle("padding-left", "10px");
			if (this.fieldType == _ConstantComponentMap._FormSelect) {
				this.getSelectDl().css("width", inputPercent * 100 + "%");
				this.getSelectDl().css("left", labelPercent * 100 + "%");
				this.getSelectInput().css("width", inputPercent * 100 + "%");
				this.getSelectInput().show();
			} else {
				this.setInputStyle("display", "inline-block");
			}
			this.setLabelStyle("width", labelPercent * 100 + "%");
			this.setInputStyle("width", inputPercent * 100 + "%");
		}
		if (linewidthPercent != null) {
			this.setRootStyle("width", linewidthPercent * 100 + "%");
		}
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
