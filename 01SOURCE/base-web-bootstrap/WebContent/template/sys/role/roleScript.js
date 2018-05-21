function init(response) {
	// $.ajax({
	// type : 'post',
	// contentType : 'application/json;charset=UTF-8',// 关键是要加上这行
	// url : $$pageContextPath + "/template/sys/role/datalist",
	// data : JSON.stringify(data.field) + "",
	// success : function(ajaxDataWrap) {
	// if(ajaxDataWrap==null||ajaxDataWrap.dataList==null||ajaxDataWrap.dataList.length==0)
	// $.shakeTips("未查询到任何数据!",2000);
	// roleAjaxGrid.setDataWrap(ajaxDataWrap);
	// },
	// error : function(ecx) {
	// $.shakeTips('保存失败');
	// return false;
	// }
	// });
}

function addNewRecord() {
	var record = roleAjaxGrid.createRecord();
	roleAjaxGrid.addRecord(record);
}

function retrieve() {
	var dataWrap = roleAjaxGrid.collectData();

	var formData = ajaxform.getData();
	var array = [];
	array.push(formData);
	dataWrap.setDataList(array);

	$.request({
		url : $$pageContextPath + "/template/sys/role/search",
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
			roleAjaxGrid.setDataWrap(dataWrap);
		}
	});
}

function onClickSave() {
	var data = roleAjaxGrid.collectData("all");
	$.request({
		url : $$pageContextPath + "/template/sys/role/save",
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
			deleteDataWrap : roleAjaxGrid.collectData("checked")
		};
		$.request({
			url : $$pageContextPath + "/template/sys/role/delete",
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
