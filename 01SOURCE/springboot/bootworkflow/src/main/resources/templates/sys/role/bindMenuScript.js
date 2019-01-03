var roleId;
var dataPacket;
function init(response){
	roleId=response.get("roleId");
	dataPacket=response.get("dataPacket");
}

function treeOnLoad(){
	var dataList=dataPacket.dataList;
	menuTree.checkNodesByDataList(dataList,"menuId","id");
}

function onOk(){
	var checkNodes=menuTree.getCheckedNodes();
	if(checkNodes==null||checkNodes.length==0){
		$.alert("请至少选中一个菜单。");
		return;
	}
	var dataPacket=$.createAjaxDataPacket();
	dataPacket.dataList=checkNodes;
	$.request({
		url:$$pageContextPath+"sys/role/bind-menu",
		data:{
			dataPacket:dataPacket,
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