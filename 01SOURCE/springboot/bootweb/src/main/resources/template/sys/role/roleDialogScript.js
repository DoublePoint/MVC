function init(response) {
	var type=$.getRequestParam("type");
	if(type==null){
		var treeNode = response.getDataList("clickNode");
		var id = treeNode.id;
		var name = treeNode.name;
		inpbtn_sjcdbs.selectItem(id, name);
	}
	else{
		var dataWrap=response.get("dataWrap");
		var data=dataWrap.dataList[0];
		ajaxform.setData(data);
	}
}

function onClickSave(){
	var data=ajaxform.collectDataWrap();
	var addDataWrap =  $.createAjaxDataWrap();
	var dataList=new Array();
	dataList[0]=data;
	addDataWrap.setDataList(dataList);
	$.request({
		url : $$pageContextPath + "/template/sys/menu/add?testtest=111&test=123",
		data : {
			addDataWrap:addDataWrap
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
		width : 360,
		height : 430,
		url : $$pageContextPath + '/template/sys/commonpage/selectMenu.jsp',
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