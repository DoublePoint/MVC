
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
</head>
<body>

	<div class="layui-row">
		<!-- <div class="layui-col-md2">
			<ul id="demo"></ul>
		</div>
		<div class="layui-col-md10" > -->
		<div class="layui-btn-group">
			<button class="layui-btn layui-btn-sm">
				<i class="layui-icon"></i>
			</button>
			<button class="layui-btn layui-btn-sm">
				<i class="layui-icon"></i>
			</button>
			<button class="layui-btn layui-btn-sm">
				<i class="layui-icon"></i>
			</button>
			<button class="layui-btn layui-btn-sm">
				<i class="layui-icon"></i>
			</button>
		</div>
		<ll:AjaxDataGrid />
		<!-- </div> -->
	</div>
</body>