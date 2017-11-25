
<%
	/* 
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
	*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="/template/base.jsp"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/layui/css/global.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/layui/css/font-awesome.min.css" />
<style>
.layui-side-scroll {
	width: 200px;
	font-family: "Microsoft YaHei", SimSun, '\5b8b\4f53', sans-serif;
}

li {
	list-style: none
}

a {
	text-decoration: none;
}
/* navMenu */
.layui-side-scroll {
	padding: 0px 0;
	background: #1c2229;
}

.navMenu>li {
	display: block;
	margin: 0;
	padding: 0;
	border: 0px;
}

.navMenu>li>a {
	display: block;
	overflow: hidden;
	padding-left: 10px;
	line-height: 40px;
	color: #FFF;
	transition: all .3s;
	position: relative;
	text-decoration: none;
	font-size: 17px;
	border-top: 1px solid #222932;
	border-bottom: 2px solid #191e24;
	border-left: 2px solid black;
}

.navMenu>li:nth-of-type(1)>a {
	border-top: 1px solid transparent;
}

.navMenu>li:last-child>a {
	border-bottom: 1px solid transparent;
}

.navMenu>li>a>i {
	font-size: 20px;
	float: left;
	font-style: normal;
	margin: 0 5px;
}

.navMenu li a .arrow:before {
	display: block;
	float: right;
	margin-top: 1px;
	margin-right: 15px;
	display: inline;
	font-size: 16px;
	font-family: FontAwesome;
	height: auto;
	content: "\f105";
	font-weight: 300;
	text-shadow: none;
}

.navMenu li a .arrow.open:before {
	float: right;
	margin-top: 1px;
	margin-right: 15px;
	display: inline;
	font-family: FontAwesome;
	height: auto;
	font-size: 16px;
	content: "\f107";
	font-weight: 300;
	text-shadow: none;
}

.navMenu>li>a.active, .navMenu>li>a:hover {
	color: #FFF;
	border-left: 2px solid blue;
	
}

.navMenu>li>ul.sub-menu, .navMenu>li>ul.sub-menu>li>ul.sub-menu {
	display: none;
	list-style: none;
	clear: both;
	margin: 8px 0px 0px 10px;
	padding-bottom: 5px;
}

.navMenu>li>ul.sub-menu li {
	background: none;
	margin: 0px;
	padding: 0px;
}

.navMenu>li>ul.sub-menu li>a {
	display: block;
	font-size: 16px;
	line-height: 36px;
	padding-left: 20px;
	color: #FFF;
	border-left: 2px solid #1c2229;
	clear: both;
}
.navMenu>li>ul>li>ul.sub-menu li>a {
	display: block;
	font-size: 16px;
	line-height: 36px;
	padding-left: 30px;
	color: #FFF;
	border-left: 2px solid #1c2229;
	clear: both;
}
.navMenu>li>ul.sub-menu li>a:hover, .navMenu>li>ul.sub-menu>li.active>a
	{
	color: #FFF;
	border-left: 2px solid blue;
}

.navMenu>li>ul.sub-menu li>a.active {
	border-left: 2px solid blue;
	/* background: blue; */
}

.icon_1:before {
	content: "\f0ac";
}

.icon_2:before {
	content: "\f0ac";
}

.icon_3:before {
	content: "\f0ac";
}
/*---------------------*/
</style>
</head>
<body>
	<form>
		<div class="layui-layout layui-layout-admin"
			style="border-bottom: solid 5px #1aa094;">
			<div class="layui-header header header-demo">
				<div class="layui-main">
					<div class="admin-login-box">
						<a class="logo" style="left: 0;"
							href="http://beginner.zhengjinfan.cn/demo/beginner_admin/"> <span
							style="font-size: 22px;">基础设施系统</span>
						</a>
						<div class="admin-side-toggle">
							<i class="fa fa-bars" aria-hidden="true" style="margin-top: 7px;"></i>
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
				</div>
			</div>
			<div class="layui-side layui-bg-white" id="admin-side">
				<div class="layui-side-scroll" id="admin-navbar-side"
					lay-filter="side">
					<ll-menu id="treeDemo" datasource="/template/xt/cdTree?isHasRoot=false"></ll-menu>
				</div>
			</div>
			<div class="layui-body"
				style="bottom: 0; border-left: solid 2px #1AA094;" id="admin-body">
				<div class="layui-tab admin-nav-card layui-tab-brief"
					lay-allowclose="true" lay-filter="admin-tab">
					<ul class="layui-tab-title">
						<li class="layui-this"><i class="fa fa-dashboard"
							aria-hidden="true"></i> <cite>控制面板</cite><span
							class="layui-badge">未保存</span></li>
					</ul>
					<div class="layui-tab-content"
						style="min-height: 150px; padding: 0px 0 0 0;">
						<div class="layui-tab-item layui-show">
							<%-- <iframe
							src="${pageContext.request.contextPath}/template/xt/ajaxdatagrid.jsp"></iframe> --%>
							<iframe src="${pageContext.request.contextPath}/template/xt/cd"></iframe>
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
	</form>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/template/xt/index/indexScript.js"></script>
</html>