function retrieve() {
	var worksheetDataPacket = ajaxgrid.collectDataPacket();
	var queryDataPacket = ajaxform.collectDataPacket();
	$.request({
		url : $$pageContextPath + "sys/worksheet/retrieve",
		type : "POST",
		contentType : 'application/json;charset=UTF-8',
		dataType : "json",
		async : false,
		data : {
			queryDataPacket : queryDataPacket,
			worksheetDataPacket : worksheetDataPacket
		},
		success : retrieveSuccess
	});
}

function retrieveSuccess(response) {
	var dataPacket = response.get("dataPacket");
	if (dataPacket == null || dataPacket.dataList == null || dataPacket.dataList.length == 0)
		$.shakeTips("未查询到任何数据!", 2000);
	ajaxgrid.setDataPacket(dataPacket);
}

function imageCustomer(a, record, c) {
	return ' <a href="javascript:maintenceAdmin(' + record.id + ')">' + ' <span class="glyphicon icon-tags" style="color:#15B194;"></span>' + ' </a>';
}

function sheetCustomer(a, record, c){
	return ' <a href="javascript:showHistoricTasks(' + record.instanceId + ')">' + record.worksheetNo + ' </a>';
}
function showHistoricTasks(instanceId,worksheetNo){
	$.openTab({
		title : "工单历史",
		content : '<iframe src="http://localhost:8080/base-workflow-test/workflow/instance/'+instanceId+'/history/task/"></iframe>',
		id : instanceId
	});
}