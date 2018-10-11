function init(response) {
	var admin = response.get("dataWrap");
	ajaxgrid.setDataWrap(admin);
}


function customerFunction(a, record, c) {
	return ' <a href="javascript:detail(\'' + record.id + '\')">' + '详细信息' + ' </a>';
}
function detail(taskId){
	$.request({
		url : $$pageContextPath + "//workflow/task/taskId",
		type : "POST",
		contentType : 'application/json;charset=UTF-8',
		dataType : "json",
		async : true,
		success : function(response){
			var dataWrap=response.get("dataWrap");
			var task=dataWrap.data;
			try{
				parent.doClickDetail(task);
			}
			catch(e){
				
			}
		}
	});
}