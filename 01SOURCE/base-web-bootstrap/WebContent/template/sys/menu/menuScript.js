function retrieve() {
	var dataWrap = lltestdatagrid.collectData();
	var nodes = treeDemo.getSelectedNodes();
	var selectNodeCdbs="";
	if (nodes.length > 0) {
		selectNodeCdbs = nodes[0].id;
	}
	var formData=ajaxform.getData();
	formData.id=selectNodeCdbs;
	var array = new Array();
	array.push(formData);
	dataWrap.setDataList(array);
	$.request({
		url : $$pageContextPath + "/template/sys/menu/datalist",
		type : "POST",
		contentType : 'application/json;charset=UTF-8',
		dataType : "json",
		async : false,
		data :{
			dataWrap:dataWrap
		},
		success : function(response) {
			var dataWrap=response.get("dataWrap");
			if(dataWrap==null||dataWrap.dataList==null||dataWrap.dataList.length==0)
				$.shakeTips("未查询到任何数据!",2000);
			lltestdatagrid.setDataWrap(dataWrap);
		}
	});
}
function retrieveTree() {
	treeDemo.render();
}
function onClickAdd() {
	var nodes = treeDemo.getSelectedNodes();
	if (nodes.length == 0) {
		$.shakeTips("请选择父节点");
		return;
	} else {
		cdbs = nodes[0].id;
	}
	var ajaxDataWrap =  $.createAjaxDataWrap();
	ajaxDataWrap.setDataList(nodes[0]);
	$.openDialog({
		type : 2,
		title : "添加菜单",
		width : 630,
		height : 330,
		shade : 0.4,
		closeBtn : 1,
		shadeClose : true,
		maxmin : true,
		url : $$pageContextPath + '/template/sys/menu/menuDialog?aaa=2&testParam=321',
		data : {
			ajaxDataWrap:ajaxDataWrap
		},
		yes : function() {
			retrieve();
			retrieveTree();
		},
		cancel : function() {

		}
	});

	return false;
}

function onClickEdit(){
	selectCdmcId.refreshData();
}

function onClickDelete() {
	$.confirm('确定要删除吗？', function() {
		var data={
			deleteDataWrap:lltestdatagrid.collectData("checked")
		};
		$.request({
			url : $$pageContextPath + "/template/sys/menu/delete",
			data : data,
			success : function(response) {
				var deleteState=response.get("deleteState");
				if(!deleteState){
					$.alert("删除失败!");
					return;
				}
				$.tips('删除成功');
				retrieve();
				retrieveTree();
			},
			error : function() {
				$.shakeTips('删除失败');
				return false;
			}
		});
	}, function() {
	});

}

function zTreeOnClick(event, treeId, treeNode) {
	lltestdatagrid.getDataWrap().getPageInfo().clear();
	retrieve();
	return false;
};
function rowClickTest(data,a,b,c) {
	var dd = data;
	var arr=new Array();
	arr.push(data);
	var ajaxDataWrap =  $.createAjaxDataWrap();
	ajaxDataWrap.setDataList(arr);
	$.openDialog({
		type : 2,
		title : "修改菜单",
		width : 630,
		height : 330,
		shade : 0.4,
		closeBtn : 1,
		shadeClose : true,
		maxmin : true,
		url : $$pageContextPath + '/template/sys/menu/menuDialog?type=modify',
		data : ajaxDataWrap,
		yes : function() {
			retrieve();
			retrieveTree();
		},
	});
}

function dbclickgrid(para1,data,index){
	var ajaxDataWrap =  $.createAjaxDataWrap();
	var dataArr=new Array();
	dataArr.push(data);
	ajaxDataWrap.setDataList(dataArr);
	$.openDialog({
		type : 2,
		title : "添加菜单",
		width : 630,
		height : 330,
		shade : 0.4,
		closeBtn : 1,
		shadeClose : true,
		maxmin : true,
		url : $$pageContextPath + '/template/sys/menu/menuDialog?type=edit',
		data : ajaxDataWrap,
		yes : function() {
			retrieve();
			retrieveTree();
		},
		cancel : function() {
			
		}
	});
}