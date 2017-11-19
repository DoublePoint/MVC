
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/template/base.jsp"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/zTree_v3/css/demo.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/zTree_v3/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/template/zTree_v3/js/jquery.ztree.core.js"></script>
<!--  <script type="text/javascript" src="../../../js/jquery.ztree.excheck.js"></script>
	  <script type="text/javascript" src="../../../js/jquery.ztree.exedit.js"></script>-->
</head>
<body>
	<div class="layui-row ">
		<div class="layui-col-md2">
			<ul id="treeDemo" class="ztree"></ul>
		</div>
		<div class="layui-col-md10" style="padding-left: 3px;">
			<div class="layui-btn-group" style="height: 39px; padding-top: 1px;">
				<button class="layui-btn" onclick="onClickAdd()">增加</button>
				<button class="layui-btn ">编辑</button>
				<button class="layui-btn" onclick="onClickDelete()">删除</button>
			</div>
			<div style="height: 100%">
				<table id="demo"></table>
				<input type="hidden" />
			</div>

		</div>
	</div>
	<style>
.layui-table-view {
	margin: 0px;
}
</style>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/template/xt/cd/cdScript.js"></script>

</body>