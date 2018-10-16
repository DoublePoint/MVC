function zTreeOnClick(event, treeId, treeNode) {
	var menuId=treeNode.code;
	var menuName=treeNode.name;
	$.close(treeNode);
};
function onOk(){
	$.close(treeNode);
}