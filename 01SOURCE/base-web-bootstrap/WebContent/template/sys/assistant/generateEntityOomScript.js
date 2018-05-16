var tempFile = "";
var generateDir = "";
var oomName = "";
var checkedRecords;
function init(response) {
	var testParamn = response.get("test111");
}
function fileuploaded(response) {
	var ajaxDataWrap = response.get("ajaxDataWrap");
	gridResource.setDataWrap(ajaxDataWrap);
	oomName = response.get("oomName");
}

function stepChanging(event, currentIndex, newIndex) {
	if (currentIndex == 0) {
		checkedRecords = gridResource.getCheckedRecords();
		if (checkedRecords.length == 0) {
			$.tips("至少选择一个表。");
			return false;
		}
	} else if (currentIndex == 2) {
		gridAim.setDataWrap(gridResource.collectData("checked"));
		var data1 = {
			dataWrap : gridResource.collectData("checked"),
			oomName : oomName
		};
		$.request({
			url : $$pageContextPath + "/template/sys/assistant/generate",
			data : data1,
			success : function(response) {
				generateDir = response.get("generateDir");
			}
		});
	}
}

function customerFunction(a, b, c) {
	return ' <a href="javascript:showDetail(\'' + b.tableName + '\')">' + ' <span class="glyphicon glyphicon-fullscreen"></span>' + ' </a>';
}

function showDetail(tableName) {
	$.openDialog({
		type : 2,
		url : $$pageContextPath + '/template/sys/assistant/generateDetail',
		title : "详细信息",
		width : 930,
		height : 630,
		shade : 0.4,
		closeBtn : 1,
		shadeClose : true,
		maxmin : true,
		data : {
			generateDir : generateDir,
			tableName : tableName
		},
	});
}

function zipAndDownLoad() {
	$.formSubmit({
		url: $$pageContextPath + '/template/sys/assistant/zipAndDownload',
		data:{
			generateDir:generateDir
		}
	});
//	var form = $("<form>");// 定义一个form表单
//	form.attr("style", "display:none");
//	form.attr("target", "");
//	form.attr("method", "post");
//	form.attr("action", $$pageContextPath + '/template/sys/assistant/zipAndDownload');
//	var fileInput = $("<input>");
//	fileInput.attr("type", "hidden");
//	fileInput.attr("id", "generateDir");
//	fileInput.attr("name", "generateDir");// 设置属性的名字
//	//fileInput.attr("value", JSON.stringify({generateDir:generateDir}));// 设置属性的值
//	fileInput.attr("value", generateDir);// 设置属性的值
//	$("body").append(form);//将表单放置在web中
//	form.append(fileInput);
//	form.submit();// 表单提交
//	$("body").remove(form);
}