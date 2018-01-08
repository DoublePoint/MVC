
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

</head>
<body class="layui-layout-body">
	<form>
		<div class="layui-layout layui-layout-admin">
			<div class="layui-header">
				<div class="layui-logo">基础设施系统</div>
				<div id="admin-side-toggle" class="admin-side-toggle">
							<i class="fa fa-bars" aria-hidden="true" style="margin-top: 7px;"></i>
				</div>
			</div>

			<div class="layui-side layui-bg-black" id="admin-side" >
				<div class="layui-side-scroll">
					<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
					 <ll-menu id="treeDemo" datasource="/template/xt/cd/cd-tree/datalist?isHasRoot=false"></ll:menu>
				</div>
			</div>

			<div class="layui-body" id="admin-body">
				<!-- 内容主体区域 -->
				<div class="layui-tab admin-nav-card layui-tab-brief" style="margin:0;"
					lay-allowclose="true" lay-filter="admin-tab">
					<ul class="layui-tab-title" >
						<li class="layui-this"><i class="fa fa-dashboard"
							aria-hidden="true"></i> <cite>控制面板</cite><span
							class="layui-badge">未保存</span></li>
					</ul>
					<div id="layui-tab-content" class="layui-tab-content"
						style="min-height: 150px; padding: 0px 0 0 0;">
						<div class="layui-tab-item layui-show" style="height:100%;min-width:700px">
							<%-- <iframe
							src="${pageContext.request.contextPath}/template/xt/ajaxdatagrid.jsp"></iframe> --%>
							<iframe src="${pageContext.request.contextPath}/template/xt/cd/cd"></iframe>
						</div>
					</div>
				</div>
			</div>

			<div class="layui-footer" id="admin-footer">
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