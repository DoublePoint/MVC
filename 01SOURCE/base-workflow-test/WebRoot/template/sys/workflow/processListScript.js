function init(response){
	var dataWrap = response.get("dataWrap");
	ajaxgrid.setDataWrap(dataWrap);
}

function customerFunction(a, b, c) {
	return ' <a href="javascript:showDetail(\'' + b.tableName + '\')">' + ' <span class="glyphicon icon-tags"></span>' + ' </a>';
}
