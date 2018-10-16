(function($) {
	var componentTemplate = '<div class="layui-inline" >'
			+ '<label class="layui-form-label" :style="labelclientStyle"><span v-html="requiredIconText"></span>{{"&nbsp;"+title+"："}}</label>'
			+ '<div class="layui-input-block">'
			+ '<input :id="id+guid" :type="type" lay-verify="title" :validtype="validtype" :field="field" :name="field" autocomplete="off" class="layui-input" :placeholder="placeholder" >'
			+ '</div>' + '</div>';
	_LL_Model.formFieldComponent(_LL_Constant._ConstantComponentMap._FormField, componentTemplate);

	_LL_Model.FormField = function(domId) {
		_LL_Model.FormFieldBase.call(this);
		this.domId = domId;

		this.setWidthByColproportion = function(linewidthPercent, itemColproportion) {
			/* 避免浏览器闪现调整过程，那么需要对数据进行宽度的设置 首先为0 然后显示 */
			if (itemColproportion.length >= 2) {
				var labelPercent = null;
				var inputPercent = null;
				var totalWidthPercent = parseInt(itemColproportion[0]) + parseInt(itemColproportion[1]);
				// 舍掉后面两位小数
				labelPercent = parseInt(itemColproportion[0]) / totalWidthPercent;
				inputPercent = parseInt(itemColproportion[1]) / totalWidthPercent;
				this.setInputStyle("padding-left", "10px");
				this.setLabelStyle("width", labelPercent * 100 + "%");
				this.setInputStyle("width", inputPercent * 100 + "%");
			}
			if (linewidthPercent != null) {
				this.setRootStyle("width", linewidthPercent * 100 + "%");
			}
		}
	};
	// 创建一个没有实例方法的类
	var Super = function() {
	};
	Super.prototype = _LL_Model.FormFieldBase.prototype;
	// 将实例作为子类的原型
	_LL_Model.FormField.prototype = new Super();
	_LL_Model.FormField.prototype.constructor = _LL_Model.FormField; // 需要修复下构造函数
})(jQuery);
