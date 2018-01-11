
<%
	/* 
	 * 创   建   人： 刘磊
	 * 
	 * 创   建   时   间 ： 2018年1月11日
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
<%@ include file="/template/base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>布局控件</title>
<link
	href="${pageContext.request.contextPath}/template/ligerUI/skins/Aqua/css/ligerui-all.css"
	rel="stylesheet" type="text/css">
<style type="text/css">
</style>
<script
	src="${pageContext.request.contextPath}/template/ligerUI/js/core/base.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/template/ligerUI/js/plugins/ligerLayout.js"
	type="text/javascript"></script>

<script type="text/javascript">
	$(function() {

		$("#layout1").ligerLayout({
			leftWidth : 200,
		});
	});
</script>


<style type="text/css">
body {
	padding: 0px;
	margin: 0;
	padding-bottom: 0px;
}
.l-layout-drophandle-left,.l-layout-header{
	background-color:#1AA094;
}
.l-layout-left{
	border:0px;
	border-bottom: 0px;
}
.l-layout-center{
	border:0px;
}
#layout1 {
	width: 100%;
	margin: 0;
	padding: 0;
}

.l-page-top {
	height: 80px;
	background: #f8f8f8;
	margin-bottom: 3px;
}

h4 {
	margin: 20px;
}
</style>
</head>
<body style="padding: 0px">
	<div id="layout1">
		<div position="left"></div>
		<div position="center" style="border:0px;" >
			<h4>$("#layout1").ligerLayout({ leftWidth: 200,height:300});</h4>
			固定layout的高度为300px
		</div>
	</div>
</body>
</html>
