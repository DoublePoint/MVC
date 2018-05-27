function init(response) {
	
}

function addNewRecord() {
	var record = ajaxgrid.createRecord();
	ajaxgrid.addRecord(record);
}

function retrieve() {
	var dataWrap = ajaxgrid.collectData();

	var formData = ajaxform.collectData();
	var array = [];
	array.push(formData);
	dataWrap.setDataList(array);

	$.request({
		url : $$pageContextPath + "/template/sys/extendproperty/retrieve",
		type : "POST",
		contentType : 'application/json;charset=UTF-8',
		dataType : "json",
		async : false,
		data : {
			dataWrap : dataWrap
		},
		success : function(response) {
			var dataWrap = response.get("dataWrap");
			if (dataWrap == null || dataWrap.dataList == null || dataWrap.dataList.length == 0)
				$.shakeTips("未查询到任何数据!", 2000);
			ajaxgrid.setDataWrap(dataWrap);
		}
	});
}

function onClickSave() {
	var data = ajaxgrid.collectData("all");
	$.request({
		url : $$pageContextPath + "/template/sys/extendproperty/add",
		data : {
			dataWrap : data
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
			deleteDataWrap : ajaxgrid.collectData("checked")
		};
		$.request({
			url : $$pageContextPath + "/template/sys/extendproperty/delete",
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
		url : $$pageContextPath + '/template/sys/role/bindMenu',
		data:{
			roleId:id
		}
	});
}
