
<%
	/** 
	* 创   建   人： 刘磊
	* 
	* 创   建   时   间 ：2018年5月19日 
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
<%@ include file="/template/base.jsp"%>
<title>Insert title here</title>
<script type="text/javascript" src="bindMenuScript.js"></script>
</head>
<body>
	<form>
		<ll-filllayout>
			<ll-fillarea-tb height="*">
				<ll-tree id="menuTree" showcheckbox="true" datasource="/template/sys/menu/menu-tree/datalist?isHasRoot=true" onload="treeOnLoad()"
				showLine="true" ></ll-tree>
			</ll-fillarea-tb>
			<ll-fillarea-tb height="40" style="align:center">
				<ll-toolbar align="center">
					<button type="button" style="width: 70px;" class="btn btn-default btn-sm " onclick="onOk()">
					<span class="glyphicon glyphicon-ok ll_add_icon "></span> 确定
					</button>
				</ll-toolbar>
			</ll-fillarea-tb>
		</ll-filllayout>
	</form>
</body>
</html>