(function($) {
	var componentTemplate = '<div class="layui-inline">' + '<label class="layui-form-label" :style="labelclientStyle"><span v-html="requiredIconText"></span>{{"&nbsp;&nbsp;"+title+"："}}</label>'
			+ '<div class="layui-input-block" >' + '<select :id="id+guid" :field="field" class="selectpicker"  >' + '</select>' + '</div>' + '</div>';
	var privateProps = [ "dropname" ];
	_LL_Model.formFieldComponent(_LL_Constant._ConstantComponentMap._FormSelect, componentTemplate, privateProps);

	_LL_Model.FormSelect = function(domId) {
		_LL_Model.FormFieldBase.call(this);
		this.domId = domId;
		this.datasource = null;
		this.dropname = null;
		this.dropBeanList=null;
		this.clearTimeoutInterval = function() {
			clearTimeout(this.getTimeoutInterval());
		}
		this.getSelect = function() {
			return this.getInputDom();
		}
		this.getSelectDiv = function() {
			return this.getInputDom().next();
		}
		this.getSelectDl = function() {
			return this.getInputDom().next().children("dl");
		}

		this.init = function() {
			this.initData();
		}

		this.initData = function() {
			var formSelect = this;
			
			var requestUrl="";
			if(!_LL_Model.StringUtil.isNullOrEmpty(this.dropname)){
				requestUrl=$$pageContextPath + "sys/dropdown/datalist?dropName=" + this.dropname;
			}
			else if(!_LL_Model.StringUtil.isNullOrEmpty(this.datasource)){
				requestUrl=this.datasource;
			}
			if(!_LL_Model.StringUtil.isNullOrEmpty(requestUrl)){
				$.ajax({
					url : requestUrl,
					type : "POST",
					contentType : 'application/json;charset=UTF-8',
					dataType : "json",
					async : false,
					data : null,
					noneSelectedText:"",
					success : function(ajaxDataWrap) {
						var dataList = ajaxDataWrap.dataList;
						formSelect.dropBeanList=dataList;
						var select = $("#" + formSelect.domId);
						select.append($("<option>&nbsp;</option>"));
						for (var i = 0; i < dataList.length; i++) {
							var dropBean = dataList[i];
							select.append($("<option value="+dropBean.key+">" + dropBean.value + "</option>"));
						}
					}
				});
			}
			else {
				var select = $("#" + formSelect.domId);
				select.append($("<option>&nbsp;</option>"));
				for (var i = 0; i < dataList.length; i++) {
					var dropBean = dataList[i];
					select.append($("<option value=''></option>"));
				}
			}
		}
		
		this.getData = function(){
			var select = this.getSelect();
			return select.val();
		}
		
		this.refreshData = function() {
			var select = $("#" + this.domId);
			select.append($("<option></option>"));
			select.selectpicker("refresh");
		}
		this.setDropName = function(dropname) {
			this.dropname = dropname;
		}
		this.setData = function(val){
			var select = this.getSelect();
			return select.val(val);
		}
		this.showSelectDl = function() {
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
				this.getSelect().attr("data-width", inputPercent * 100 + "%");
				this.setLabelStyle("width", labelPercent * 100 + "%");
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
	_LL_Model.FormSelect.prototype = new Super();
	_LL_Model.FormSelect.prototype.constructor = _LL_Model.FormSelect; // 需要修复下构造函数
})(jQuery);