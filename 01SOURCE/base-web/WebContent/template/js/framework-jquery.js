var DoublePoint = {};// 全局对象
(function($) {
	// html标签Id对应Model键值对
	var _LayuiObjectHashMap;
	// 浏览器窗口变化时需要重设大小的标签
	var _RegisteredModel;
	String.prototype.endWith = function(endStr) {
		var d = this.length - endStr.length;
		return (d >= 0 && this.lastIndexOf(endStr) == d)
	}

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
			func = func + "";
			if (func.endWith("()")) {
				func = func.substr(0, func.length - 2)
			}

			// param==null?eval(fuc):eval(fuc+param);
			if (func == null)
				return;
			var invokeString = func + "(";

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
			eval(invokeString);
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
			if (_RegisteredModel == null)
				_RegisteredModel = new Array();
			_RegisteredModel.push(model);
		},
		_GetRegisteredResizeModel : function() {
			return _RegisteredModel;
		},
		_SetLayuiTableData : function(ajaxgrid) {
			var id = ajaxgrid.id;
			var ajaxDataWrap = ajaxgrid.datawrap;
			// var data=ajaxDataWrap.getDataList();
			var datasource = ajaxgrid.datasource;
			var cols = ajaxgrid.cols;
			var height = ajaxgrid.height;
			var ss = $table.render({
				elem : '#' + id + '',
				data : $._Clone(ajaxDataWrap.dataList),
				height : height,
				cols : cols,
				// skin : 'row', // 表格风格
				// even : true,
				page : false, // 是否显示分页
				limits : [ 5, 7, 10, 20, 100 ],
				limit : 50
			// 每页默认显示的数量
			});
			return ss;
		},
		_OpenDialog : function(obj) {
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
				// 执行该方法的是子页面
				// 手动调用页面的init方法
				var iframeWin = parent.window[layero.find('iframe')[0]['name']]; // 得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
				iframeWin.init(_DialogData);

				var ajaxPage = new $._AjaxPage();
				if (obj.yes != null) {
					if (typeof obj.yes === "function")
						ajaxPage.YesFunction = obj.yes;
					else
						ajaxPage.setYesFunctionName(obj.yes);
				}
				parent.initAjaxPage(ajaxPage);

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

			//_AjaxPage 页面默认参数 每个页面都有
			if (_AjaxPage.YesFunction != null) {
				_AjaxPage.YesFunction(data);
			} else {
				var yesFunction = _AjaxPage._YesFunctionName;
				$._Eval(yesFunction, data);
			}
		},
		_Alert : function(msg) {
			parent.$layer.msg(msg);
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
		_ShakeTips : function(msg) {
			parent.layer.msg(msg, {
				anim : 6
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

		_AjaxDataWrap : function(name) {
			// this.name = name;
			this.code = "";
			this.msg = "";
			this.dataList = [];
			this.pageInfo = new $._PageInfo();
			this.parse = function(jsonObjectDataWrap) {
				if (jsonObjectDataWrap == null)
					return;
				this.dataList = jsonObjectDataWrap.dataList;
				this.pageInfo.parse(jsonObjectDataWrap.pageInfo);
			};
			this.setDataList = function(dataList) {
				this.dataList = dataList;
			};
			this.getDataList = function() {
				return this.dataList;
			};

			this.getPageInfo = function() {
				return this.pageInfo;
			}
			this.clearPageInfo = function() {
				this.pageInfo = null;
			}
			return this;
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
		_PageInfo : function() {
			this.currentPageNum = 1;
			this.currentPageCount = 0;
			this.totalElementCount = 0;
			this.totalPageCount = 1;
			this.pageSize = 100;
			this.sort = null;
			this.parse = function(jsonObjectPageInfo) {
				if (jsonObjectPageInfo == null)
					return;
				this.currentPageNum = jsonObjectPageInfo.currentPageNum;
				this.currentPageCount = jsonObjectPageInfo.currentPageCount;
				this.totalElementCount = jsonObjectPageInfo.totalElementCount;
				this.totalPageCount = jsonObjectPageInfo.totalPageCount;
				this.pageSize = jsonObjectPageInfo.pageSize;
				this.sort = jsonObjectPageInfo.sort;
			};
			this.getCurrentPageNum = function() {
				return this.currentPageNum;
			};
			this.setCurrentPageNum = function(aCurrentPageNum) {
				this.currentPageNum = aCurrentPageNum;
			};
			this.getCurrentPageCount = function() {
				return this.currentPageCount;
			};
			this.setCurrentPageCount = function(aCurrentPageCount) {
				this.currentPageCount = aCurrentPageCount;
			};
			this.getTotalElementCount = function() {
				return this.totalElementCount;
			};
			this.setTotalElementCount = function(aTotalElementCount) {
				this.totalElementCount = aTotalElementCount;
			};
			this.getTotalPageCount = function() {
				return this.totalPageCount;
			};
			this.setTotalPageCount = function(aTotalPageCount) {
				this.totalPageCount = aTotalPageCount;
			};
			this.getPageSize = function() {
				return this.pageSize;
			};
			this.setPageSize = function(aPageSize) {
				this.pageSize = aPageSize;
			};
			this.clear = function() {
				this.currentPageNum = 1;
				this.currentPageCount = 0;
				this.totalElementCount = 0;
				this.totalPageCount = 1;
				this.pageSize = _ConstantAjaxDataGrid._DEFAULT_PAGE_SIZE;
				this.sort = null;
			}
			return this;
		},
		_AjaxPage : function() {
			this._YesFunctionName = null;
			this._CancelFunctionName = null;
			this.YesFunction = null;
			this.CancelFunction = null;
			this.setYesFunctionName = function(funcName) {
				this._YesFunctionName = funcName;
			};
			this.setCancelFunctionName = function(cancName) {
				this._CancelFunctionName = cancName;
			}
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
		_OutputMapCompoment : function(aComponent){
			if(aComponent.id==null)
				return;
			var documentWriteHtml = "";
			var domId = aComponent._GetComponentDomId();
			var $script = $('<script type="text/javascript"></script>');
			$script.append('var ' + aComponent.id + '=$._GetFromLayuiObjectHashMap("' + domId + '");');
			documentWriteHtml = $script.prop("outerHTML");
			$("body").append(documentWriteHtml);
		}
	});

	//轮换是否显示
	$.fn._ToggleDisplay = function() {
		var flag = $(this).css("display");
		if (flag == "none" || flag == null) {
			$(this).show();
		} else {
			$(this).hide();
		}
	};
})(jQuery);
