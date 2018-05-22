var roleId;
var dataWrap;
function init(response){
	roleId=response.get("roleId");
	dataWrap=response.get("dataWrap");
}

function treeOnLoad(){
	var dataList=dataWrap.dataList;
	menuTree.checkNodesByDataList(dataList,"menuId","id");
}

function onOk(){
	var checkNodes=menuTree.getCheckedNodes();
	if(checkNodes==null||checkNodes.length==0){
		$.alert("请至少选中一个菜单。");
		return;
	}
	var dataWrap=$.createAjaxDataWrap();
	dataWrap.dataList=checkNodes;
	$.request({
		url:$$pageContextPath+"/template/sys/role/bind-menu",
		data:{
			dataWrap:dataWrap,
			roleId:roleId
		},
		success:function(responseState){
			if(responseState){
				$.tips("绑定成功。");
				$.close();
			}
			else{
				$.alert("绑定失败。");
			}
		}
	});
}