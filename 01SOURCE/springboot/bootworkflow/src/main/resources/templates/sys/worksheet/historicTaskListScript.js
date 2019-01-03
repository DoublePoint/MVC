function init(response) {
	var admin = response.get("dataPacket");
	ajaxgrid.setDataPacket(admin);
}


function customerFunction(a, record, c) {
	return ' <a href="javascript:detail(\'' + record.id + '\')">' + '详细信息' + ' </a>';
}
function detail(taskId){
	$.request({
		url : $$pageContextPath + "/workflow/task/"+taskId,
		type : "POST",
		contentType : 'application/json;charset=UTF-8',
		dataType : "json",
		async : true,
		success : function(response){
			var dataPacket=response.get("dataPacket");
			var task=dataPacket.data;
			var form=task.formKey;
			alert(form)
		}
	});
}