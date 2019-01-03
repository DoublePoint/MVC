function init(response) {
	var dataPacket = response.get("dataPacket");
	ajaxgrid.setDataPacket(dataPacket);
}

function retrieve() {
	var gridPacket = ajaxgrid.collectDataPacket();
	var formPacket=ajaxform.collectDataPacket();
	$.request({
		url : $$pageContextPath + "oll/model/model-retrieve",
		type : "POST",
		contentType : 'application/json;charset=UTF-8',
		dataType : "json",
		async : false,
		data :{
			gridPacket:gridPacket,
			formPacket:formPacket
		},
		success : retrieveSuccess
	});
}

function retrieveSuccess(response){
	var dataPacket=response.get("dataPacket");
	if(dataPacket==null||dataPacket.dataList==null||dataPacket.dataList.length==0)
		$.shakeTips("未查询到任何数据!",2000);
	ajaxgrid.setDataPacket(dataPacket);
}

function onClickAdd() {
	$.openDialog({
		type : 2,
		title : "维护菜单",
		width : 630,
		height : 330,
		url : $$pageContextPath + 'oll/model/model-add',
		data : {},
		yes : function() {
			retrieve();
		},
		cancel : function() {

		}
	});
}


function onClickDelete() {
	$.confirm('确定要删除吗？', function() {
		var data={
			dataPacket:ajaxgrid.collectDataPacket("checked")
		};
		$.request({
			url : $$pageContextPath + "oll/model/model-delete",
			data : data,
			success : function(response) {
				var deleteState=response.get("deleteState");
				if(!deleteState){
					$.alert("删除失败!");
					return;
				}
				$.tips('删除成功');
				retrieve();
			},
			error : function() {
				$.shakeTips('删除失败');
				return false;
			}
		});
	}, function() {
	});

}

function customerFunction(a, record, c) {
	return ' <a href="javascript:deploy(\'' + record.id + '\')">' + ' <i class="glyphicon glyphicon-bullhorn"></i>' + ' </a>';
}

function deploy(modelId){
	$.request({
		url:$$pageContextPath+"oll/model/deploy/"+modelId,
		success:function(response){
			var returnMessage=response.get("returnMessage");
			$.alert(returnMessage);
		}
	});
}

function editModelCustomerFunction(a,record,c){
	return ' <a href="javascript:edit(\'' + record.id + '\')">' + ' <i class="fa fa-pencil-square-o"></i>' + ' </a>';
}
function edit(modelId){
	$.openTab({
		title : "Model:"+modelId,
		content : '<iframe src="' + $$pageContextPath + 'modeler.html?modelId=' + modelId + '"></iframe>',
		id : modelId
	});
}