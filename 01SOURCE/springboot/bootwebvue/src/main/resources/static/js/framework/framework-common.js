(function($) {
	_LL_Model.StringUtil = {
		isNullOrEmpty : function(s) {
			if (s == null||s==""||this.trim(s)=="") {
				return true;
			}
			return false;
		},
		// 在js的指定位置插入字符串
		insert_flg_ : function(str, flg, sn) {
			var leftStr = str.substring(0, sn);
			var center = flg;
			var rigthStr = str.substring(sn, str.length);

			return leftStr + center + rigthStr;
		},
		trim : function(s) {
			return this.trimLeft(this.trimRight(s));
		},

		// 去掉左边的空白
		trimLeft : function(s) {
			if (s == null) {
				return "";
			}
			var whitespace = new String(" \t\n\r");
			var str = new String(s);
			if (whitespace.indexOf(str.charAt(0)) != -1) {
				var j = 0, i = str.length;
				while (j < i && whitespace.indexOf(str.charAt(j)) != -1) {
					j++;
				}
				str = str.substring(j, i);
			}
			return str;
		},

		// 去掉右边的空白
		trimRight : function(s) {
			if (s == null)
				return "";
			var whitespace = new String(" \t\n\r");
			var str = new String(s);
			if (whitespace.indexOf(str.charAt(str.length - 1)) != -1) {
				var i = str.length - 1;
				while (i >= 0 && whitespace.indexOf(str.charAt(i)) != -1) {
					i--;
				}
				str = str.substring(0, i + 1);
			}
			return str;
		}
	}

	_LL_Model.DateTimeUtil = {
		// 获取当前日期 格式为YYYY-MM-DD 00:00:00
		getCurDate : function() {
			// 获得当前系统
			var date = new Date();
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			var day = date.getDate();
			if (month < 10) {
				month = "0" + month;
			}
			if (day < 10) {
				day = "0" + day;
			}
			var currentDate = year + "-" + month + "-" + day + " 00:00:00";// 系统当前时间；
			return currentDate;
		},

		// 获取本年份第一天 格式为YYYY-MM-DD 00:00:00
		getDateFirstDay : function() {
			// 获得当前系统
			var date = new Date();
			var year = date.getFullYear();
			var currentDate = year + "-01-01 00:00:00";// 系统当前时间；
			return currentDate;
		},

		// 获取本年份第一天 格式为YYYY-MM-DD 00:00:00
		getDateLastDay : function() {
			// 获得当前系统
			var date = new Date();
			var year = date.getFullYear();
			var currentDate = year + "-12-31 00:00:00";// 系统当前时间；
			return currentDate;
		}
	}
})(jQuery);