
function retrieve() {
	var dataPacket = lltestdatagrid.collectDataPacket();
	var nodes = treeDemo.getSelectedNodes();
	var selectNodeCdbs="";
	if (nodes.length > 0) {
		selectNodeCdbs = nodes[0].code;
	}
	var formData=ajaxform.collectDataPacket();
	formData.data.id=selectNodeCdbs;
	dataPacket.setData(formData.data);
	$.request({
		url : $$pageContextPath + "sys/menu/retrieve",
		type : "POST",
		contentType : 'application/json;charset=UTF-8',
		dataType : "json",
		async : false,
		data :{
			dataPacket:dataPacket
		},
		success : retrieveSuccess
	});
}

function retrieveSuccess(response){
	var dataPacket=response.get("dataPacket");
	if(dataPacket==null||dataPacket.dataList==null||dataPacket.dataList.length==0)
		$.shakeTips("未查询到任何数据!",2000);
	lltestdatagrid.setDataPacket(dataPacket);
}

function retrieveTree() {
	treeDemo.render();
}
function onClickAdd() {
	var nodes = treeDemo.getSelectedNodes();
	var parentMenuId;
	if (nodes.length == 0) {
		$.shakeTips("请选择父节点");
		return;
	} else {
		parentMenuId = nodes[0].code;
	}
	var ajaxDataPacket =  $.createAjaxDataPacket();
	ajaxDataPacket.setDataList(nodes[0]);
	$.openDialog({
		type : 2,
		title : "维护菜单",
		width : 630,
		height : 330,
		shade : 0.4,
		closeBtn : 1,
		shadeClose : true,
		maxmin : true,
		url : $$pageContextPath + '/sys/menu/menuDialog?aaa=2&testParam=321',
		data : {
			ajaxDataPacket:ajaxDataPacket,
			type:"add",
			parentMenuId:parentMenuId
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

function onClickDelete() {
	$.confirm('确定要删除吗？', function() {
		var data={
			deleteDataPacket:lltestdatagrid.collectDataPacket("checked")
		};
		$.request({
			url : $$pageContextPath + "sys/menu/delete",
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
	lltestdatagrid.getDataPacket().getPageInfo().clear();
	retrieve();
	return false;
};

function dbclickgrid(para1,data,index){
	var ajaxDataPacket =  $.createAjaxDataPacket();
	var dataArr=new Array();
	dataArr.push(data);
	ajaxDataPacket.setDataList(dataArr);
	$.openDialog({
		type : 2,
		title : "维护菜单",
		width : 630,
		height : 330,
		shade : 0.4,
		closeBtn : 1,
		shadeClose : true,
		maxmin : true,
		url : $$pageContextPath + '/sys/menu/menuDialog?type=edit',
		data : {
			dataPacket:ajaxDataPacket,
			type:"edit",
		},
		yes : function() {
			retrieve();
			retrieveTree();
		},
		cancel : function() {
			
		}
	});
}