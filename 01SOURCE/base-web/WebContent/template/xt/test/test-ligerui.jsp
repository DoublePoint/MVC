
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>布局控件</title>
<meta name="keywords" content="免费控件,免费UI控件,免费开源UI,免费开源UI控件,免费开源UI框架,layout,布局控件">
<link href="${pageContext.request.contextPath}/template/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css">
<style type="text/css">
</style>
<script src="${pageContext.request.contextPath}/template/js/jquery-1.9.0.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/ligerUI/js/core/base.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/template/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>


<script type="text/javascript">
	$(function() {
		$("#layout1").ligerLayout();
	});
</script>
<style type="text/css">
body {
	padding: 10px;
	margin: 0;
}

#layout1 {
	width: 100%;
	margin: 40px;
	height: 400px;
	margin: 0;
	padding: 0;
}

#accordion1 {
	height: 270px;
}

h4 {
	margin: 20px;
}
</style>
</head>
<body style="padding: 10px">
	<div id="layout1">
		<div position="left"></div>
		<div position="center" title="标题">
			<h4>$("#layout1").ligerLayout();</h4>
			默认为固定layout的高度百分一百
		</div>
		<!-- <div position="right"></div>
		<div position="top"></div>
		<div position="bottom"></div> -->
	</div>

	<div style="display: none;"></div>
</body>
</html>
