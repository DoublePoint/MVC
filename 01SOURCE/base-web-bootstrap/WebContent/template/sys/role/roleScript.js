function init(response) {
	$.ajax({
		type : 'post',
		contentType : 'application/json;charset=UTF-8',// 关键是要加上这行
		url : $$pageContextPath + "/template/sys/role/datalist",
		data : JSON.stringify(data.field) + "",
		success : function(ajaxDataWrap) {
			if(ajaxDataWrap==null||ajaxDataWrap.dataList==null||ajaxDataWrap.dataList.length==0)
				$._ShakeTips("未查询到任何数据!",2000);
			roleAjaxGrid.setDataWrap(ajaxDataWrap);
		},
		error : function(ecx) {
			$._ShakeTips('保存失败');
			return false;
		}
	});
}