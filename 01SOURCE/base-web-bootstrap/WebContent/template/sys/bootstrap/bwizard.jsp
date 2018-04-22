﻿
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
	href="${pageContext.request.contextPath}/template/plugins/jquery-steps-master/demo/css/jquery.steps.css">

<script
	src="${pageContext.request.contextPath}/template/plugins/jquery-steps-master/build/jquery.steps.js"></script>
	<script  type="text/javascript"  src="bwizardScript.js"></script>  
</head>
<body>
	<form>
		<div class="content" style="width:200px;height:200px;">
			<script>
				$(function() {
					$("#wizard").steps({
						headerTag : "h2",
						bodyTag : "section",
						transitionEffect : "slideLeft",
						stepsOrientation : "vertical"
					});
				});
			</script>

			<div id="wizard">
				<h2>First Step1</h2>
				<section>First Step12</section>

				<h2>Second Step</h2>
				<section>
				<p>Donec mi .</p>
				</section>

				<h2>Third Step</h2>
				<section>
				<p>Morbi ornare .</p>
				</section>

				<h2>Forth Step</h2>
				<section>
				<p>Quisque .</p>
				</section>
			</div>
		</div>

	</form>
</body>
</html>