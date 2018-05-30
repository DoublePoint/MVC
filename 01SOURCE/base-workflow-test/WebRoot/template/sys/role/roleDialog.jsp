
<%
	/* 
	 * 创   建   人： 刘磊
	 * 
	 * 创   建   时   间 ： 2017年11月16日
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
<script type="text/javascript" src="roleDialogScript.js"></script>
</head>
<body>
	<form style="width:98%;">
		<ll-ajaxform id="ajaxform" cols="1" colproportion="1:5" > 
			<ll-formfield id="cdmcId" title="角色名称" field="name" placeholder="菜单名称" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formfield>
			<ll-toolbar align="center">
				<!-- <input type="button" value="test" onclick="clicktest()"/>
				<input type="button" value="delete" onclick="clickDelete()"/> -->
				<button type="button" style="width:70px;" class="btn btn-default btn-sm " onclick="onClickSave();">  
        			<span class="glyphicon glyphicon-ok ll_add_icon"></span> 保存
   				</button>  
			</ll-toolbar>
		</ll-ajaxform>
	</form>
	
</body>