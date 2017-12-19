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
		content : $$pageContextPath + '/template/xt/cdDialog',
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
			$table.render({
				elem : '#demo',
				data : data,
				// height : 'auto',
				// height : '400',
				// height : $("#demo").parent().height(),
				height : $(window).height() - 40,
				// height :
				// $(window).height()-$("#demo").parent().find("layui-btn-group").height(),
				cols : [ [ // 标题栏
				{
					checkbox : true,
					LAY_CHECKED : false
				} // 默认全选
				, {
					field : 'cdbs',
					title : '菜单标识',
					width : 180,
					sort : true
				}, {
					field : 'cdmc',
					title : '菜单名称',
					width : 180
				}, {
					field : 'cdpx',
					title : '菜单排序',
					width : 150
				}, {
					field : 'cdlj',
					title : '签名',
					width : 150
				} ] ],
				skin : 'row' // 表格风格
				,

				even : true,
				page : true // 是否显示分页
				,
				limits : [ 5, 7, 10, 20, 100 ],
				limit : 50
			// 每页默认显示的数量
			});
		},
		error : function() {
			alert("error");
		}
	});

	// alert(treeNode.cdmc + ", " + treeNode.cdbs);
};

function init() {
	
}
