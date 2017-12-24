var DoublePoint = {};// 全局对象
(function($) {
	//html标签Id对应Model键值对
	var _LayuiObjectHashMap;
	//浏览器窗口变化时需要重设大小的标签
	var _RegisteredModel;
	String.prototype.endWith=function(endStr){
	      var d=this.length-endStr.length;
	      return (d>=0&&this.lastIndexOf(endStr)==d)
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
		//根据函数名进行方法调用
		_Eval:function(func,paramArr){
			if(func==null) return;
			func=func+"";
			if(func.endWith("()")){
				func=func.substr(0,func.length-2)
			}
			
//			param==null?eval(fuc):eval(fuc+param);
			if(func==null) return;
			var invokeString=func+"(";
			
			if(paramArr!=null){
				if(Array.isArray(paramArr)){
					for(var i=0;i<paramArr.length;i++){
						if(i!=paramArr.length-1){
							invokeString+="paramArr["+i+"],";
						}else{
							invokeString+="paramArr["+i+"]";
						}
					}
				}
				else{
					invokeString+="paramArr";
				}
			}
			invokeString+=")";
			eval(invokeString);
//			param==null?func.apply(this):func.apply(this,param);
		},
		_GenerateUUID:function () {
			var d = new Date().getTime();
			var uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
			  var r = (d + Math.random()*16)%16 | 0;
			  d = Math.floor(d/16);
			  return (c=='x' ? r : (r&0x3|0x8)).toString(16);
			});
			return uuid;
		},
		
		_RegisterResizeModel:function(model){
			if(_RegisteredModel==null)
				_RegisteredModel=new Array();
			_RegisteredModel.push(model);
		},
		_GetRegisteredResizeModel:function(){
			return _RegisteredModel;
		},
		_SetLayuiTableData : function(ajaxgrid) {
			var id=ajaxgrid.id;
			var ajaxDataWrap=ajaxgrid.data;
//			var data=ajaxDataWrap.getData();
			var datasource=ajaxgrid.datasource;
			var cols=ajaxgrid.cols;
			var height=ajaxgrid.height;
			var ss=$table.render({
				elem : '#' + id + '',
				data : ajaxDataWrap.data,
				height : height,
				cols :cols ,
				skin : 'row', // 表格风格
				even : true,
				page : false, // 是否显示分页
				limits : [ 5, 7, 10, 20, 100 ],
				limit : 50
			// 每页默认显示的数量
			});
			return ss; 
		},
		_OpenDialog:function(obj){
			var url=obj.content;
			if(url!=null){
				//有参数
				if(url.indexOf("?")>0)
					obj.content=obj.content+"&"+_ConstantPageDefaultParam._IS_DO_INIT_FUNTION+"="+ConstantState._YES_NO_STATE_N;
				else
					obj.content=obj.content+"?"+_ConstantPageDefaultParam._IS_DO_INIT_FUNTION+"="+ConstantState._YES_NO_STATE_N;
			}
			
			//存储弹出窗口的传递值
			var _DialogData=obj.data;
			var _Client_Success_Funtion=obj.succeed;
			
			//重新封装success方法
			obj.success=function(layero, index){
				//执行该方法的是子页面
				//手动调用页面的init方法
				var iframeWin = parent.window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
				iframeWin.init(_DialogData);
				
				var ajaxPage=new $._AjaxPage();
				if(obj.yes!=null){
					if(typeof obj.yes === "function")
						ajaxPage.YesFunction=obj.yes;
					else
						ajaxPage.setYesFunctionName(obj.yes);
				}
				parent.initAjaxPage(ajaxPage);
				
				//添加用户定义success方法
				if(_Client_Success_Funtion!=null){
					$._Eval(_Client_Success_Funtion);
				}
			}
			
			parent.$layer.open(obj);
		},
		_Close:function(data){
			//弹出窗口的确定的点击
			var index = parent.$layer.getFrameIndex(window.name); //先得到当前iframe层的索引
			parent.$._CloseDialog(index,data);
		},
		_Cancel:function(){
			//弹出窗口的取消点击+关闭按钮的点击
		},
		//父页面使用
		_CloseDialog:function(index,data){
			$layer.close(index); //再执行关闭
			
			if(_AjaxPage.YesFunction!=null){
				_AjaxPage.YesFunction(data);
			}
			else{
				var yesFunction=_AjaxPage._YesFunctionName;
				$._Eval(yesFunction,data);
			}
		},
		_Alert:function(msg){
			parent.$layer.msg(msg);
		},
		_Confirm:function(msg,yes,cancel){
			parent.$layer.confirm(msg, {
				btn : [ '确定', '取消' ]
			// 按钮
			}, function() {
				yes.apply();
			}, function() {
				cancel.apply();
			});
		},
		_ShakeTips:function(msg){
			parent.layer.msg(msg, {anim:6},function(){
				//关闭后的操作
			});
		},
		_GetRequestParam:function (paramName) {
			if(paramName==null)
				return null;
			var url = location.search;
			var theRequest = new Object();
			if (url.indexOf("?") != -1) {
				var str = url.substr(1);
				strs = str.split("&");
				for (var i = 0; i < strs.length; i++) {
					if(paramName===strs[i].split("=")[0])
						return decodeURI(strs[i].split("=")[1])
//						theRequest[strs[i].split("=")[0]] = decodeURI(strs[i].split("=")[1]);
				}
			}
			return null;
		},
		//是否是int类型的数值
		_IsInt:function(str){
			var r =/^-?\d+$/;
			return r.test(str);
		},
		
		
		_HashTable:function () {
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

		_AjaxDataWrap:function (name) {
//			this.name = name;
			this.setData = function(data) {
				this.data = data;
			};
			this.getData=function(){
				return this.data;
			};
			this.setDataList = function(dataList) {
				this.dataList = dataList;
			};
			this.getDataList=function(){
				return this.dataList;
			};
			this.setPageContext = function(pageContext) {
				this.pageContext = pageContext;
			};
			return this;
		},
		
		
		_Pager:function (){
			this.currentPageNum=0;
			this.pageSize=0;
			this.totalCount=0;
			this.pageCount=0;
			this.pageNumSize=5;
		},
		_AjaxPage:function(){
			this._YesFunctionName=null;
			this._CancelFunctionName=null;
			this.YesFunction=null;
			this.CancelFunction=null;
			this.setYesFunctionName=function(funcName){
				this._YesFunctionName=funcName;
			}
			this.setCancelFunctionName=function(cancName){
				this._CancelFunctionName=cancName;
			}
		}
		
	});

})(jQuery);
