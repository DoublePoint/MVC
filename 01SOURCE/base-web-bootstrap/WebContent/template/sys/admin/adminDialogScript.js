function init(response) {
	var type=response.get("type");
	if(type=="add"){
	}
	else{
		var dataWrap=response.get("dataWrap");
		var data=dataWrap.dataList[0];
		ajaxform.setData(data);
	}
}

function onClickSave(){
	if(!ajaxform.validate(true)){
		return;
	} 
	var data=ajaxform.collectData();
	var dataWrap =  $.createAjaxDataWrap();
	var dataList=new Array();
	dataList[0]=data;
	dataWrap.setDataList(dataList);
	$.request({
		url : $$pageContextPath + "/template/sys/admin/save?testtest=111&test=123",
		data : {
			dataWrap:dataWrap
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