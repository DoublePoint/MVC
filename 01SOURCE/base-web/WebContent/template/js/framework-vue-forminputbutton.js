(function($) {
	var componentTemplate = '<div class="layui-inline" >' + '<label class="layui-form-label" :style="labelclientStyle">{{"&nbsp;&nbsp;"+title+"："}}</label>'
			+ '<div class="layui-input-block">'
			+ '<input :id="id+guid" type="text" :field="field" lay-verify="title" autocomplete="off" class="layui-input" style="padding-right:38px;"/>'
			+ '<input :id="id+guid+hidden" type="hidden" value="" :name="field" />' + '<a :id="id+guid+a" href="#" class="layui-btn inputbutton">...</a>' + '</div>' + '</div>';
	component(_ConstantComponentMap._FormInputButton,componentTemplate);
})(jQuery);

function FormInputButton(domId) {
	FormFieldBase.call(this);
	this.domId = domId;
	this.fieldKey = null;
	this.fieldValue = null;
	this.setData = function(aKey, isChanged,aKey) {
		//如果第二个参数为nul,那么如果数据改变时 设置为改变 只要是改变一次 那么就永久改变了
		if(isChanged==null){
			if(this.fieldKey!=aKey||this.fieldValue!=aValue)
				isChanged=true;
		}
		this.getInputDom().val(aValue);
		this.setInputHiddenDomValue(aKey);
		if(isChanged.toString().toLowerCase()=='true')
			this.showParentNotSave();
	};

	this.getInputHiddenDom = function() {
		return $("#" + this.domId).next();
	}
	this.setInputDomValue = function(aValue) {
		this.fieldValue = aValue;
		this.getInputDom().val(aValue);
	}
	this.setInputHiddenDomValue = function(aValue) {
		this.fieldKey = aValue;
		this.getInputHiddenDom().val(aValue);
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
			this.setInputStyle("display", "inline-block");
			this.setLabelStyle("width", labelPercent * 100 + "%");
			this.setInputStyle("width", inputPercent * 100 + "%");
		}
		if (linewidthPercent != null) {
			this.setRootStyle("width", linewidthPercent * 100 + "%");
		}
	}
}
(function() {
	// 创建一个没有实例方法的类
	var Super = function() {
	};
	Super.prototype = FormFieldBase.prototype;
	// 将实例作为子类的原型
	FormInputButton.prototype = new Super();
	FormInputButton.prototype.constructor = FormInputButton; // 需要修复下构造函数
})();
