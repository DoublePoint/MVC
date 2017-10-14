<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/base.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin"
		style="border-bottom: solid 5px #1aa094;">
		<div class="layui-header header header-demo">
			<div class="layui-main">
				<div class="admin-login-box">
					<a class="logo" style="left: 0;" href="http://beginner.zhengjinfan.cn/demo/beginner_admin/"> <span
						style="font-size: 22px;">BeginnerAdmin</span>
					</a>
					<div class="admin-side-toggle">
						<i class="fa fa-bars" aria-hidden="true"></i>
					</div>
					<div class="admin-side-full">
						<i class="fa fa-life-bouy" aria-hidden="true"></i>
					</div>
				</div>
				<ul class="layui-nav admin-header-item">
					<li class="layui-nav-item">
						<a href="javascript:;" class="admin-header-user"> 
							<img src="../template/images/xt/0.jpg" /> 
							<span>beginner</span>
						</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;"><i class="fa fa-user-circle"
									aria-hidden="true"></i> 个人信息</a>
							</dd>
							<dd>
								<a href="javascript:;"><i class="fa fa-gear"
									aria-hidden="true"></i> 设置</a>
							</dd>
							<dd id="lock">
								<a href="javascript:;"> <i class="fa fa-lock"
									aria-hidden="true"
									style="padding-right: 3px; padding-left: 1px;"></i> 锁屏 (Alt+L)
								</a>
							</dd>
							<dd>
								<a href="login.html"><i class="fa fa-sign-out"
									aria-hidden="true"></i> 注销</a>
							</dd>
						</dl></li>
				</ul>
				<ul class="layui-nav admin-header-item-mobile">
					<li class="layui-nav-item"><a href="login.html"><i
							class="fa fa-sign-out" aria-hidden="true"></i> 注销</a></li>
				</ul>
			</div>
		</div>
		<div class="layui-side layui-bg-black" id="admin-side">
			<ul class="layui-nav layui-nav-tree layui-inline" lay-filter="demo"
					style="margin-right: 10px;">
					<li class="layui-nav-item layui-nav-itemed"><a
						href="javascript:;">默认展开</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">选项一</a>
							</dd>
							<dd>
								<a href="javascript:;">选项二</a>
							</dd>
							<dd>
								<a href="javascript:;">选项三</a>
							</dd>
							<dd>
								<a href="">跳转项</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">解决方案</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="">移动模块</a>
							</dd>
							<dd>
								<a href="">后台模版</a>
							</dd>
							<dd>
								<a href="">电商平台</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="">云市场</a></li>
					<li class="layui-nav-item"><a href="">社区</a></li>
				</ul>
		</div>
		<div class="layui-body"
			style="bottom: 0; border-left: solid 2px #1AA094;" id="admin-body">
			<div class="layui-tab admin-nav-card layui-tab-brief"
				lay-filter="admin-tab">
				<ul class="layui-tab-title">
					<li class="layui-this"><i class="fa fa-dashboard"
						aria-hidden="true"></i> <cite>控制面板</cite></li>
				</ul>
				<div class="layui-tab-content"
					style="min-height: 150px; padding: 5px 0 0 0;">
					<div class="layui-tab-item layui-show">
						<!-- <iframe src="main.html"></iframe> -->
						主页面
					</div>
				</div>
			</div>
		</div>
		<div class="layui-footer footer footer-demo" id="admin-footer">
			<div class="layui-main">
				<p>
					2016 &copy; <a href="http://m.zhengjinfan.cn/">m.zhengjinfan.cn/</a>
					LGPL license
				</p>
			</div>
		</div>
		<div class="site-tree-mobile layui-hide">
			<i class="layui-icon">&#xe602;</i>
		</div>
		<div class="site-mobile-shade"></div>

		<!--锁屏模板 start-->
		<script type="text/template" id="lock-temp">
				<div class="admin-header-lock" id="lock-box">
					<div class="admin-header-lock-img">
						<img src="../template/images/0.jpg"/>
					</div>
					<div class="admin-header-lock-name" id="lockUserName">beginner</div>
					<input type="text" class="admin-header-lock-input" value="输入密码解锁.." name="lockPwd" id="lockPwd" />
					<button class="layui-btn layui-btn-small" id="unlock">解锁</button>
				</div>
			</script>
		<!--锁屏模板 end -->

	</div>
</body>
</html>