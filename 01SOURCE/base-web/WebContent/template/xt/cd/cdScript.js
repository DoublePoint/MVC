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
		succeed : function() {
			alert(111);
		}
	});

	return false;
}
function onClickDelete() {
	parent.$layer.confirm('确定要删除吗？', {
		btn : [ '确定', '取消' ]
	// 按钮
	}, function() {
		var checkStatus = $table.checkStatus('demo'), data = checkStatus.data;
		$layer.alert(JSON.stringify(data));
		$.ajax({
			url : $$pageContextPath + "/template/xt/cd/cdDelete",
			type : "POST",
			contentType : 'application/json;charset=UTF-8',
			dataType : "json",
			data : JSON.stringify(data),
			async : false,
			success : function(data) {
				layer.msg('删除成功');
			},
			error : function() {
				alert("error");
			}
		});
	}, function() {
		$layer.msg('也可以这样', {
			time : 20000, // 20s后自动关闭
			btn : [ '明白了', '知道了' ]
		});
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
		url : $$pageContextPath + "/template/xt/cdDataList",
		type : "POST",
		contentType : 'application/json;charset=UTF-8',
		dataType : "json",
		data : JSON.stringify(cd),
		async : false,
		success : function(data) {
			lltestdatagrid.setData(data);
		},
		error : function() {
			alert("error");
		}
	});
	return false;
	// alert(treeNode.cdmc + ", " + treeNode.cdbs);
};

function init() {
	
}
