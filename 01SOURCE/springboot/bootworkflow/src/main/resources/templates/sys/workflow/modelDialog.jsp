
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/template/base.jsp"%>
<script type="text/javascript" src="modelDialogScript.js"></script>
</head>
<body>
	<form style="width: 98%;">
		<ll:filllayout>
			<ll:fillareatb height="*">
				<ll:ajaxform id="ajaxform" cols="1" colproportion="1:5" showchanged="True">
					<ll:formfield title="模型名称" required="true" field="key"></ll:formfield>
					<ll:formfield title="模型标识" required="true" field="name"></ll:formfield>
					<ll:formfield title="模型描述" required="true" field="description"></ll:formfield>
				</ll:ajaxform>
			</ll:fillareatb>
			<ll:fillareatb height="40">
				<ll:toolbar align="center">
					<button type="button" style="width: 100px;" class="btn btn-default btn-sm ll-main" onclick="onClickSave();">
						<span class="glyphicon glyphicon-ok "></span> 保存
					</button>
				</ll:toolbar>
			</ll:fillareatb>
		</ll:filllayout>
	</form>
</body>