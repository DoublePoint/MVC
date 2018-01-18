var timeoutInterval = null;
function component(fieldType,fieldTemplate) {
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
		created : function() {
			this._RegisterComponent();
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
				this._InitSelectMouseLeave();
				this._InitSelectInputOnClick();
				this._InitSelectInputMouseLeave();
				this._InitSelectInputMouseEnter();
			}
//			$("#"+this._GetComponentDomId()).bind("blur",function(){
//				alert(2)
//			});
		},
		
		methods : {
			// 将本标签作为ajaxform的一个属性
			_AddToAjaxForm : function() {
				var formField = this._GetFormFieldX();
				var ajaxformDomId = this.$parent._GetComponentDomId();
				var ajaxform = $._GetFromLayuiObjectHashMap(ajaxformDomId);
				ajaxform.addFormItem(formField);
			},
			_GetComponentDomId : function() {
				var _domId = this.id + this.guid;
				return _domId;
			},
			_GetFormFieldX :function(){
				var domId = this._GetComponentDomId();
				var aFormFieldX = $._GetFromLayuiObjectHashMap(domId);
				return aFormFieldX;
			},
			// 添加生命ajaxDataGrid对象脚本
			_MapComponent : function() {
				$._OutputMapCompoment(this);
			},
			_RegisterComponent : function() {
				var domId = this._GetComponentDomId();
				var formField;
				if (fieldType == _ConstantComponentMap._FormField) 
					formField = new FormField(domId);
				else if (fieldType == _ConstantComponentMap._FormSelect) 
					formField = new FormSelect(domId);
				else if (fieldType == _ConstantComponentMap._FormDate) 
					formField = new FormDate(domId);
				else if (fieldType == _ConstantComponentMap._FormInputButton) 
					formField = new FormInputButton(domId);
				else if (fieldType == _ConstantComponentMap._FormToolbar) 
					formField = new FormToolbar(domId);
				else
					formField = new FormFieldBase(domId);
				
				for ( var attrName in formField) {
					if (this[attrName] != null)
						formField[attrName] = this[attrName];
				}
				formField.setFieldType(fieldType);
				formField.setParentAjaxFormId(this.$parent._GetComponentDomId());
				$._AddToLayuiObjectHashMap(domId, formField);
			},

			_SetStyle : function() {
				if (this.visible != null) {
					var formField = this._GetFormFieldX();
					if ((this.visible + "").toLowerCase() == "true") {
						formField.show();
					} else {
						formField.hide();
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

			/* date start */
			_InitDateOnClick : function() {
				$laydate.render({
					elem : "#" + this._GetComponentDomId(),
					theme : 'molv'
				});
			},
			/* select */
			_InitSelectOnClick : function() {
				var formField = this._GetFormFieldX();
				formField.getSelectDl().children("dd").click(function() {
					formField.removeSelectDdClass();
					formField.clearTimeoutInterval();
					$(this).addClass("layui-this");
					formField.hideSelectDl();
					formField.getSelectInput().val($(this).text());
					formField.getSelectHidden().val($(this).attr("lay-value"));
					// formField.getSelectDl().toggleClass("layui-form-selected");
				})
			},
			_InitSelectMouseEnter : function() {
				var formField = this._GetFormFieldX();
				formField.getSelectDl().mouseenter(function() {
					formField.clearTimeoutInterval();
				})
			},
			_InitSelectMouseLeave : function() {
				var formField = this._GetFormFieldX();
				formField.getSelectDl().mouseleave(function() {
					formField.setTimeoutInterval(setTimeout(function() {
						formField.hideSelectDl();
					}, 300));
				});
			},
			_InitSelectInputOnClick : function() {
				var formField = this._GetFormFieldX();
				formField.getSelectInput().click(function() {
					formField.getSelectDiv().toggleClass("layui-form-selected");
					if(formField.getSelectDiv().hasClass("layui-form-selected"))
						formField.showSelectDl();
					else
						formField.hideSelectDl();
				});
			},
			_InitSelectInputMouseLeave : function() {
				var formField = this._GetFormFieldX();
				formField.getSelectInput().mouseleave(function() {
					formField.setTimeoutInterval(setTimeout(function() {
						formField.hideSelectDl();
					}, 300));
				});
			},
			_InitSelectInputMouseEnter : function() {
				var formField = this._GetFormFieldX();
				formField.getSelectInput().mouseenter(function() {
					formField.clearTimeoutInterval();
				})
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

function FormFieldBase(domId) {
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
	this.timeoutInterval=null;
	this.type = "text";// 文本框的显示格式,取值为text和password，默认为text
	this.errmsg = "表达式有误";
	this.data = "";
	this.isChanged=false;
	this.parentAjaxFormId="";
	this.getDomId = function(){
		return this.domId;
	}
	this.getColspan = function() {
		return this.colspan;
	}
	this.getField = function(){
		return this.field;
	}
	this.getData = function(){
		return this.data;
	}
	this.getDomValue = function(){
		return this.getInputDom().val();
	}
	this.getInputDom = function() {
		return $("#" + this.domId);
	}
	this.getIsChanged = function(){
		if(!this.isChanged){
			if(this.getInputDom()==null)
				return this.isChanged;
			if(this.getData()!=this.getDomValue()){
				this.isChanged=true;
			}
		}
		return this.isChanged;
	}
	this.getParentAjaxFormId = function(){
		return this.parentAjaxFormId;
	}
	this.getParentAjaxForm = function(){
		return $._GetFromLayuiObjectHashMap(this.parentAjaxFormId);
	}
	this.getRoot = function() {
		return this.getInputDom().parents(".layui-inline");
	}
	this.getTimeoutInterval = function(){
		return this.timeoutInterval;
	}
	this.getLabel = function() {
		return this.getInputDom().parents(".layui-inline").children("label");
	}
	this.setColspan = function(colspan) {
		this.colspan = colspan;
	}
	this.setData = function(aData,isChanged) {
		//如果第二个参数为nul,那么如果数据改变时 设置为改变 只要是改变一次 那么就永久改变了
		if(isChanged==null){
			if(this.data!=aData)
				isChanged=true;
		}
		this.data = aData;
		this.getInputDom().val(this.data);
		if(isChanged.toString().toLowerCase()=='true')
			this.showParentNotSave();
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
	this.setParentAjaxFormId = function(aParentAjaxFormId){
		this.parentAjaxFormId = aParentAjaxFormId;
	}
	this.setInputStyle = function(cssKey, cssValue) {
		this.getInputDom().css(cssKey, cssValue);
	}
	this.setIsChanged = function(aIsChanged){
		this.isChanged=aIsChanged;
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
	this.setTimeoutInterval = function(aTimeoutInterval){
		return this.timeoutInterval=aTimeoutInterval;
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
	this.showParentNotSave = function(){
		this.getParentAjaxForm().showNotSave();
	}
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
