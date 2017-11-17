layui.use([ 'form', 'layedit', 'laydate', 'tree' ],
	function() {
		var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;
		// 日期
	laydate.render({
		elem : '#date'
	});
	laydate.render({
		elem : '#date1'
	});
	
	// 创建一个编辑器
	var editIndex = layedit.build('LAY_demo_editor');
	
	// 自定义验证规则
	form.verify({
		title : function(value) {
			if (value.length < 5) {
				return '标题至少得5个字符啊';
		}
	},
	pass : [ /(.+){6,12}$/, '密码必须6到12位' ],
		content : function(value) {
			layedit.sync(editIndex);
		}
	});
	
	// 监听提交
	form.on('submit(demo1)', function(data) {
		$.ajax({
			type : 'post',
			//dataType : "JSON",
			contentType:'application/json;charset=UTF-8',//关键是要加上这行
			url : $$pageContextPath + "/template/xt/cd/add",
			//data : data.field,
			data : JSON.stringify(data.field),
			success : function(data1) {
				alert(data1.cdmc);
			},
			error:function(ecx){
				alert(ecx.responseText);
			}
	
			});
		});
	});