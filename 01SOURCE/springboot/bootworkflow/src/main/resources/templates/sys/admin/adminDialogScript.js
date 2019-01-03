function init(response) {
	var type = response.get("type");
	if (type == "add") {
	} else {
		var admin = response.get("admin");
		ajaxform.setData(admin);
	}
	
}

function onClickSave() {
	if (!ajaxform.validate(true)) {
		return;
	}
	var data = ajaxform.collectDataPacket();
	var dataPacket = $.createAjaxDataPacket();
	var dataList = new Array();
	dataList[0] = data;
	dataPacket.setDataList(dataList);
	$.request({
		url : $$pageContextPath + "sys/admin/save?testtest=111&test=123",
		data : {
			dataPacket : dataPacket
		},
		success : function(data1) {
			$.tips('保存成功');
			$.close(true);
		},
		error : function(ecx) {
			$.shakeTips('保存失败');
			return false;
		}
	});
}

function selectParent() {
	$.openDialog({
		title : "添加菜单",
		width : 360,
		height : 430,
		url : $$pageContextPath + '/sys/commonpage/selectMenu.html',
		yes : function(selectTreeNode) {
			var menuId = selectTreeNode.code;
			var menuName = selectTreeNode.name;
			inpbtn_sjcdbs.selectItem(menuId, menuName);
		}
	});
}

function clicktest() {
	$.addNotSaveIcon();
	return;
}
function clickDelete() {
	$.removeNotSaveIcon();
	return;
}