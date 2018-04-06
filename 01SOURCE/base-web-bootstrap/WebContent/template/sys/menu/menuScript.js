function retrieve() {
	var ajaxDataWrap = lltestdatagrid.getDataWrap(false);
	var nodes = treeDemo.getSelectedNodes();
	var selectNodeCdbs="";
	if (nodes.length > 0) {
		selectNodeCdbs = nodes[0].id;
	}
	var formData=ajaxform.getData();
	formData.id=selectNodeCdbs;
	var array = new Array();
	array.push(formData);
	ajaxDataWrap.setDataList(array);
	// obj={"code":"","msg":"","dataList":[{"cdbs":"398121904285679616","cdmc":"菜单管理","sjcdbs":"","cdcj":1,"cdpx":1,"cdlj":"","gxsj":null,"cjsj":{"monthValue":1,"month":"JANUARY","year":2018,"dayOfMonth":3,"dayOfWeek":"WEDNESDAY","dayOfYear":3,"hour":14,"minute":34,"nano":758000000,"second":18,"chronology":{"id":"ISO","calendarType":"iso8601"}}}],"pageInfo":{"currentPageNum":1,"currentPageCount":1,"totalElementCount":3,"totalPageCount":3,"pageSize":1,"sort":null}};
	$.ajax({
		url : $$pageContextPath + "/template/sys/menu/datalist",
		type : "POST",
		contentType : 'application/json;charset=UTF-8',
		dataType : "json",
		async : false,
		data : JSON.stringify(ajaxDataWrap),
		success : function(ajaxDataWrap) {
			if(ajaxDataWrap==null||ajaxDataWrap.dataList==null||ajaxDataWrap.dataList.length==0)
				$._ShakeTips("未查询到任何数据!",2000);
			lltestdatagrid.setDataWrap(ajaxDataWrap);
		}
	});
}
function retrieveTree() {
	treeDemo.render();
}
function onClickAdd() {
	var nodes = treeDemo.getSelectedNodes();
	if (nodes.length == 0) {
		$._ShakeTips("请选择父节点");
		return;
	} else {
		cdbs = nodes[0].id;
	}
	var ajaxDataWrap =  $._CreateAjaxDataWrap();
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
		content : $$pageContextPath + '/template/sys/menu/menuDialog',
		data : ajaxDataWrap,
		yes : function() {
			retrieve();
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
			url : $$pageContextPath + "/template/sys/menu/delete",
			type : "POST",
			contentType : 'application/json;charset=UTF-8',
			dataType : "json",
			data : JSON.stringify(checkedDatas),
			async : false,
			success : function(data) {
				$._Alert('删除成功');
				retrieve();
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
	retrieve();
	// var ajaxDataWrap= new $._AjaxDataWrap("treeNode");
	// var data=$._ParseTreeNodeToCd(treeNode);
	// ajaxDataWrap.setData(data);
	// $.ajax({
	// url : $$pageContextPath + "/template/sys/menu/datalist",
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

function dbclickgrid(para1,data,index){
	var ajaxDataWrap =  $._CreateAjaxDataWrap();
	var dataArr=new Array();
	dataArr.push(data);
	ajaxDataWrap.setDataList(dataArr);
	$._OpenDialog({
		type : 2,
		title : "添加菜单",
		width : 630,
		height : 330,
		shade : 0.4,
		closeBtn : 1,
		shadeClose : true,
		maxmin : true,
		content : $$pageContextPath + '/template/sys/menu/menuDialog?type=edit',
		data : ajaxDataWrap,
		yes : function() {
			retrieve();
			retrieveTree();
		},
		cancel : function() {
			
		}
	});
}