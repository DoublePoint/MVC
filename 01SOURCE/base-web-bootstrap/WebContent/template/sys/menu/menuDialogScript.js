function init(response) {
	var type=$.getRequestParam("type");
	if(type==null){
		var treeNode = response.getDataList("clickNode");
		var id = treeNode.id;
		var name = treeNode.name;
		inpbtn_sjcdbs.setData(id, name);
	}
	else{
		var data=response.getDataList()[0];
		ajaxform.setData(data);
	}
//	ajaxform.setFieldValue("sjcdbs", cdbs);

}

function onClickSave(){
	var data=ajaxform.getData();
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

function InputButtonClick() {
	var ajaxDataWrap = null;
	$.openDialog({
		type : 2,
		title : "添加菜单",
		width : 360,
		height : 630,
		shade : 0.4,
		closeBtn : 1,
		shadeClose : true,
		maxmin : true,
		content : $$pageContextPath + '/template/sys/menu/menu-tree',
		data : ajaxDataWrap,
		yes : function() {
			alert("关闭");
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