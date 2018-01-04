
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
		<ll-filllayout> 
			<ll-fillarea height="*" > 
				<ll-tree id="treeDemo" datasource="/template/xt/cd/cd-tree/datalist?isHasRoot=true" showLine="true"></ll-tree> 
			</ll-fillarea> 
			<ll-fillarea height="45px">
				<ll-toolbar>
					<button class="layui-btn" lay-submit="" lay-filter="demo1" style="margin-top:5px;">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-primary" style="margin-top:5px;">重置</button>
				</ll-toolbar>
			</ll-fillarea> 
		</ll-filllayout>
	</form>
	<style>
.layui-table-view {
	margin: 0px;
}
</style>
</body>
</html>
