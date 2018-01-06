
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
</head>
<body>
	<form style="width:98%;">
		<ll-ajaxform id="ajaxform" > 
			<ll-formfield id="cdmcId" title="菜单名称" field="cdmc" placeholder="菜单名称" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formfield>
			<ll-formfield title="菜单链接" field="cdlj" maxlen="200"></ll-formfield>
			<ll-formfield title="菜单序号" field="cdpx" validtype="int" errmsg="菜单序号必须为整数"></ll-formfield>
			<ll-forminputbutton id="inpbtn_sjcdbs" title="上级菜单" field="sjcdbs" onclick="InputButtonClick"></ll-forminputbutton>
			<!-- <ll-formdate title="创建时间" field="sjcd" ></ll-formdate> -->
			<ll-toolbar>
				<button class="layui-btn" lay-submit="" lay-filter="demo1" >立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</ll-toolbar>
		</ll-ajaxform>
	</form>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/template/xt/cd/cd-dialogScript.js"></script>
</body>