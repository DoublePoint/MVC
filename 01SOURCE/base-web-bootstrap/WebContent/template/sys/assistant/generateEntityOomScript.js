var tempFile="";
var generateDirPath="";
function init(response) {
	var testParamn=response.get("test111");
}
var oomFileName="";
function fileuploaded(response){
	var ajaxDataWrap=response.get("ajaxDataWrap");
	gridResource.setDataWrap(ajaxDataWrap);
	oomFileName=response.get("oomFileName");
}

var checkedRecords;
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
				oomFileName:oomFileName
		};
		$.request({
			url : $$pageContextPath + "/template/sys/assistant/generate",
			data : data1,
			success:function(response){
				generateDirPath=response.get("generateDirPath");
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
		title : "详细信息",
		width : 930,
		height : 630,
		shade : 0.4,
		closeBtn : 1,
		shadeClose : true,
		maxmin : true,
		content : $$pageContextPath + '/template/sys/assistant/generateDetail?generateDirPath='+generateDirPath+"&tableName="+tableName,
		data : {
			generateDirPath:generateDirPath,
			tableName:tableName
		},
		yes : function() {
			
		},
		cancel : function() {

		}
	});
}