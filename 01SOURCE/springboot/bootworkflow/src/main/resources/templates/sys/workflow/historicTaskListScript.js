var instanceId;
function init(response) {
	var dataWrap = response.get("dataWrap");
	ajaxgrid.setDataWrap(dataWrap);
	instanceId=response.get("instanceId");
}


function customerFunction(a, record, c) {
	return ' <a href="javascript:detail(\'' + record.id + '\')">' + '详细信息' + ' </a>';
}
function detail(taskId){
	$.request({
		url : $$pageContextPath + "/workflow/task/"+taskId,
		success : function(response){
			var dataWrap=response.get("dataWrap");
			var task=dataWrap.data;
			var form=task.formKey;
			alert(form)
		}
	});
}

function onClickTransmit(){
	$.request({
		url : $$pageContextPath + "/workflow/instance/transmit/"+instanceId,
		success : function(response){
			retrieve();
		}
	});
}
function onClickRollBack(){
	$.request({
		url : $$pageContextPath + "/workflow/instance/rollback/"+instanceId,
		success : function(response){
			retrieve();
		}
	});
}

function retrieve(){
	$.request({
		url : $$pageContextPath + "/workflow/instance/"+instanceId+"/history/task",
		success : function(response){
			var dataWrap=response.get("dataWrap");
			ajaxgrid.setDataWrap(dataWrap);
		}
	});
}