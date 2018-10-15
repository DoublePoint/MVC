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
		<ll:filllayout>
			<ll:fillarealr width="*">
				<ll:filllayout>
					<ll:fillareatb height="125" showtitle="true" title="工作单详情" showborder="false">
						<ll:ajaxform id="ajaxform" cols="3" colproportion="1:3:3:3:3:3">
							<ll:formfield title="工作单编号" field="worksheetNo"></ll:formfield>
							<ll:formfield title="工作单名称" field="name"></ll:formfield>
							<ll:formfield title="发起人" field="createUser"></ll:formfield>
							<ll:formfield title="工作单类别" field="classification"></ll:formfield>
							<ll:formfield title="工作单状态" field="state"></ll:formfield>
							<ll:formfield title="工作单描述" field="description"></ll:formfield>
						</ll:ajaxform>
					</ll:fillareatb>
					<ll:fillareatb height="*" showtitle="true" title="流程列表">
						<ll:ajaxgrid id="ajaxgrid" onpageclick="retrieve()">
							<ll:gridcheck></ll:gridcheck>
							<ll:gridcustom align="center" width="80" title="详细信息"  formatter="customerFunction"></ll:gridcustom>
							<ll:gridfield field="id" width="150" title="id"></ll:gridfield>
							<ll:gridfield field="name" width="150" title="环节名称"></ll:gridfield>
							<ll:gridfield field="owner" width="150" title="Owner"></ll:gridfield>
							<ll:gridfield field="assignee" width="150" title="Assignee"></ll:gridfield>
							<ll:gridfield field="processInstanceId" width="150" title="Process Instance Id"></ll:gridfield>
							<ll:gridfield field="processDefinitionId" width="150" title="Process Definition Id"></ll:gridfield>
							<ll:gridfield field="processDefinitionKey" width="150" title="Process Definition Key"></ll:gridfield>
							<ll:gridfield field="deploymentId" width="150" title="Deployment Id"></ll:gridfield>
							<ll:gridfield field="startTime" width="150" title="Start Time"></ll:gridfield>
							<ll:gridfield field="endTime" width="150" title="End Time"></ll:gridfield>
							<ll:gridfield field="startTime" title="创建时间"></ll:gridfield>
						</ll:ajaxgrid>
					</ll:fillareatb>
				</ll:filllayout>
			</ll:fillarealr>
		</ll:filllayout>
	</form>
	<script type="text/javascript" src="historicTaskListScript.js"></script>
	</style>
</body>
</html>

	
