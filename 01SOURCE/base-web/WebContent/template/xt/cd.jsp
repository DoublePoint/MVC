<%/* 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2017-10-11 下午10:02:29
 * 
 * 类   说   明 ：
 * 
 * ******************修改日志***********************************
 * 
 * 修改人： 修改日期： 修改内容：
 * 
 * 修改人： 修改日期： 修改内容：
*/%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="ll" uri="http://ll.taglib/menu"%>
<html>
<head>
	<%@ include file="/template/base.jsp"%>
	<script type="text/javascript" src="cdScript.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/layui/css/global.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/layui/css/font-awesome.min.css" />
</head>
<body>
	<div class="layui-layout layui-layout-admin"
		style="border-bottom: solid 5px #1aa094;">
		<div class="layui-header header header-demo">
			<div class="layui-main">
				<div class="admin-login-box">
					<a class="logo" style="left: 0;"
						href="http://beginner.zhengjinfan.cn/demo/beginner_admin/"> <span
						style="font-size: 22px;">BeginnerAdmin</span>
					</a>
					<div class="admin-side-toggle">
						<i class="fa fa-bars" aria-hidden="true" style="margin-top:7px;"></i>
					</div>
				</div>
				<ul class="layui-nav">
					<li class="layui-nav-item"><a href="">控制台<span
							class="layui-badge">9</span></a></li>
					<li class="layui-nav-item"><a href="">个人中心<span
							class="layui-badge-dot"></span></a></li>
					<li class="layui-nav-item"><a href="javascript:;"><img
							src="http://t.cn/RCzsdCq" class="layui-nav-img">我</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">修改信息</a>
							</dd>
							<dd>
								<a href="javascript:;">安全管理</a>
							</dd>
							<dd>
								<a href="javascript:;">退了</a>
							</dd>
						</dl></li>
				</ul>
				<!-- <ul class="layui-nav admin-header-item-mobile">
						<li class="layui-nav-item">
							<a href="login.html"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a>
						</li>
					</ul> -->
			</div>
		</div>
		<div class="layui-side layui-bg-black" id="admin-side">
			<div class="layui-side-scroll" id="admin-navbar-side"
				lay-filter="side">
				<ll:Menu ll_class="layui-nav layui-nav-tree layui-inline"/>
			</div>
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
						<ll:AjaxDataGrid/>
					</div>
				</div>
			</div>
		</div>
		<div class="layui-footer footer footer-demo" id="admin-footer">
			<div class="layui-main">
				<p>
					2017 &copy; <a href="http://m.zhengjinfan.cn/">997820126@qq.com/</a>
				</p>
			</div>
		</div>
	</div>
</body>
	</html>