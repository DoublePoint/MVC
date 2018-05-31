function init(response) {
	var dataWrap = response.get("dataWrap");
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
		},
		cancel : function() {

		}
	});
}

function customerFunction(a, b, c) {
	return ' <button class="btn btn-info btn-sm ll-main" type="button" onclick="retrieve()" style="width:80px;">  ' + '<span class="glyphicon "></span> 部署'
			+ '</button>  ';
}
