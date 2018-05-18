
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
<script type="text/javascript" src="menuDialogScript.js"></script>
</head>
<body>
	<form style="width:98%;">
		<ll-ajaxform id="ajaxform" cols="1" colproportion="1:5" showchanged="True"> 
			<ll-formfield id="cdmcId" title="菜单名称" field="name" placeholder="菜单名称" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formfield>
			<ll-formfield title="菜单链接" field="link" maxlen="200"></ll-formfield>
			<ll-formfield title="菜单序号" field="sn" validtype="int" errmsg="菜单序号必须为整数"></ll-formfield>
			<ll-forminputbutton id="inpbtn_sjcdbs" title="上级菜单" field="parentId" onclick="InputButtonClick"></ll-forminputbutton>
			<!-- <ll-formdate title="创建时间" field="sjcd" ></ll-formdate> -->
			<ll-toolbar align="center">
				<!-- <input type="button" value="test" onclick="clicktest()"/>
				<input type="button" value="delete" onclick="clickDelete()"/> -->
				<input type="button" class="btn btn-info btn-sm" onclick="onClickSave()" value="保存"/>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</ll-toolbar>
		</ll-ajaxform>
	</form>
	
</body>