function init(response){
	var dataPacket = response.get("dataPacket");
	ajaxgrid.setDataPacket(dataPacket);
}

function customerFunction(a, process, c) {
	return ' <a href="javascript:showWorkFlowImage(\'' + process.id + '\')">' + ' <span class="glyphicon icon-tags"></span>' + ' </a>';
}

function showWorkFlowImage(pId){
	$.openDialog({
		url:$$pageContextPath+"/oll/instance/svg?type=image&pdId="+pId
	});
}