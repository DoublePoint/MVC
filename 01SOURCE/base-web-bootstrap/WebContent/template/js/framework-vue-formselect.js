(function($) {
	var componentTemplate='<div class="layui-inline">' 
		+ '<label class="layui-form-label" :style="labelclientStyle">{{"&nbsp;&nbsp;"+title+"："}}</label>'
	+ '<div class="layui-input-block" >' 
	+ '<select :id="id+guid" :field="field" class="selectpicker"  data-width="66.6666%">' 
	+ '<option>Mustard</option>' 
	+ '  <option>Ketchup</option>' 
	+ '  <option>Relish</option>' 
	+ '</select>'
	+ '</div>' + '</div>';
	component(_ConstantComponentMap._FormSelect,componentTemplate);
})(jQuery);

function FormSelect(domId) {
	FormFieldBase.call(this);
	this.domId = domId;
	this.datasource=null;

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
	this.initData = function(){
		var dl=getSelectDl();
		dl.empty();
		var $dd=$("<dd></dd>");
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