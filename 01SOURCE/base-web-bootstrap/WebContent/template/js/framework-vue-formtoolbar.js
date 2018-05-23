(function($) {
	var componentTemplate = '<div class="layui-inline" style="padding-top:0px;">' + '<div class="layui-input-block" :style="labelclientStyle" :id="id+guid">' + '<slot></slot>'
			+ '</div>' + '</div>';
	_LL_Model.formFieldComponent(_LL_Constant._ConstantComponentMap._FormToolBar, componentTemplate);

	_LL_Model.FormToolbar = function(domId) {
		_LL_Model.FormFieldBase.call(this);
		this.domId = domId;
		this.getContentDiv = function() {
			return $("#" + this.domId);
		}
		this.setContentStyle = function(cssKey, cssValue) {
			this.getContentDiv().css(cssKey, cssValue);
		}
		this.setWidthByColproportion = function(linewidthPercent, itemColproportion) {
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
	_LL_Model.FormToolbar.prototype = new Super();
	_LL_Model.FormToolbar.prototype.constructor = _LL_Model.FormToolbar; // 需要修复下构造函数
})(jQuery);