function init(response) {
	var dataWrap = response.get("dataWrap");
	ajaxgrid.setDataWrap(dataWrap);
}

function retrieve() {
	var gridWrap = ajaxgrid.collectDataWrap();
	var formWrap=ajaxform.collectDataWrap();
	$.request({
		url : $$pageContextPath + "/template/sys/workflow/model-retrieve",
		type : "POST",
		contentType : 'application/json;charset=UTF-8',
		dataType : "json",
		async : false,
		data :{
			gridWrap:gridWrap,
			formWrap:formWrap
		},
		success : retrieveSuccess
	});
}

function retrieveSuccess(response){
	var dataWrap=response.get("dataWrap");
	if(dataWrap==null||dataWrap.dataList==null||dataWrap.dataList.length==0)
		$.shakeTips("未查询到任何数据!",2000);
	ajaxgrid.setDataWrap(dataWrap);
}

function onClickAdd() {
	$.openDialog({
		type : 2,
		title : "维护菜单",
		width : 630,
		height : 330,
		url : $$pageContextPath + '/template/sys/workflow/model-add',
		data : {},
		yes : function() {
			retrieve();
		},
		cancel : function() {

		}
	});
}

function customerFunction(a, record, c) {
	return ' <a href="javascript:deploy(\'' + record.id + '\')">' + ' <i class="glyphicon glyphicon-bullhorn"></i>' + ' </a>';
}

function deploy(modelId){
	$.request({
		url:$$pageContextPath+"/template/sys/workflow/model/deploy/"+modelId,
		success:function(response){
			var returnMessage=response.get("returnMessage");
			$.alert(returnMessage);
		}
	});
}