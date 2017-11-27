
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
<html  style="height: 100%;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/template/base.jsp"%>
<style>
	div{
		over-flow:scroll;
		
	}
</style>
</head>
<body  style="height: 100%;">
	<form  style="height: 100%;">
		<div class="layui-row " style="height: 100%;">
			<ll-layout backgroundcolor="black"> 
				<ll-layoutfieldh height="100px" backgroundcolor="yellow"></ll-layoutfieldh>
				<ll-layoutfieldh height="50%" backgroundcolor="red">
					<ll-layout height="90%" backgroundcolor="blue"> 
						<ll-layoutfieldh height="30%" backgroundcolor="gold"></ll-layoutfieldh> 
						<ll-layoutfieldh height="30%" backgroundcolor="white"></ll-layoutfieldh>
						<ll-layoutfieldh height="30%" backgroundcolor="gold"></ll-layoutfieldh> 
						<ll-layoutfieldh height="2%" backgroundcolor="white"></ll-layoutfieldh> 
					</ll-layout>
				</ll-layoutfieldh> 
				<ll-layoutfieldh height="30%" backgroundcolor="green"></ll-layoutfieldh>
			</ll-layout>
		</div>
	</form>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/template/xt/cd/cdScript.js"></script>
	<style>
.layui-table-view {
	margin: 0px;
}
</style>
</body>