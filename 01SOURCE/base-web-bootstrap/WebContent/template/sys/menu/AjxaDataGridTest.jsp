
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

	<form>
		<div id="lltestdiv">
			<ll-ajaxgrid id="lltestdatagrid"
				datasource="/template/sys/menu/datalist"> <ll-gridfield
				field="id" title="菜单标识"></ll-gridfield> <ll-gridfield field="name"
				title="菜单名称"></ll-gridfield> <ll-gridfield field="sn" title="菜单排序"></ll-gridfield>
			<ll-gridfield field="link" title="菜单链接"></ll-gridfield> </ll-datagrid>
		</div>
		<input type="button" value="测试" onclick="clicktest()" />
	</form>
</body>