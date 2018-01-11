(function($) {
	var componentTemplate='<div class="layui-inline">' + '<label class="layui-form-label" :style="labelclientStyle">{{"&nbsp;&nbsp;"+title+"："}}</label>'
	+ '<div class="layui-input-block" >' + '<select :id="id+guid" :field="field"  lay-filter="aihao">' + '</select>'
	+ '<div class="layui-unselect layui-form-select ">' + '<div class="layui-select-title">' + '<input type="text" placeholder="请选择"  value="阅读" readonly=""'
	+ 'class="layui-input layui-unselect">' + '<i class="layui-edge"></i>' + ' </div>' + ' <dl class="layui-anim layui-anim-upbit" style="display:none;" >'
	+ ' <dd lay-value="" class="layui-select-tips">请选择</dd>' + ' <dd lay-value="0" class="">写作</dd>' + ' <dd lay-value="1" class="layui-this">阅读</dd>'
	+ ' <dd lay-value="2" class="">游戏</dd>' + '</dl><input type="hidden" :name="field" />' + '</div>'

	+ '</div>' + '</div>';
	component(_ConstantComponentMap._FormSelect,componentTemplate);
})(jQuery);

function FormSelect(domId) {
	FormFieldBase.call(this);
	this.domId = domId;

	this.clearTimeoutInterval = function() {
		clearTimeout(this.getTimeoutInterval());
	}
	this.hideSelectDl = function() {
		this.getSelectDl().hide();
		this.getSelectDiv().removeClass("layui-form-selected");
	}
	this.getSelectDiv = function() {
		return this.getInputDom().next();
	}
	this.getSelectDl = function() {
		return this.getInputDom().next().children("dl");
	}
	this.getSelectHidden = function() {
		return this.getInputDom().next().children("input");
	}
	this.getSelectInput = function() {
		return this.getInputDom().next().children("div").children("input");
	}
	this.removeSelectDdClass = function() {
		this.getSelectDl().children().removeClass();
	}
	this.showSelectDl = function() {
		this.getSelectDiv().addClass("layui-form-selected");
		this.getSelectDl().show();
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
			this.getSelectDl().css("width", inputPercent * 100 + "%");
			this.getSelectDl().css("left", labelPercent * 100 + "%");
			this.getSelectInput().css("width", inputPercent * 100 + "%");
			this.getSelectInput().show();
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
	FormSelect.prototype = new Super();
	FormSelect.prototype.constructor = FormSelect; // 需要修复下构造函数
})();