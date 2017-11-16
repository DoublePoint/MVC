
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
						<input type="text" name="title" lay-verify="title"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">菜单链接</label>
					<div class="layui-input-block">
						<input type="text" name="username" lay-verify="required"
							autocomplete="off" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">菜单序号</label>
					<div class="layui-input-block">
						<input type="text" name="username" lay-verify="required"
							autocomplete="off" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">上级菜单</label>
					<div class="layui-input-block">
						<input type="text" name="username" lay-verify="required"
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

									//监听指定开关
									form
											.on(
													'switch(switchTest)',
													function(data) {
														layer
																.msg(
																		'开关checked：'
																				+ (this.checked ? 'true'
																						: 'false'),
																		{
																			offset : '6px'
																		});
														layer
																.tips(
																		'温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF',
																		data.othis)
													});

									//监听提交
									form.on('submit(demo1)', function(data) {
										layer.alert(JSON.stringify(data.field),
												{
													title : '最终的提交信息'
												})
										return false;
									});

									layui
											.tree({
												elem : '#demo' //传入元素选择器
												,
												nodes : [
														{ //节点
															name : '父节点1',
															children : [ {
																name : '子节点11'
															}, {
																name : '子节点12'
															} ]
														},
														{
															name : '父节点2（可以点左侧箭头，也可以双击标箭头，也可以双击标箭头，也可以双击标箭头，也可以双击标题）',
															children : [ {
																name : '子节点21',
																children : [ {
																	name : '子节点211'
																} ]
															} ]
														} ]
											});
								});
			</script>
		</div>
</body>