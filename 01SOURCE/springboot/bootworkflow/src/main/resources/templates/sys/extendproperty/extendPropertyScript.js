function init(response) {
	
}

function addNewRecord() {
	var record = ajaxgrid.createRecord();
	ajaxgrid.addRecord(record);
}

function retrieve() {
	var dataPacket = ajaxgrid.collectDataPacket();

	var formData = ajaxform.collectDataPacket();
	var array = [];
	array.push(formData);
	dataPacket.setDataList(array);

	$.request({
		url : $$pageContextPath + "sys/extendproperty/retrieve",
		type : "POST",
		contentType : 'application/json;charset=UTF-8',
		dataType : "json",
		async : false,
		data : {
			dataPacket : dataPacket
		},
		success : function(response) {
			var dataPacket = response.get("dataPacket");
			if (dataPacket == null || dataPacket.dataList == null || dataPacket.dataList.length == 0)
				$.shakeTips("未查询到任何数据!", 2000);
			ajaxgrid.setDataPacket(dataPacket);
		}
	});
}

function onClickSave() {
	var data = ajaxgrid.collectDataPacket("all");
	$.request({
		url : $$pageContextPath + "sys/extendproperty/add",
		data : {
			dataPacket : data
		},
		success : function(response) {
			if (response){
				retrieve();
				$.tips('保存成功');
			}
		},
		error : function(ecx) {
			$.shakeTips('保存失败');
			return false;
		}
	});
}

function onClickDelete() {
	$.confirm('确定要删除吗？', function() {
		var data = {
			deleteDataPacket : ajaxgrid.collectDataPacket("checked")
		};
		$.request({
			url : $$pageContextPath + "sys/extendproperty/delete",
			data : data,
			success : function(response) {
				if (!response) {
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

function customerFunction(a, record, c) {
	return ' <a href="javascript:checkMenu(\'' + record.id + '\')">' + ' <span class="glyphicon icon-tags" style="color:#15B194;"></span>' + ' </a>';
}

function checkMenu(id) {
	if (id == null || id == "") {
		$.shakeTips("请先保存");
		return;
	}

	$.openDialog({
		title : "绑定权限",
		width : 360,
		height : 430,
		url : $$pageContextPath + '/sys/role/bindMenu',
		data:{
			roleId:id
		}
	});
}
