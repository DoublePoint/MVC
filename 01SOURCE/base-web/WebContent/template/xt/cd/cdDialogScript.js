// 日期
$laydate.render({
	elem : '#date'
});
$laydate.render({
	elem : '#date1'
});

// 创建一个编辑器
var editIndex = $layedit.build('LAY_demo_editor');

// 自定义验证规则
$form.verify({
	title : function(value) {
		if (value.length < 5) {
			return '标题至少得5个字符啊';
		}
	},
	pass : [ /(.+){6,12}$/, '密码必须6到12位' ],
	content : function(value) {
		$layedit.sync(editIndex);
	}
});

// 监听提交
$form.on('submit(demo1)', function(data) {
	$.ajax({
		type : 'post',
		// dataType : "JSON",
		contentType : 'application/json;charset=UTF-8',// 关键是要加上这行
		url : $$pageContextPath + "/template/xt/cd/add",
		// data : data.field,
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