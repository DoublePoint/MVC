(function($) {
	var componentTemplate='<input :id="id+guid" type="file" name="file">  ';
	var privateProps=['fileuploaded'];
	component(_ConstantComponentMap._FormFileInput,componentTemplate,privateProps);
})(jQuery);

function FormFileInput(domId) {
	FormFieldBase.call(this);
	this.domId = domId;
	this.datasource=null;
	this.dropname=null;
	this.fileuploaded=null;
	this.init= function(){
		this.initStyle();
	}
	
	this.initStyle = function(){
		var fileinput=this;
		this.getDom().fileinput({
			// 上传的地址
			uploadUrl : $$pageContextPath+"/template/sys/getFileTable",
			uploadExtraData : function(previewId, index) {
				// 注意这里，传参是json格式,后台直接使用对象属性接收，比如employeeCode，我在RatingQuery
				// 里面直接定义了employeeCode属性，然后最重要的也是
				// 最容易忽略的，传递多个参数时，不要忘记里面大括号{}后面的分号，这里可以直接return {a:b};
				// 或者{a:b}都可以，但必须要有大括号包裹
				var data = {
					employeeCode : 1,
					result_id : 2,
					month : 3
				};
				return data;
			},
			uploadAsync : true, // 默认异步上传
			showUpload : true, // 是否显示上传按钮,跟随文本框的那个
			showRemove : false, // 显示移除按钮,跟随文本框的那个
			showCaption : true,// 是否显示标题,就是那个文本框
			showPreview : false, // 是否显示预览,不写默认为true
			dropZoneEnabled : false,// 是否显示拖拽区域，默认不写为true，但是会占用很大区域
			maxFileCount : 1, // 表示允许同时上传的最大文件个数
			enctype : 'multipart/form-data',
			validateInitialCount : true,
			previewFileIcon : "<i class='glyphicon glyphicon-king'></i>",
			msgFilesTooMany : "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
			//allowedFileTypes : [ 'image' ],// 配置允许文件上传的类型
			allowedPreviewTypes : [ 'image' ],// 配置所有的被预览文件类型
			allowedPreviewMimeTypes : [ 'oom', 'oob' ],// 控制被预览的所有mime类型
			language : 'zh'
		});
		if(this.fileuploaded){
			this.getDom().on("fileuploaded", function(event, data, previewId, index) {
				if(!$.doResponse(data.response)){
					return;
				}
				var res=new AjaxResponse(data.response);
				var arr=new Array();
				arr.push(res);
				arr.push(event);
				arr.push(data);
				arr.push(previewId);
				arr.push(index);
				$._Eval(fileinput.fileuploaded,arr);
			});
		}
	}
	this.refreshData=function(){
		var select=$("#"+this.domId);
		select.append($("<option>"+5+"</option>"));
		select.selectpicker("refresh");
	}
	this.removeSelectDdClass = function() {
		this.getSelectDl().children().removeClass();
	}
	this.setDropName=function(dropname){
		this.dropname=dropname;
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
			this.setInputStyle("padding-left", "10px");
			this.setLabelStyle("width", labelPercent * 100 + "%");
			this.setInputStyle("width", inputPercent * 100 + "%");
		}
		if (linewidthPercent != null) {
			this.setRootStyle("width", linewidthPercent * 100 + "%");
		}
	}
}
(function() {
	// 创建一个没有实例方法的类
	var Super = function() {
	};
	Super.prototype = FormFieldBase.prototype;
	// 将实例作为子类的原型
	FormFileInput.prototype = new Super();
	FormFileInput.prototype.constructor = FormFileInput; // 需要修复下构造函数
})();