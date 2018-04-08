

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
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
</head>
<body>
	<form>
		<ll-filllayout width="200px"> 
			<ll-fillarea-lr width="*">
				<ll-filllayout > 
					<ll-fillarea-tb height="45px" >
						<ll-toolbar style="line-height:45px;height:100%;">
							<input type="button" class="btn btn-info btn-sm" onclick="onClickAdd()" value="增加"/>
							<input type="button" class="btn btn-info btn-sm " value="编辑"/>
							<input type="button" class="btn btn-info btn-sm" onclick="onClickDelete()" value="删除"/></ll-toolbar>
					</ll-toolbar>
					</ll-fillarea-tb>
					<ll-fillarea-tb height="*" >
						<ll-ajaxdatagrid id="roleAjaxGrid" onrowclick="rowClickTest()" onpageclick="retrieveAjaxDataGrid" ondblclick="dbclickgrid(1)"datasource="/template/sys/role/datalist"> 
							<ll-gridrow field="id" title="角色标识"></ll-gridrow>
							<ll-gridrow field="name" title="角色名称"></ll-gridrow> 
							<ll-gridrow field="createTime" title="创建时间"></ll-gridrow> 
							<ll-gridrow field="modifyTime" title="更新时间"></ll-gridrow> 
						</ll-datagrid>
					</ll-fillarea-tb>
				</ll-filllayout>
			</ll-fillarea-lr>
		</ll-filllayout>
	</form>
	<script type="text/javascript" src="${pageContext.request.contextPath}/template/sys/role/roleScript.js"></script>
</style>
</body>
</html>
