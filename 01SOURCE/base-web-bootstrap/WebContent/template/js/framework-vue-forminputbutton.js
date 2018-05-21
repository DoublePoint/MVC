(function($) {
	var componentTemplate = '<div class="layui-inline" >' + '<label class="layui-form-label" :style="labelclientStyle">{{"&nbsp;&nbsp;"+title+"："}}</label>'
			+ '<div class="layui-input-block">'
			+ '<input :id="id+guid" type="text" :field="field" lay-verify="title" autocomplete="off" class="layui-input" style="padding-right:38px;"/>'
			+ '<input :id="inputButtonHiddenId" type="hidden" value="" :name="field" />' + '<a :id="inputButtonButtonId" href="#" class="layui-btn inputbutton">...</a>' + '</div>' + '</div>';
	component(_ConstantComponentMap._FormInputButton,componentTemplate);
})(jQuery);

function FormInputButton(domId) {
	FormFieldBase.call(this);
	this.domId = domId;
	this.inputButtonHiddenId=null;
	this.inputButtonButtonId=null;
	this.labelprovider=null;
	this.fieldKey = null;
	this.fieldValue = null;
	this.onclick=null;
	
	this.getData = function(){
		return this.getInputHiddenDom().val();
	}
	this.getDisplayValue=function(){
		return this.getInputDom().val();
	}
	this.getInputHiddenDom = function() {
		return $("#" + this.inputButtonHiddenId);
	};
	this.getInputButtonButtonDom = function(){
		return $("#"+this.getInputButtonButtonDomId());
	};
	this.getInputButtonButtonDomId=function(){
		return this.inputButtonButtonId;
	};
	this.getOnClick=function(){
		return this.onclick;
	};
	this.init = function(){
		this.initData();
		this.initEvent();
	};
	this.initData=function(){
		return this.getInputHiddenDom().val();
	};
	this.initEvent= function (){
		this.initButtonClick();
	};
	this.initButtonClick=function(){
		var inpbtn=this;
		this.getInputButtonButtonDom().click(function() {
			if (inpbtn.onclick == null)
				return;
			$._Eval(inpbtn.onclick);
		});
	}
	this.setData = function(aKey,aIsChanged, aValue) {
		var arr;
		try{
			arr=aKey.split("&");
		}
		catch(e){
			
		}
		if(arr!=null&&arr.length==2){
			this.getInputDom().val(arr[0]);
			this.setInputHiddenDomValue(arr[1]);
		}
		else{
			this.getInputDom().val(aValue);
			this.setInputHiddenDomValue(aKey);
		}
		if(this.labelprovider!=null){
			this.setDataByLabelProvider();
		}
	};
	this.setDataByLabelProvider= function(){
		var fieldKey=this.fieldKey;
		var labelProvider=this.labelprovider;
		var inputButton=this;
		if(labelProvider!=null){
			$.request({
				url:labelProvider,
				data:{
					id:fieldKey,
				},
				success:function(response){
					var label=response;
					inputButton.setInputDomValue(response);
				}
			});
		}
	}
	this.selectItem=function(aKey, aValue,aIsChanged){
		this.getInputDom().val(aValue);
		this.setInputHiddenDomValue(aKey);
	}

	this.setInputDomValue = function(aValue) {
		this.fieldValue = aValue;
		this.getInputDom().val(aValue);
	};
	this.setInputHiddenDomValue = function(aValue) {
		this.fieldKey = aValue;
		this.getInputHiddenDom().val(aValue);
	};
	this.setOnClick=function(onclick){
		 this.onclick=onclick;
	};
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
