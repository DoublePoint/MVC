function init(response){
	var treeNode=response.getData("clickNode");
	var cdbs=treeNode.cdbs;
	var cdmc=treeNode.cdmc;
	$("#sjcdbs").val(cdbs);
	cdmcId.setData(cdmc);
	alert(1);
	ajaxform1.setFieldValue("cdxh","ajaxform");
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
			// 提示层
			parent.$layer.msg('保存成功');
		},
		error : function(ecx) {
			// parent.layer.msg('保存失败');
			alert(ecx.responseText);
			return false;
		}

	});
	return false;
});


function testAlert(te){
	alert(te);
}