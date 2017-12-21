function retrieveAjaxDataGrid(){
	$.ajax({
		url : $$pageContextPath + "/template/xt/cd/datalist",
		type : "POST",
		contentType : 'application/json;charset=UTF-8',
		dataType : "json",
		async : false,
		success : function(data) {
			lltestdatagrid.setData(data);
		}
	});
}
function retrieveTree(){
	treeDemo.render();
}
function onClickAdd() {
	// var layer = layui.layer;
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	var nodes = treeDemo.getSelectedNodes();
	if (nodes.length == 0) {
		$._ShakeTips("请选择父节点");
		return;
	} else {
		cdbs = nodes[0].cdbs;
	}
	var ajaxDataWrap = new AjaxDataWrap();
	ajaxDataWrap.setData(nodes[0]);
	$._OpenDialog({
		type : 2,
		title : "添加菜单",
		area : [ '630px', '360px' ],
		shade : 0.4,
		closeBtn : 1,
		shadeClose : true,
		maxmin : true,
		content : $$pageContextPath + '/template/xt/cd-dialog',
		data : ajaxDataWrap,
	});

	return false;
}
function onClickDelete() {
	parent.$layer.confirm('确定要删除吗？', {
		btn : [ '确定', '取消' ]
	// 按钮
	}, function() {
		var checkedDatas=lltestdatagrid.getCheckedDataList();
//		var checkStatus = $table.checkStatus('demo'), data = checkStatus.data;
//		$layer.alert(JSON.stringify(checkedDatas));
		$.ajax({
			url : $$pageContextPath + "/template/xt/cd/delete",
			type : "POST",
			contentType : 'application/json;charset=UTF-8',
			dataType : "json",
			data : JSON.stringify(checkedDatas),
			async : false,
			success : function(data) {
				$._Alert('删除成功');
				retrieveAjaxDataGrid();
				retrieveTree();
			},
			error : function() {
				$._Alert('删除失败');
			}
		});
	}, function() {
//		$layer.msg('也可以这样', {
//			time : 20000, // 20s后自动关闭
//			btn : [ '明白了', '知道了' ]
//		});
	});

}
var tabldHeight;

function filter(treeId, parentNode, childNodes) {
	if (!childNodes)
		return null;
	for (var i = 0, l = childNodes.length; i < l; i++) {
		childNodes[i].cdmc = childNodes[i].cdmc.replace(/\.n/g, '.');
	}
	return childNodes;
}
function zTreeOnClick(event, treeId, treeNode) {
	var cd = {};
	cd.cdbs = treeNode.cdbs;
	$.ajax({
		url : $$pageContextPath + "/template/xt/cd/datalist",
		type : "POST",
		contentType : 'application/json;charset=UTF-8',
		dataType : "json",
		data : JSON.stringify(cd),
		async : false,
		success : function(data) {
			lltestdatagrid.setData(data);
		}
	});
	return false;
	// alert(treeNode.cdmc + ", " + treeNode.cdbs);
};
function rowClickTest(data){
	var dd=data;
}
function init() {
	
}
