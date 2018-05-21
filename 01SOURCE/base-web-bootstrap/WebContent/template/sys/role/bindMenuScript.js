function zTreeOnClick(event, treeId, treeNode) {
	var menuId=treeNode.id;
	var menuName=treeNode.name;
	$.close(treeNode);
};
function onOk(){
	$.close(treeNode);
}