
function init(response) {
	var type=response.get("type");
	if(type=="add"){
		var parentMenuId = response.get("parentMenuId");
		inpbtn_sjcdbs.setData(parentMenuId);
	}
	else{
		var dataPacket=response.get("dataPacket");
		var data=dataPacket.dataList[0];
		ajaxform.setData(data);
	}
}

function onClickSave(){
	var addDataPacket=ajaxform.collectDataPacket();
	$.request({
		url : $$pageContextPath + "sys/menu/add?testtest=111&test=123",
		data : {
			addDataPacket:addDataPacket
		},
		success : function(data1) {
			$.tips('保存成功');
			$.close();
		},
		error : function(ecx) {
			$.shakeTips('保存失败');
			return false;
		}
	});
}


function selectParent(){
	$.openDialog({
		title : "添加菜单",
		width : 360 ,
		height : 430,
		url : $$pageContextPath + '/sys/commonpage/selectMenu',
		yes : function(selectTreeNode) {
			var menuId=selectTreeNode.id;
			var menuName=selectTreeNode.name;
			inpbtn_sjcdbs.selectItem(menuId,menuName);
		}
	});
}

function clicktest(){
	$.addNotSaveIcon();
	return ;
}
function clickDelete(){
	$.removeNotSaveIcon();
	return ;
}