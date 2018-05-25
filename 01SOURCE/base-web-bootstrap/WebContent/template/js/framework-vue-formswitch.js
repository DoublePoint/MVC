(function($) {
	var componentTemplate = '<div class="layui-inline" >'
			+ '<label class="layui-form-label" :style="labelclientStyle"><span v-html="requiredIconText"></span>{{"&nbsp;"+title+"："}}</label>' + '<div class="layui-input-block">'
			+ '<input :id="id+guid"  :field="field" :name="field" type="checkbox"   checked class="layui-input" >' + '</div>' + '</div>';
	_LL_Model.formFieldComponent(_LL_Constant._ConstantComponentMap._FormSwitch, componentTemplate);

	_LL_Model.FormSwitch = function(domId) {
		_LL_Model.FormFieldBase.call(this);
		this.domId = domId;
		this.dropBeanList=null;

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
		this.initData = function() {
			var switchObj=this;
			if(_LL_Model.StringUtil.isNullOrEmpty(this.dropname)){
				switchObj.getDom().bootstrapSwitch({
					onText : switchObj.dropBeanList[0].value,
					offText : switchObj.dropBeanList[1].value,
					onColor : "success",
					offColor : "default",
				});
			}
			else{
				$.ajax({
					url : $$pageContextPath + "/template/sys/dropdown/datalist?dropName=" + switchObj.getDropName(),
					type : "POST",
					contentType : 'application/json;charset=UTF-8',
					dataType : "json",
					async : false,
					data : null,
					success : function(ajaxDataWrap) {
						var dataList = ajaxDataWrap.dataList;
						switchObj.dropBeanList=dataList;
						switchObj.getDom().bootstrapSwitch({
							onText : dataList[0].value,
							offText : dataList[1].value,
							onColor : "success",
							offColor : "default",
						});
					}
				});
			}
			
		}
		this.initEvent = function() {
			this.getDom().bootstrapSwitch("size", "small");
			this.getDom().bootstrapSwitch("onSwitchChange", function(event, data){
				var $el = $(data.el)
			      , value = data.value;
			    console.log(event, $el, value);
			});
		}
		
		this.setData = function(val){
			if(dropBeanList!=null&&dropBeanList.length>=2){
				if(val==this.dropBeanList[0].key){
					this.setTrue();
				}
				else {
					this.setFalse();
				}
			}
		}
		
		this.setTrue = function(){
			this.getDom().bootstrapSwitch('state', true);
		}
		this.setFalse = function(){
			this.getDom().bootstrapSwitch('state', false);
		}
	}
	// 创建一个没有实例方法的类
	var Super = function() {
	};
	Super.prototype = _LL_Model.FormFieldBase.prototype;
	// 将实例作为子类的原型
	_LL_Model.FormSwitch.prototype = new Super();
	_LL_Model.FormSwitch.prototype.constructor = _LL_Model.FormSwitch; // 需要修复下构造函数
})(jQuery);
