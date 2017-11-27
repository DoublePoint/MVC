
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
		<div class="layui-row " style="height:100%;">
			<div class="layui-col-xs2 layui-col-sm2 layui-col-md2">
				<ll-tree  id="treeDemo" showLine="true"></ll-tree>
			</div>
			<div class="layui-col-xs10 layui-col-sm10 layui-col-md10" >
				<ll-filllayout > 
					<ll-fillarea height="40px" >
						<div class="layui-btn-group" style="height: 39px; padding-top: 1px;">
							<input type="button" class="layui-btn" onclick="onClickAdd()" value="增加"/>
							<input type="button" class="layui-btn " value="编辑"/>
							<input type="button" class="layui-btn" onclick="onClickDelete()" value="删除"/>
						</div>
					</ll-fillarea>
					<ll-fillarea height="*" >
						<ll-ajaxdatagrid id="lltestdatagrid" onrowclick="rowClickTest()" datasource="/template/xt/cdDataList"> 
							<ll-gridrow field="cdbs" title="菜单标识"></ll-gridrow>
							<ll-gridrow field="cdmc" title="菜单名称"></ll-gridrow> 
							<ll-gridrow field="cdpx" title="菜单排序"></ll-gridrow> 
							<ll-gridrow field="cdlj" title="菜单链接"></ll-gridrow> 
						</ll-datagrid>
					</ll-fillarea>
					<ll-fillarea height="40px" >
						<div class="layui-btn-group" style="height: 39px; padding-top: 1px;">
							<input type="button" class="layui-btn" onclick="onClickAdd()" value="增加"/>
							<input type="button" class="layui-btn " value="编辑"/>
							<input type="button" class="layui-btn" onclick="onClickDelete()" value="删除"/>
						</div>
					</ll-fillarea>
					<ll-fillarea height="200px" >
						<ll-ajaxdatagrid id="lltestdatagrid" onrowclick="rowClickTest()" datasource="/template/xt/cdDataList"> 
							<ll-gridrow field="cdbs" title="菜单标识"></ll-gridrow>
							<ll-gridrow field="cdmc" title="菜单名称"></ll-gridrow> 
							<ll-gridrow field="cdpx" title="菜单排序"></ll-gridrow> 
							<ll-gridrow field="cdlj" title="菜单链接"></ll-gridrow> 
						</ll-datagrid>
					</ll-fillarea>
				</ll-filllayout>
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
</html>
