function retrieveAjaxDataGrid() {
	var ajaxDataWrap = lltestdatagrid.getDataWrap(false);
	// var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	var nodes = treeDemo.getSelectedNodes();
	if (nodes.length > 0) {
		var array = new Array();
		var obj = {};
		obj.cdbs = nodes[0].cdbs;
		array.push(obj);
		ajaxDataWrap.setDataList(array);
	}
	// var
	// obj={"code":"","msg":"","dataList":[{"cdbs":"398121904285679616","cdmc":"菜单管理","sjcdbs":"","cdcj":1,"cdpx":1,"cdlj":"","gxsj":null,"cjsj":{"monthValue":1,"month":"JANUARY","year":2018,"dayOfMonth":3,"dayOfWeek":"WEDNESDAY","dayOfYear":3,"hour":14,"minute":34,"nano":758000000,"second":18,"chronology":{"id":"ISO","calendarType":"iso8601"}}}],"pageInfo":{"currentPageNum":1,"currentPageCount":1,"totalElementCount":3,"totalPageCount":3,"pageSize":1,"sort":null}};
	$.ajax({
		url : $$pageContextPath + "/template/xt/cd/datalist",
		type : "POST",
		contentType : 'application/json;charset=UTF-8',
		dataType : "json",
		async : false,
		data : JSON.stringify(ajaxDataWrap),
		success : function(ajaxDataWrap) {
			lltestdatagrid.setDataWrap(ajaxDataWrap);
		}
	});
}
function retrieveTree() {
	treeDemo.render();
}
function onClickAdd() {
	// var layer = layui.layer;
	// var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	var nodes = treeDemo.getSelectedNodes();
	if (nodes.length == 0) {
		$._ShakeTips("请选择父节点");
		return;
	} else {
		cdbs = nodes[0].cdbs;
	}
	var ajaxDataWrap = new $._AjaxDataWrap();
	ajaxDataWrap.setDataList(nodes[0]);
	$._OpenDialog({
		type : 2,
		title : "添加菜单",
		width : 630,
		height : 330,
		shade : 0.4,
		closeBtn : 1,
		shadeClose : true,
		maxmin : true,
		content : $$pageContextPath + '/template/xt/cd-dialog',
		data : ajaxDataWrap,
		yes : function() {
			retrieveAjaxDataGrid();
			retrieveTree();
		},
		cancel : function() {

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
	lltestdatagrid.getDataWrap().getPageInfo().clear();
	retrieveAjaxDataGrid();
	// var ajaxDataWrap= new $._AjaxDataWrap("treeNode");
	// var data=$._ParseTreeNodeToCd(treeNode);
	// ajaxDataWrap.setData(data);
	// $.ajax({
	// url : $$pageContextPath + "/template/xt/cd/datalist",
	// type : "POST",
	// contentType : 'application/json;charset=UTF-8',
	// dataType : "json",
	// data : JSON.stringify(ajaxDataWrap),
	// async : false,
	// success : function(datawrap) {
	// lltestdatagrid.setDataWrap(datawrap);
	// }
	// });
	return false;
};
function rowClickTest(data) {
	var dd = data;
}