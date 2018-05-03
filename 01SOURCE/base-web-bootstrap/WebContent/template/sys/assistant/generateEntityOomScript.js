var tempFile="";
function init(response) {
	var testParamn=response.get("test111");
}
var oomFile="";
function fileuploaded(response){
	var ajaxDataWrap=response.get("ajaxDataWrap");
	gridResource.setDataWrap(ajaxDataWrap);
	
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
		gridAim.addRecords(checkedRecords);
		var data1={
				dataWrap:gridResource.collectData(),
		};
		$.request({
			url : $$pageContextPath + "/template/sys/testGetDataWrap",
			type : "POST",
			contentType : 'application/json;charset=UTF-8',
			dataType : "json",
			data : JSON.stringify(data1),
		});
	}
}

function customerFunction(a,b,c){
	return ' <a href="javascript:showDetail(\''+b.tableName+'\')">'+
     ' <span class="glyphicon glyphicon-fullscreen"></span>'+
     ' </a>';
}

function showDetail(table){
	$.openDialog({
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