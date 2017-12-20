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
				_LayuiObjectHashMap = new HashTable();
			if (!_LayuiObjectHashMap.containsKey(id)) {
				_LayuiObjectHashMap.add(id, obj);
			}
		},
		_GetFromLayuiObjectHashMap : function(id) {
			return _LayuiObjectHashMap == null ? null : _LayuiObjectHashMap.getValue(id);
		},
		//根据函数名进行方法调用
		_Eval:function(func,paramArr){
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
			var data=ajaxgrid.data;
			var datasource=ajaxgrid.datasource;
			var cols=ajaxgrid.cols;
			var height=ajaxgrid.height;
			var ss=$table.render({
				elem : '#' + id + '',
				data : data,
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
			if(_Client_Success_Funtion!=null){
				obj.success=function(layero, index){
					var iframeWin = parent.window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
					iframeWin.init(_DialogData);
					$._Eval(_Client_Success_Funtion);
				}
			}
			parent.$layer.open(obj);
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
		}
	});

})(jQuery);
