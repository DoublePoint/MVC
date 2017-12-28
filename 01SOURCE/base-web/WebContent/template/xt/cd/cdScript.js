function retrieveAjaxDataGrid() {
	var ajaxDataWrap = lltestdatagrid.getData();
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	var nodes = treeDemo.getSelectedNodes();
	if(nodes.length>=0)
		ajaxDataWrap.setData(nodes);
	$.ajax({
		url : $$pageContextPath + "/template/xt/cd/datalist",
		type : "POST",
		contentType : 'application/json;charset=UTF-8',
		dataType : "json",
		async : false,
		data : ajaxDataWrap,
		success : function(ajaxDataWrap) {
			lltestdatagrid.setData(ajaxDataWrap);
		}
	});
}
function retrieveTree() {
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
	var ajaxDataWrap = new $._AjaxDataWrap();
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
		yes : function(){
			retrieveAjaxDataGrid();
			retrieveTree();
		}
	});

	return false;
}

function onClickDelete() {
	$._Confirm('确定要删除吗？', function() {
		var checkedDatas = lltestdatagrid.getCheckedDataList();
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
				$._ShakeTips('删除失败');
				return false;
			}
		});
	}, function() {
	});
	
}

function zTreeOnClick(event, treeId, treeNode) {
	var ajaxDataWrap=new AjaxDataWrap("treeNode");
	ajaxDataWrap.setData(treeNode);
//	var cd = {};
//	cd.cdbs = treeNode.cdbs;
	$.ajax({
		url : $$pageContextPath + "/template/xt/cd/datalist",
		type : "POST",
		contentType : 'application/json;charset=UTF-8',
		dataType : "json",
		data : JSON.stringify(ajaxDataWrap),
		async : false,
		success : function(datawrap) {
			lltestdatagrid.setData(datawrap);
		}
	});
	return false;
};
function rowClickTest(data) {
	var dd = data;
}