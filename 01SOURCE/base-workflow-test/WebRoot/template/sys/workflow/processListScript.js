function init(response){
	var dataWrap = response.get("dataWrap");
	ajaxgrid.setDataWrap(dataWrap);
}

function customerFunction(a, process, c) {
	return ' <a href="javascript:showWorkFlowImage(\'' + process.id + '\')">' + ' <span class="glyphicon icon-tags"></span>' + ' </a>';
}

function showWorkFlowImage(pId){
	$.openDialog({
		url:$$pageContextPath+"/template/sys/workflow/resource/processdefine/image?type=image&pdId="+pId
	});
}