(function($) {
    $.extend({
        doResponse: function(responseData) {
            try {
                if (responseData.errorMessage != null && responseData.errorMessage != "") {
                    $.error(responseData.errorMessage);
                    return false;
                }
                return true;
            } catch(e) {
                $.error("frameworl-jquery.js-22");
                return false;
            }
        },
        // 根据函数名进行方法调用
        _Eval: function(func, paramArr) {
            if (func == null) return;
            var invokeString = "";
            if (typeof func === "function") {
                invokeString = "" + func.name;
            } else {
                invokeString = "" + func;
            }

            // 1、如果是functionName()类型的 则转换成
            if (invokeString.endWith("()")) {
                invokeString = invokeString.substr(0, invokeString.length - 2); 
                invokeString = invokeString + "(";
            }
            // 2、如果是functionName(para1,para2)类型的则 转换成functionName(para1,para2
            else if (invokeString.endWith(")")) {
                invokeString = invokeString.substr(0, invokeString.length - 1); 
                invokeString = invokeString + ",";
            } else invokeString = invokeString + "(";

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
        },
        generateUUID: function() {
            var d = new Date().getTime();
            var uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g,
            function(c) {
                var r = (d + Math.random() * 16) % 16 | 0;
                d = Math.floor(d / 16);
                return (c == 'x' ? r: (r & 0x3 | 0x8)).toString(16);
            });
            return uuid;
        },

        openTab: function(setting) {
            // 新增一个Tab项
            parent.vm.addTab(setting);
        },

        getRequestParam: function(paramName) {
            if (paramName == null) return null;
            var url = location.search;
            var theRequest = new Object();
            if (url.indexOf("?") != -1) {
                var str = url.substr(1);
                strs = str.split("&");
                for (var i = 0; i < strs.length; i++) {
                    if (paramName === strs[i].split("=")[0]) return decodeURI(strs[i].split("=")[1])
                }
            }
            return null;
        },

        createAjaxDataWrap: function(name) {
            return new _LL_Model._AjaxDataWrap();
        },
        
        createNewRow:function(rowId){
        	var obj = {};
        	obj.rowId = $.generateUUID();
        	return obj;
        },
        _clone: function clone(obj) {
            // Handle the 3 simple types, and null or undefined
            if (null == obj || "object" != typeof obj) return obj;

            // Handle Date
            if (obj instanceof Date) {
                var copy = new Date();
                copy.setTime(obj.getTime());
                return copy;
            }

            // Handle Array
            if (obj instanceof Array) {
                var copy = [];
                for (var i = 0,
                len = obj.length; i < len; ++i) {
                    copy[i] = clone(obj[i]);
                }
                return copy;
            }

            // Handle Object
            if (obj instanceof Object) {
                var copy = {};
                for (var attr in obj) {
                    if (obj.hasOwnProperty(attr)) copy[attr] = clone(obj[attr]);
                }
                return copy;
            }

            throw new Error("Unable to copy obj! Its type isn't supported.");
        },
        createPageInfo: function() {
            var pageinfo = new _LL_Model._PageInfo();
            return pageinfo;
        },
        alert: function(text, title, callback) {
            if (!title) title = "提示";
            if (!callback) callback = function() {
            }
            if (parent) {
            	parent.vm.$alert(text, title, {
	                confirmButtonText: '确定',
	                callback: function() {
	                }
            	});
            }
            else {
                var vm = new Vue();
                vm.$alert(text, title, {
                    confirmButtonText: '确定',
                    callback: function() {
                    }
                });
            }
        },
        msg: function(msgg, isShowClose,duration) {
            if (!isShowClose) {
                isShowClose = false;
            }
            if (!duration) {
            	duration = 3000;
            }
            parent.___vm=parent.$.createVue();
            parent.___vm.$message({
                showClose: isShowClose,
                message: msgg,
                duration:duration
            });
        },
        createVue:function(){
        	return new Vue();
        },
        success: function(msg, isShowClose,duration) {
            if (!isShowClose) {
                isShowClose = false;
            }
            if (!duration) {
            	duration = 3000;
            }
            parent.___vm=parent.$.createVue();
            parent.___vm.$message({
                showClose: isShowClose,
                message: msg,
                type: 'success',
                duration:duration
            });
        },
        warning: function(msg, isShowClose,duration) {
            if (!isShowClose) {
                isShowClose = false;
            }
            if (!duration) {
            	duration = 3000;
            }
            parent.___vm=parent.$.createVue();
            parent.___vm.$message({
                showClose: isShowClose,
                message: msg,
                type: 'warning',
                duration:duration
            });
        },
        error: function(msg, isShowClose,duration) {
            if (!isShowClose) {
                isShowClose = true;
            }
            if (!duration) {
            	duration = 0;
            }
            parent.___vm=parent.$.createVue();
            parent.___vm.$message({
                showClose: isShowClose,
                message: msg,
                type: 'error',
                duration:duration
            });
        },
        openDialog: function(obj) {
            /* title */
            var title = obj.title;
            if (title == null || title == "") title = "弹窗 ";
            else title = title + "&nbsp;&nbsp;";
            obj.title = title;

            // 存储弹出窗口的传递值
            var _DialogData = obj.data == null ? {}: obj.data;
            _DialogData.url = obj.url;
            var showTimes = 1;
            // 重新封装success方法
            obj.success = function(layero, index) {
                var iframeWin = parent.window[layero.find('iframe')[0]['name']]; // 得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
                try {
                    iframeWin._InitOpenDialog(_DialogData);
                } catch(e) {

                }
            }
            var width = obj.width;
            var height = obj.height;
            if (width == null) width = "630px";
            else if (("" + width).indexOf("px") == -1) {
                width = obj.width + "px";
            }
            if (height == null) height = "330px";
            else if (("" + height).indexOf("px") == -1) {
                height = obj.height + "px";
            }
            obj.type = 2;
            obj.shade = 0.4;
            obj.closeBtn = 1;
            obj.shadeClose = true;
            obj.maxmin = true;
            obj.area = [width, height];
            obj.content = $$pageContextPath + "sys/dialog/dialog";
            obj.zIndex =1999;
            parent.layer.open(obj);
        },
        confirm:function(msg,func1,func2){
        	var	btn=["确定","取消"]
        	parent.layer.confirm(msg,btn,function(index){
        		parent.layer.close(index);
        		if(func1!=null)
        			func1();
        	},function(){
        		if(func2!=null)
        			func2();
        	})
        },
        // 重新封装Ajax请求
        request: function(settings) {
            if (settings == null) return;

            // 封装操作成功函数
            var successFunction = settings.success;
            settings.success = function(responseData) {
                if (successFunction != null) {
                    if (typeof(responseData) == 'string' || typeof(responseData) == 'boolean') {
                        successFunction(responseData);
                    } else {
                        try {
                            if (!$.doResponse(responseData)) {
                                return;
                            }
                            var res = new _LL_Model.AjaxResponse(responseData);
                            successFunction(res);
                        } catch(e) {
                            successFunction(responseData);
                        }
                    }
                }
            }

            // 封装操作失败函数
            var errorFunction = settings.error;

            settings.error = function(responseData) {
                if (errorFunction != null) {
                    if (typeof(responseData) == 'string') {
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
            if (settings.contentType == null || settings.contentType == "") settings.contentType = 'application/json;charset=UTF-8';
            if (settings.dataType == null || settings.dataType == "") settings.dataType = "json";
            var ajaxRequest = new Object();
            ajaxRequest.map = settings.data;
            settings.data = JSON.stringify(ajaxRequest);
            settings.accept = "*/*";
            $.ajax(settings);
        },
    });
})(jQuery);