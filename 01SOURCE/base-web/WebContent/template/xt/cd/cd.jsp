
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/template/base.jsp"%>
</head>
<body>
	<form>
		<div class="layui-row ">
			<div class="layui-col-md2">
				<ll-tree  id="treeDemo" showLine="true"></ll-tree>
			</div>
			<div class="layui-col-md10" style="padding-left: 3px;">
				<div class="layui-btn-group" style="height: 39px; padding-top: 1px;">
					<button class="layui-btn" onclick="onClickAdd()">增加</button>
					<button class="layui-btn ">编辑</button>
					<button class="layui-btn" onclick="onClickDelete()">删除</button>
				</div>
				<div style="height: 100%">
					<ll-ajaxdatagrid id="lltestdatagrid" onrowclick="rowClickTest()" datasource="/template/xt/cdDataList"> 
					
					<ll-gridrow field="cdbs" title="菜单标识"></ll-gridrow>
					<ll-gridrow field="cdmc" title="菜单名称"></ll-gridrow> 
					<ll-gridrow field="cdpx" title="菜单排序"></ll-gridrow> 
					<ll-gridrow field="cdlj" title="菜单链接"></ll-gridrow> 
					</ll-datagrid>
				</div>

			</div>
		</div>
	</form>
	<script type="text/javascript" src="${pageContext.request.contextPath}/template/xt/cd/cdScript.js"></script>
	<style>
.layui-table-view {
	margin: 0px;
}
</style>
</body>