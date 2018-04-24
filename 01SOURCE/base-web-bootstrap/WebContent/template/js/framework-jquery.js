var _RegisterModel=new RegisterModel();
(function($) {
	// html标签Id对应Model键值对
	var _LayuiObjectHashMap;
	// 浏览器窗口变化时需要重设大小的标签

	String.prototype.endWith = function(endStr) {
		var d = this.length - endStr.length;
		return (d >= 0 && this.lastIndexOf(endStr) == d)
	};

	$.extend({
		_AddToLayuiObjectHashMap : function(id, obj) {
			if (_LayuiObjectHashMap == null)
				_LayuiObjectHashMap = new $._HashTable();
			if (!_LayuiObjectHashMap.containsKey(id)) {
				_LayuiObjectHashMap.add(id, obj);
			}
		},
		_GetFromLayuiObjectHashMap : function(id) {
			return _LayuiObjectHashMap == null ? null : _LayuiObjectHashMap.getValue(id);
		},
		// 根据函数名进行方法调用
		_Eval : function(func, paramArr) {
			if (func == null)
				return;

			var invokeString = "" + func;
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
			// param==null?eval(fuc):eval(fuc+param);

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
		_GenerateUUID : function() {
			var d = new Date().getTime();
			var uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
				var r = (d + Math.random() * 16) % 16 | 0;
				d = Math.floor(d / 16);
				return (c == 'x' ? r : (r & 0x3 | 0x8)).toString(16);
			});
			return uuid;
		},

		_RegisterResizeModel : function(model) {
			_RegisterModel._ResizeModel.push(model);
		},
		_RegisterComponentCompleteListenerModel : function(model) {
			_RegisterModel._ComponentCompleteListenerModel.push(model);
		},
		_RegisterDialogSuccessModel : function(model) {
			_RegisterModel._DialogSuccessModel.push(model);
		},
		_GetRegisteredComponentCompleteListenerModel : function() {
			return _RegisterModel._ComponentCompleteListenerModel;
		},
		_GetRegisteredDialogSuccessModel : function() {
			return _RegisterModel._DialogSuccessModel;
		},
		_GetRegisteredResizeModel : function() {
			return _RegisterModel._ResizeModel;
		},
		_OpenDialog : function(obj) {
			/* title */
			var title = obj.title;
			if (title == null || title == "")
				title = "弹窗 ";
			else
				title = title + "&nbsp;&nbsp;";
			obj.title = title;

			/* content */
			var url = obj.content;
			if (url != null) {
				// 有参数
				if (url.indexOf("?") > 0)
					obj.content = obj.content + "&" + _ConstantPageDefaultParam._IS_DO_INIT_FUNTION + "=" + ConstantState._YES_NO_STATE_N;
				else
					obj.content = obj.content + "?" + _ConstantPageDefaultParam._IS_DO_INIT_FUNTION + "=" + ConstantState._YES_NO_STATE_N;
			}

			// 存储弹出窗口的传递值
			var _DialogData = obj.data;
			var _Client_Success_Funtion = obj.succeed;

			// 重新封装success方法
			obj.success = function(layero, index) {
				var jspParams = $._CreateJspParams();
				jspParams.setParentDialogDiv(layero);
				if (obj.yes != null) {
					if (typeof obj.yes === "function")
						jspParams.YesFunction = obj.yes;
					else
						jspParams.setYesFunctionName(obj.yes);
				}
				parent.initJspParams(jspParams);
				initBeforeJspInit();
				// 执行该方法的是子页面
				// 手动调用页面的init方法 由用户自动定义
				var iframeWin = parent.window[layero.find('iframe')[0]['name']]; // 得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
				iframeWin.init(_DialogData);

				// 添加用户定义success方法
				if (_Client_Success_Funtion != null) {
					$._Eval(_Client_Success_Funtion);
				}
			}
			var width = obj.width;
			var height = obj.height;
			if (width == null)
				width = "100px";
			else if (("" + width).indexOf("px") == -1) {
				width = obj.width + "px";
			}
			if (height == null)
				height = "100px";
			else if (("" + height).indexOf("px") == -1) {
				height = obj.height + "px";
			}
			obj.area = [ width, height ];

			parent.$layer.open(obj);
		},
		_Close : function(data) {
			// 弹出窗口的确定的点击
			var index = parent.$layer.getFrameIndex(window.name); // 先得到当前iframe层的索引
			parent.$._CloseDialog(index, data);
		},
		_Cancel : function() {
			// 弹出窗口的取消点击+关闭按钮的点击
		},
		// 父页面使用
		_CloseDialog : function(index, data) {
			$layer.close(index); // 再执行关闭

			// _JspParams 页面默认参数 每个页面都有
			if (_jspParams.YesFunction != null) {
				_jspParams.YesFunction(data);
			} else {
				var yesFunction = _jspParams._YesFunctionName;
				$._Eval(yesFunction, data);
			}
		},
		_Alert : function(msg, time) {
			if (time == null)
				time = _ConstantDialog._DEFAULT_SHOW_TIME;
			parent.$layer.msg(msg, {
				time : time
			});
		},
		_Confirm : function(msg, yes, cancel) {
			var yesF = yes;
			var cancelF = cancel;
			parent.$layer.confirm(msg, {
				btn : [ '确定', '取消' ]
			// 按钮
			}, function() {
				if (yesF != null)
					yesF.apply();
			}, function() {
				if (cancelF != null)
					cancelF.apply();
			});
		},
		_ShakeTips : function(msg, time) {
			if (time == null)
				time = _ConstantDialog._DEFAULT_SHOW_TIME;
			parent.layer.msg(msg, {
				anim : 6,
				time : time
			}, function() {
				// 关闭后的操作
			});
		},
		_GetRequestParam : function(paramName) {
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
						// theRequest[strs[i].split("=")[0]] =
						// decodeURI(strs[i].split("=")[1]);
				}
			}
			return null;
		},
		_AddNotSaveIcon : function() {
			if (parent == null)
				return;
			if (parent._jspParams == null)
				return;
			parent._jspParams.addNotSaveIcon();
		},
		_RemoveNotSaveIcon : function() {
			if (parent == null)
				return;
			if (parent._jspParams == null)
				return;
			parent._jspParams.removeNotSaveIcon();
		},
		// 是否是int类型的数值
		_IsInt : function(str) {
			var r = /^-?\d+$/;
			return r.test(str);
		},

		_HashTable : function() {
			var size = 0;
			var entry = new Object();
			this.add = function(key, value) {
				if (!this.containsKey(key)) {
					size++;
				}
				entry[key] = value;
			};
			this.getValue = function(key) {
				return this.containsKey(key) ? entry[key] : null;
			};
			this.remove = function(key) {
				if (this.containsKey(key) && (delete entry[key])) {
					size--;
				}
			};
			this.containsKey = function(key) {
				return (key in entry);
			};
			this.containsValue = function(value) {
				for ( var prop in entry) {
					if (entry[prop] == value) {
						return true;
					}
				}
				return false;
			};
			this.getValues = function() {
				var values = new Array();
				for ( var prop in entry) {
					values.push(entry[prop]);
				}
				return values;
			};
			this.getKeys = function() {
				var keys = new Array();
				for ( var prop in entry) {
					keys.push(prop);
				}
				return keys;
			};
			this.getSize = function() {
				return size;
			};
			this.clear = function() {
				size = 0;
				entry = new Object();
			};
			return this;
		},

		_CreateAjaxDataWrap : function(name) {
			return new _AjaxDataWrap();
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
		_CreatePageInfo : function() {
			var pageinfo = new _PageInfo();
			return pageinfo;
		},
		_CreateJspParams : function() {
			return new _JspParams();
		},
		_ParseTreeNodeToCd : function(treeNode) {
			var arr = new Array();
			var obj = {};
			obj.cdbs = treeNode.cdbs;
			obj.cdcj = treeNode.cdcj;
			obj.cdlj = treeNode.cdlj;
			obj.cdmc = treeNode.cdmc;
			obj.cdpx = treeNode.cdpx;
			obj.cjsj = treeNode.cjsj;
			arr.push(obj);
			return arr;
		},
		_FormatToDate : function(datetime) {
			return null;
			var year = datetime.year;
			var monthValue = datetime.monthValue;
			if (monthValue <= 9)
				monthValue = "0" + monthValue;
			var dayOfMonth = datetime.dayOfMonth;
			if (dayOfMonth <= 9)
				dayOfMonth = "0" + dayOfMonth;
			var hour = datetime.hour;
			if (hour <= 9 && hour != "00")
				hour = "0" + hour;
			var minute = datetime.minute;
			if (minute <= 9 && minute != "00")
				minute = "0" + minute;
			var second = datetime.second;
			if (second <= 9 && second != "00")
				second = "0" + second;
			return "<span>" + year + "-" + monthValue + "-" + dayOfMonth + " " + hour + ":" + minute + ":" + second + "</span>"
		},
		_CreateStringBuffer : function(str) {
			function StringBuffer(st) {
				this.__strings__ = new Array();
				if (st != null)
					this.__strings__.push(st);
			}
			StringBuffer.prototype.append = function(str) {
				this.__strings__.push(str);
				return this; // 方便链式操作
			}
			StringBuffer.prototype.toString = function() {
				return this.__strings__.join("");
			}
			return new StringBuffer(str);
		},
		_CreateStyleBuffer : function(akey, avalue) {
			var styleBuffer = $._CreateStringBuffer(akey);
			styleBuffer.append(":").append(avalue).append(";");
			return styleBuffer
		},
		_OutputMapCompoment : function(aComponent) {
			if (aComponent.id == null)
				return;
			var documentWriteHtml = "";
			var domId = aComponent._GetComponentDomId();
			var $script = $('<script type="text/javascript"></script>');
			$script.append('var ' + aComponent.id + '=$._GetFromLayuiObjectHashMap("' + domId + '");');
			documentWriteHtml = $script.prop("outerHTML");
			$("body").append(documentWriteHtml);
		},
		_RemoveArrayValue : function(arr, val) {
			for (var i = 0; i < arr.length; i++) {
				if (arr[i] == val) {
					arr.splice(i, 1);
					break;
				}
			}
			return arr;
		}
	});

	// 轮换是否显示
	$.fn._ToggleDisplay = function() {
		var flag = $(this).css("display");
		if (flag == "none" || flag == null) {
			$(this).show();
		} else {
			$(this).hide();
		}
	};
})(jQuery);
