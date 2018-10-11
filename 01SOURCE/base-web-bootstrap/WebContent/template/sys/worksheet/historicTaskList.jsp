
<%
	/** 
	* 创   建   人： 刘磊
	* 
	* 创   建   时   间 ：2018年6月12日 
	* 
	* 类   说   明 ：
	* 
	* 修   改   人：          修   改   日   期：
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
	<form>
		<ll:filllayout>
			<ll:fillarealr width="100%" height="100%">
				<iframe src="http://localhost:8080/base-workflow-test/workflow/instance/7505/history/task"></iframe>
			</ll:fillarealr>
		</ll:filllayout>
	</form>
	<script type="text/javascript" src="historicTaskListScript.js"></script>
</body>
</html>