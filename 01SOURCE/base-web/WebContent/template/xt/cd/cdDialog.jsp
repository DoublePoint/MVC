
<%
	/* 
	 * 创   建   人： 刘磊
	 * 
	 * 创   建   时   间 ： 2017年11月16日
	 * 
	 * 类   说   明 ：
	 * 
	 * ******************修改日志***********************************
	 * 
	 * 修改人： 修改日期： 修改内容：
	 * 
	 * 修改人： 修改日期： 修改内容：
	*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/template/base.jsp"%>
</head>
<body>
	<div class="layui-col-md10" style="width: 600px;">
		<form class="layui-form" action="">
			<div class="layui-form-item">
				<label class="layui-form-label">菜单名称</label>
				<div class="layui-input-block">
					<input type="text" name="cdmc" lay-verify="title"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">菜单链接</label>
				<div class="layui-input-block">
					<input type="text" name="cdlj" lay-verify="required"
						autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">菜单序号</label>
				<div class="layui-input-block">
					<input type="text" name="cdpx" lay-verify="required"
						autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">上级菜单</label>
				<div class="layui-input-block">
					<input type="text" name="sjcd" lay-verify="required"
						autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>


		</form>

		<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
		<script>
			layui
					.use(
							[ 'form', 'layedit', 'laydate', 'tree' ],
							function() {
								var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;
								//日期
								laydate.render({
									elem : '#date'
								});
								laydate.render({
									elem : '#date1'
								});

								//创建一个编辑器
								var editIndex = layedit
										.build('LAY_demo_editor');

								//自定义验证规则
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

								//监听提交
								form.on('submit(demo1)', function(data) {
									
									
									
									parent.layer.alert(JSON.stringify(data.field), {
										title : '最终的提交信息'
									})
									return false;
								});

							});
		</script>
	</div>
</body>