var roleId;
function init(response){
	roleId=response.get("roleId");
}
function zTreeOnClick(event, treeId, treeNode) {
	var menuId=treeNode.id;
	var menuName=treeNode.name;
	$.close(treeNode);
};
function onOk(){
	var checkNodes=menuTree.getCheckedNodes();
	if(checkNodes==null||checkNodes.length==0){
		$.alert("请至少选中一个菜单。");
		return;
	}
	var dataWrap=$.createAjaxDataWrap();
	dataWrap.dataList=checkNodes;
	$.request({
		url:$$pageContextPath+"/template/sys/role/bind-menu",
		data:{
			dataWrap:dataWrap,
			roleId:roleId
		},
		success:function(responseState){
			if(responseState){
				$.tips("绑定成功。");
				$.close();
			}
			else{
				$.alert("绑定失败。");
			}
		}
	});
}