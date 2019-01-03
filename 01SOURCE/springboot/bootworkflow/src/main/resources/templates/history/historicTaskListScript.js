var instanceId;
function init(response) {
	var dataPacket = response.get("dataPacket");
	ajaxgrid.setDataPacket(dataPacket);
	instanceId=response.get("instanceId");
}


function customerFunction(a, record, c) {
	return ' <a href="javascript:detail(\'' + record.id + '\')">' + '详细信息' + ' </a>';
}
function detail(taskId){
	$.request({
		url : $$pageContextPath + "/workflow/task/"+taskId,
		success : function(response){
			var dataPacket=response.get("dataPacket");
			var task=dataPacket.data;
			var form=task.formKey;
			alert(form)
		}
	});
}

function onClickTransmit(){
	$.request({
		url : $$pageContextPath + "oll/instance/"+instanceId+"/transmit"+,
		success : function(response){
			retrieve();
		}
	});
}
function onClickRollBack(){
	$.request({
		url : $$pageContextPath + "oll/instance/"+instanceId+"/rollback"+,
		success : function(response){
			retrieve();
		}
	});
}

function retrieve(){
	$.request({
		url : $$pageContextPath + "oll/history"+instanceId+"/task",
		success : function(response){
			var dataPacket=response.get("dataPacket");
			ajaxgrid.setDataPacket(dataPacket);
		}
	});
}