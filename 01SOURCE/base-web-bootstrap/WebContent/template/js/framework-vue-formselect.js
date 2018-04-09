(function($) {
	var componentTemplate='<div class="layui-inline">' 
		+ '<label class="layui-form-label" :style="labelclientStyle">{{"&nbsp;&nbsp;"+title+"："}}</label>'
	+ '<div class="layui-input-block" >' 
	+ '<select :id="id+guid" :field="field" class="selectpicker"  :data-width="width">' 
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
	
	this.getLabel=function(){
		
	}
	this.getSelect=function(){
		
	}
	this.getHidden=function(){
		
	}
	
	this.setLabelWidth=function(){
		
	}
	this.setSelectWidth=function(){
		
	}

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
		return this.getInputDom().next();
	}
	this.initData = function(){
		$("#"+this.domId).select2({
		     language: "zh-CN", //设置 提示语言
		     width: "100%", //设置下拉框的宽度
		     placeholder: "请选择", // 空值提示内容，选项值为 null
		     //placeholder: {id: '', text: "请选择"}, // 同上，这里默认空值为 ''
		     minimumInputLength: 10,  //最小需要输入多少个字符才进行查询
		     allowClear: true, //是否允许清空选中
		     tags: false,  //设置必须存在的选项 才能选中，设置不存在的值则为null,如果 placeholder: {id: '', text: "请选择"} 则为 ''
		     selectOnClose: true, // 如果没有手动选中，下拉框消失后会自动选中被hover的选项 （不建议使用）
		     closeOnSelect: false, // 选择后下拉框不会关闭（单选-不建议使用）
		     theme: "classic", // 样式

		     maximumSelectionLength: 3,  // 多选 - 设置最多可以选择多少项
		     tokenSeparators: [',', ' '], // 多选 - 输入逗号和空格会自动完成一个选项 前提是：tags: true
		});
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
			this.getInputDom().css("width", inputPercent * 100 + "%");
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