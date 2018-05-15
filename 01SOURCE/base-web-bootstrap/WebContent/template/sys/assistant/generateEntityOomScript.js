var tempFile="";
var generateDir="";
var oomName="";
var checkedRecords;
function init(response) {
	var testParamn=response.get("test111");
}
function fileuploaded(response){
	var ajaxDataWrap=response.get("ajaxDataWrap");
	gridResource.setDataWrap(ajaxDataWrap);
	oomName=response.get("oomName");
}

function stepChanging(event, currentIndex, newIndex){
	if(currentIndex==0){
		checkedRecords=gridResource.getCheckedRecords();
		if(checkedRecords.length==0){
			$.tips("至少选择一个表。");
			return false;
		}
	}
	else if(currentIndex==2){
		gridAim.setDataWrap(gridResource.collectData("checked"));
		var data1={
				dataWrap:gridResource.collectData("checked"),
				oomName:oomName
		};
		$.request({
			url : $$pageContextPath + "/template/sys/assistant/generate",
			data : data1,
			success:function(response){
				generateDir=response.get("generateDir");
			}
		});
	}
}

function customerFunction(a,b,c){
	return ' <a href="javascript:showDetail(\''+b.tableName+'\')">'+
     ' <span class="glyphicon glyphicon-fullscreen"></span>'+
     ' </a>';
}

function showDetail(tableName){
	$.openDialog({
		type : 2,
		url: $$pageContextPath + '/template/sys/assistant/generateDetail',
		title : "详细信息",
		width : 930,
		height : 630,
		shade : 0.4,
		closeBtn : 1,
		shadeClose : true,
		maxmin : true,
		data : {
			generateDir:generateDir,
			tableName:tableName
		},
	});
}

function zipAndDownLoad(){
	$.request({
		contentType:"application/octet-stream",
		url: $$pageContextPath + '/template/sys/assistant/zipAndDownload',
		data:{
			generateDir:generateDir
		},
	});
}