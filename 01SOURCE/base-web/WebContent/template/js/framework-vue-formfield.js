(function($) {
	// 创建style映射
	var LABEL_ALIGN = "labelalign";

	var _ClientStyleMap = {};
	var _ClientStyleArr;
	var _ClientPropsArr = [];// 私有attr
	var _ClientPropsArrAll;

	_InitClientStyleArr();// 私有Style属性 值为供用户使用的attr名称
	_InitClientStyleMap();
	_InitClientAllAttrArr();

	Vue
			.component(
					_ConstantComponentMap._FormField,
					{
						props : _ClientPropsArrAll,
						template : '<div class="layui-inline">'
								+ '<label class="layui-form-label" :style="labelclientStyle">{{title}}</label>'
								+ '<div class="layui-input-block">'
								+ '<input :id="id+guid" type="text" lay-verify="title" :validtype="validtype" :field="field" :name="field" autocomplete="off" class="layui-input" :placeholder="placeholder" >'
								+ '</div>' + '</div>',

						data : function() {
							var labelclientStyleBuffer = $._CreateStringBuffer();
							for (clientStyleName in _ClientStyleArr) {
								var stylekey = _ClientStyleArr[clientStyleName];
								// 设置label样式
								if (this[stylekey] != null) {
									var labelalignbuffer = $._CreateStyleBuffer(_ClientStyleMap[stylekey], this[stylekey]);
									labelclientStyleBuffer.append(labelalignbuffer.toString());
								}
							}
							// // 设置label样式
							// if (this.labelalign != null) {
							// var labelalignbuffer =
							// $._CreateStyleBuffer("text-align",
							// this.labelalign);
							// labelclientStyleBuffer.append(labelalignbuffer.toString());
							// }
							return {
								labelclientStyle : labelclientStyleBuffer.toString(),
								guid : $._GenerateUUID(),
							}
						},
						mounted : function() {
							this._AddDefineFormFieldObjectScript();
							var errMsg = this.errmsg;
							var maxlen = this.maxlen;
							//将formfield添加到form中
							this._AddFormFieldToAjaxForm();
						},
						created : function() {
							this._AddFormFieldToMap();
						},
						methods : {
							_AddFormFieldToMap : function() {
								var domId = this._GetFormFieldDomId();
								var formField = new FormField(domId);
								formField.maxlen = this.maxlen;
								if (this.colspan != null)
									formField.setColspan(this.colspan);
								formField.field = this.field;
								if (this.validtype != null)
									formField.setValidType(this.validtype);
								if (this.errmsg != null) {
									formField.errmsg = this.errmsg;
								}
								$._AddToLayuiObjectHashMap(domId, formField);
							},
							// 添加生命ajaxDataGrid对象脚本
							_AddDefineFormFieldObjectScript : function() {
								var documentWriteHtml = "";
								var domId = this._GetFormFieldDomId();
								var $script = $('<script type="text/javascript"></script>');
								$script.append('var ' + this.id + '=$._GetFromLayuiObjectHashMap("' + domId + '");');
								documentWriteHtml = $script.prop("outerHTML");
								$("body").append(documentWriteHtml);
							},
							_GetFormFieldDomId : function() {
								var _domId = this.id + this.guid;
								return _domId;
							},
							// 将本标签作为ajaxform的一个属性
							_AddFormFieldToAjaxForm : function() {
								var domId = this._GetFormFieldDomId();
								var formElement = $._GetFromLayuiObjectHashMap(domId);

								var ajaxformdom = $("#" + domId).parents(".layui-form");
								var ajaxform = $._GetFromLayuiObjectHashMap(ajaxformdom.attr("id"));
								ajaxform.addFormItem(formElement);
							}
						},
					})

	function FormField(domId) {
		this.id = domId;
		this.maxlen = null;
		this.readonly = false;
		this.contentalign = "left";
		this.colspan=1;
		this.visible = true;
		this.validtype = "text";// 验证方式
		// this.onclick=function(){};
		this.field = null;
		this.title = null;
		this.type = "text";// 文本框的显示格式,取值为text和password，默认为text
		this.errmsg = "表达式有误";
		this.data = "";
		this.getInputDom = function() {
			return $("#" + this.id);
		}
		this.getRoot=function(){
			return $("#" + this.id).parents(".layui-inline");
		}
		this.getLabel = function() {
			return $("#" + this.id).parents(".layui-inline").children("label");
		}
		this.setValidType = function(vatype) {
			this.validtype = vatype;
		}
		this.setData = function(aData) {
			this.data = aData;
			this.getInputDom().val(this.data);
		};
		this.setReadonly = function(aReadonly) {
			this.readonly = aReadonly;
			this.getInputDom().attr("readonly", this.readonly);
		};
		this.setVisible = function(aVisible) {
			this.visible = aVisible;
			if (aVisible) {
				this.getInputDom().show();
			} else {
				this.getInputDom().hide();
			}
		};
		this.setLabelText = function(labeltext) {
			this.getLabel().html(labeltext);
		}
		this.setLabelStyle = function(cssKey, cssValue) {
			this.getLabel().css(cssKey, cssValue);
		}
		this.setColspan=function(colspan){
			this.colspan=colspan;
		}
		this.getColspan=function(){
			return this.colspan;
		}
		this.addLineStart=function(){
			this.getRoot().before('<div class="layui-form-item">' );
		}
		this.addLineEnd=function(){
			this.getRoot().after('</div>' );
		}
		return this;
	}

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
})(jQuery);