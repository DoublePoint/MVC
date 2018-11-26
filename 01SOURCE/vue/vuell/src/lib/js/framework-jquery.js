import jQuery from './jquery-1.12.4.js'


(function($) {
	$.extend({
		doResponse : function(responseData) {
			try {
				if (responseData.errorMessage != null && responseData.errorMessage != "") {
					$.alert(responseData.errorMessage);
					return false;
				}
				return true;
			} catch (e) {
				$.alert("frameworl-jquery.js-22");
				return false;
			}

		},
		// 根据函数名进行方法调用
		_Eval : function(func, paramArr) {
			if (func == null)
				return;
			var invokeString = "";
			if (typeof func === "function") {
				invokeString = "" + func.name;
			} else {
				invokeString = "" + func;
			}

			// 1、如果是functionName()类型的 则转换成
			if (invokeString.endWith("()")) {
				invokeString = invokeString.substr(0, invokeString.length - 2)
				invokeString = invokeString + "(";
			}
			// 2、如果是functionName(para1,para2)类型的则 转换成functionName(para1,para2
			else if (invokeString.endWith(")")) {
				invokeString = invokeString.substr(0, invokeString.length - 1)
				invokeString = invokeString + ",";
			} else
				invokeString = invokeString + "(";

			if (paramArr != null) {
				if (Array.isArray(paramArr)) {
					for (var i = 0; i < paramArr.length; i++) {
						if (i != paramArr.length - 1) {
							invokeString += "paramArr[" + i + "],";
						} else {
							invokeString += "paramArr[" + i + "]";
						}
					}
				} else {
					invokeString += "paramArr";
				}
			}
			invokeString += ")";
			return eval(invokeString);
			// param==null?func.apply(this):func.apply(this,param);
		},
		generateUUID : function() {
			var d = new Date().getTime();
			var uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
				var r = (d + Math.random() * 16) % 16 | 0;
				d = Math.floor(d / 16);
				return (c == 'x' ? r : (r & 0x3 | 0x8)).toString(16);
			});
			return uuid;
		},

		
		openTab : function(setting){
			// 新增一个Tab项
			parent.$element.tabAdd('admin-tab', setting);
			// 切换到指定Tab项
			parent.$element.tabChange('admin-tab', setting.id);
		},
		
		getRequestParam : function(paramName) {
			if (paramName == null)
				return null;
			var url = location.search;
			var theRequest = new Object();
			if (url.indexOf("?") != -1) {
				var str = url.substr(1);
				strs = str.split("&");
				for (var i = 0; i < strs.length; i++) {
					if (paramName === strs[i].split("=")[0])
						return decodeURI(strs[i].split("=")[1])
				}
			}
			return null;
		},
		

		createAjaxDataWrap : function(name) {
			return new _LL_Model._AjaxDataWrap();
		},
		_Clone : function clone(obj) {
			// Handle the 3 simple types, and null or undefined
			if (null == obj || "object" != typeof obj)
				return obj;

			// Handle Date
			if (obj instanceof Date) {
				var copy = new Date();
				copy.setTime(obj.getTime());
				return copy;
			}

			// Handle Array
			if (obj instanceof Array) {
				var copy = [];
				for (var i = 0, len = obj.length; i < len; ++i) {
					copy[i] = clone(obj[i]);
				}
				return copy;
			}

			// Handle Object
			if (obj instanceof Object) {
				var copy = {};
				for ( var attr in obj) {
					if (obj.hasOwnProperty(attr))
						copy[attr] = clone(obj[attr]);
				}
				return copy;
			}

			throw new Error("Unable to copy obj! Its type isn't supported.");
		},
		createPageInfo : function() {
			var pageinfo = new _LL_Model._PageInfo();
			return pageinfo;
		},
		alert:function(text){
			alert(text)
		},
		// 重新封装Ajax请求
		request : function(settings) {
			
			if (settings == null)
				return;

			// 封装操作成功函数
			var successFunction = settings.success;

			settings.success = function(responseData) {
				if (successFunction != null) {
					if (typeof (responseData) == 'string' || typeof (responseData) == 'boolean') {
						successFunction(responseData);
					} else {
						try {
							if (!$.doResponse(responseData)) {
								return;
							}
							var res = new _LL_Model.AjaxResponse(responseData);
							successFunction(res);
						} catch (e) {
							successFunction(responseData);
						}
					}

				}
			}

			// 封装操作失败函数
			var errorFunction = settings.error;

			settings.error = function(responseData) {
				if (errorFunction != null) {
					if (typeof (responseData) == 'string') {
						errorFunction(responseData);
					} else {
						if (!$.doResponse(responseData)) {
							return;
						}
						var res = new _LL_Model.AjaxResponse(responseData);
						errorFunction(res);
					}
				}
			}

			settings.type = "POST";
			if (settings.contentType == null || settings.contentType == "")
				settings.contentType = 'application/json;charset=UTF-8';
			if (settings.dataType == null || settings.dataType == "")
				settings.dataType = "json";
			var ajaxRequest=new Object();
			ajaxRequest.map=settings.data;
			settings.data = JSON.stringify(ajaxRequest);
			settings.accept = "*/*";

			$.ajax(settings);
		},
		
	});

})(jQuery);

export default $