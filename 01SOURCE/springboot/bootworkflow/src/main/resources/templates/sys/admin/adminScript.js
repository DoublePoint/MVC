function retrieve() {
	var dataPacket = ajaxgrid.collectDataPacket();
	var formData = ajaxform.collectDataPacket();
	var array = [];
	array.push(formData);
	dataPacket.setDataList(array);
	$.request({
		url : $$pageContextPath + "sys/admin/retrieve",
		type : "POST",
		contentType : 'application/json;charset=UTF-8',
		dataType : "json",
		async : false,
		data : {
			dataPacket : dataPacket
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


function onClickDelete() {
	$.confirm('确定要删除吗？', function() {
		var data = {
			dataPacket : ajaxgrid.collectDataPacket("checked")
		};
		$.request({
			url : $$pageContextPath + "sys/admin/delete",
			data : data,
			success : function(deleteState) {
				if (!deleteState) {
					$.alert("删除失败!");
					return;
				}
				$.tips('删除成功');
				retrieve();
			},
			error : function() {
				$.shakeTips('删除失败');
				return false;
			}
		});
	}, function() {
	});

}

function dbclickgrid(para1, data, index) {
	var adminId = data.id;
	maintenceAdmin(adminId);
}

function customerFunction(a, record, c) {
	return ' <a href="javascript:maintenceAdmin(\'' + record.id + '\')">' + ' <span class="glyphicon icon-tags" style="color:#15B194;"></span>' + ' </a>';
}

function customerEnableFunction(a, record, c){
	var state=record.enable;
	if(state=="1"){
		return ' <span class="fa fa-check" style="color:#15B194;"></span>';
	}
	return ' <span class="fa fa-ban"></span>';
}
function maintenceAdmin(id) {
	var type = "add";
	if (id != null && id != "") {
		type = "edit"
	}
	$.openDialog({
		url : $$pageContextPath + '/sys/admin/admin-dialog',
		data : {
			id : id,
			type : type,
		},
		width : 630,
		height : 330,
		yes:function(state){
			if(state)
				retrieve();
		}
	});
}