(function($) {
	_LL_Model.gridFieldComponent(_LL_Constant._ConstantComponentMap._GridSelect);
	
	_LL_Model.GridSelect = function(domId) {
		this.dropname = null;
		this.datasource = null;
		_LL_Model.GridFieldBase.call(this);
		
		// 构造使用于bootstrap的field
		this.getBoostrapField = function() {
			var field = {};
			for ( var i in this) {
				if (i != "getBoostrapField" && i != "domId") {
					if (this[i]) {
						field[i] = this[i];
					}
				}
			}
			var gridField=this;
			var requestUrl="";
			if(!_LL_Model.StringUtil.isNullOrEmpty(this.dropname)){
				var requestUrl=$$pageContextPath + "sys/dropdown/datalist?dropName=" + this.dropname;
			}
			else if(!_LL_Model.StringUtil.isNullOrEmpty(this.datasource)){
				var requestUrl=this.datasource;
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
					success : function(ajaxDataPacket) {
						var dataList = ajaxDataPacket.dataList;
						var source=new Array();
						for (var i = 0; i < dataList.length; i++) {
							var dropBean = dataList[i];
							source.push({value: dropBean.key, text: dropBean.value});
						}
						field.editable = {
							type: 'select',
							showbuttons : false,
							disabled : gridField.readonly == "false" ? false : true,
							emptytext : "&nbsp;&nbsp;",
							mode : "inline",
							inputclass : "bt-input-class",
							onblur : "submit",
							source: source
						};
					}
				});
			}
			else{
				field.editable = {
					type: 'select',
					showbuttons : false,
					disabled : gridField.readonly == "false" ? false : true,
					emptytext : "&nbsp;&nbsp;",
					mode : "inline",
					inputclass : "bt-input-class",
					onblur : "submit",
					source: []
				};
			}
			
			return field;
		}
	};
	// 创建一个没有实例方法的类
	var Super = function() {
	};
	Super.prototype = _LL_Model.GridFieldBase.prototype;
	// 将实例作为子类的原型
	_LL_Model.GridSelect.prototype = new Super();
	_LL_Model.GridSelect.prototype.constructor = _LL_Model.GridSelect; // 需要修复下构造函数
})(jQuery);