function init(response) {
	var treeNode = response.getDataList("clickNode");
	var cdbs = treeNode.cdbs;
	var cdmc = treeNode.cdmc;

//	ajaxform.setFieldValue("sjcdbs", cdbs);
	inpbtn_sjcdbs.setData(cdbs, cdmc);
}

// 监听提交
$form.on('submit(demo1)', function(data) {
	$.ajax({
		type : 'post',
		// dataType : "JSON",
		contentType : 'application/json;charset=UTF-8',// 关键是要加上这行
		url : $$pageContextPath + "/template/xt/cd/add",
		data : JSON.stringify(data.field) + "",
		success : function(data1) {
			$._Alert('保存成功');
			$._Close();
		},
		error : function(ecx) {
			$._ShakeTips('保存失败');
			return false;
		}
	});

	return false;
});

function InputButtonClick() {
	var ajaxDataWrap = null;
	$._OpenDialog({
		type : 2,
		title : "添加菜单",
		width : 360,
		height : 630,
		shade : 0.4,
		closeBtn : 1,
		shadeClose : true,
		maxmin : true,
		content : $$pageContextPath + '/template/xt/cd/cd-tree',
		data : ajaxDataWrap,
		yes : function() {
			alert("关闭");
		}
	});
}

function clicktest(){
	$._AddNotSaveIcon();
	return ;
}
function clickDelete(){
	$._RemoveNotSaveIcon();
	return ;
}