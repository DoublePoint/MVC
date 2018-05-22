(function($) {
	var componentTemplate = '<div class="layui-inline" style="padding-top:0px;">' 
			+ '<div class="layui-input-block" :style="labelclientStyle" :id="id+guid">' +  '<slot></slot>' + '</div>' + '</div>';
	component(_ConstantComponentMap._FormToolBar,componentTemplate);
})(jQuery);

function FormToolbar(domId) {
	FormFieldBase.call(this);
	this.domId = domId;
	this.getContentDiv = function(){
		return $("#"+this.domId);
	}
	this.setContentStyle = function(cssKey, cssValue) {
		this.getContentDiv().css(cssKey, cssValue);
	}
	this.setWidthByColproportion = function(linewidthPercent, itemColproportion) {
		
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
	FormToolbar.prototype = new Super();
	FormToolbar.prototype.constructor = FormToolbar; // 需要修复下构造函数
})();