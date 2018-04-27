var tempFile="";
function init() {
	$("#myfile").fileinput({
		// 上传的地址
		uploadUrl : $$pageContextPath+"/template/sys/getAllFileTable",
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
	})
	
	//导入文件上传完成之后的事件
    $("#myfile").on("fileuploaded", function (event, data, previewId, index) {
    	var ajaxDataWrap=data.response;
    	gridResource.setDataWrap(ajaxDataWrap);
    });
}

var checkedRecords;
function stepChanging(event, currentIndex, newIndex){
	if(currentIndex==0){
		checkedRecords=gridTable.getCheckedRecords();
		if(checkedRecords.length==0){
			$._Alert("至少选择一个表。");
			return false;
		}
	}
	else if(currentIndex==2){
		gridAim.addRecords(checkedRecords);
	}
}

function customerFunction(a,b,c){
	return ' <a href="javascript:showDetail(\''+b.tableName+'\')">'+
     ' <span class="glyphicon glyphicon-fullscreen"></span>'+
     ' </a>';
}

function showDetail(table){
	$._OpenDialog({
		type : 2,
		title : "详细信息",
		width : 930,
		height : 630,
		shade : 0.4,
		closeBtn : 1,
		shadeClose : true,
		maxmin : true,
		content : $$pageContextPath + '/template/sys/assistant/generateDetail.jsp',
		data : null,
		yes : function() {
			
		},
		cancel : function() {

		}
	});
}