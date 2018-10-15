function retrieve() {
	var dataWrap = lltestdatagrid.collectDataWrap();
	var nodes = treeDemo.getSelectedNodes();
	var selectNodeCdbs="";
	if (nodes.length > 0) {
		selectNodeCdbs = nodes[0].code;
	}
	var formData=ajaxform.collectDataWrap();
	formData.data.id=selectNodeCdbs;
	dataWrap.setData(formData.data);
	$.request({
		url : $$pageContextPath + "/template/sys/menu/retrieve",
		type : "POST",
		contentType : 'application/json;charset=UTF-8',
		dataType : "json",
		async : false,
		data :{
			dataWrap:dataWrap
		},
		success : retrieveSuccess
	});
}

function retrieveSuccess(response){
	var dataWrap=response.get("dataWrap");
	if(dataWrap==null||dataWrap.dataList==null||dataWrap.dataList.length==0)
		$.shakeTips("未查询到任何数据!",2000);
	lltestdatagrid.setDataWrap(dataWrap);
}

function retrieveTree() {
	treeDemo.render();
}
function onClickSave() {
	var nodes = treeDemo.getSelectedNodes();
	var parentMenuId;
	if (nodes.length == 0) {
		$.shakeTips("请选择父节点");
		return;
	} else {
		parentMenuId = nodes[0].code;
	}
	var ajaxDataWrap =  $.createAjaxDataWrap();
	ajaxDataWrap.setDataList(nodes[0]);
	$.openDialog({
		type : 2,
		title : "维护菜单",
		width : 630,
		height : 330,
		shade : 0.4,
		closeBtn : 1,
		shadeClose : true,
		maxmin : true,
		url : $$pageContextPath + '/template/sys/menu/menuDialog?aaa=2&testParam=321',
		data : {
			ajaxDataWrap:ajaxDataWrap,
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

function onClickTransmit() {
	$.request({
		url:$$pageContextPath+"/template/sys/workflow/announcement/save",
		data:{
			annChangedWrap:ajaxformAnnouncement.collectDataWrap(),
		},
		success:function(response){
			if(response.get("worksheetNo")!=null){
				worksheetNo=response.get("worksheetNo");
				$.alert("保存成功。");
				retrieve();
			}
			else
				$.alert("保存失败。")
		}
			
	});

}

function zTreeOnClick(event, treeId, treeNode) {
	lltestdatagrid.getDataWrap().getPageInfo().clear();
	retrieve();
	return false;
};

function dbclickgrid(para1,data,index){
	var ajaxDataWrap =  $.createAjaxDataWrap();
	var dataArr=new Array();
	dataArr.push(data);
	ajaxDataWrap.setDataList(dataArr);
	$.openDialog({
		type : 2,
		title : "维护菜单",
		width : 630,
		height : 330,
		shade : 0.4,
		closeBtn : 1,
		shadeClose : true,
		maxmin : true,
		url : $$pageContextPath + '/template/sys/menu/menuDialog?type=edit',
		data : {
			dataWrap:ajaxDataWrap,
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