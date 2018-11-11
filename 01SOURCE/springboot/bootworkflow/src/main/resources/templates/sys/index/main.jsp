
<%
	/* 
	 * 创   建   人： 刘磊
	 * 
	 * 创   建   时   间 ： 2018年1月19日
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
			<ll:fillarealr width="600px">
				<ll:filllayout>
					<ll:fillareatb height="5">
					</ll:fillareatb>
					<ll:fillareatb height="140px" title="代办任务1" showtitle="true">
						<ll:filllayout>
							<ll:fillarealr width="300">
								<ll:card value="150" title="代办任务" url="#" type="info"></ll:card>
							</ll:fillarealr>
							<ll:fillarealr width="300" style="margin-left:5px">
								<ll:card value="2" title="新消息" url="#" type="warning"></ll:card>
							</ll:fillarealr>
						</ll:filllayout>
					</ll:fillareatb>
					<ll:fillareatb height="*" title="代办任务1" showtitle="true">
						<ll:tabpanel>
							<ll:tab title="待办任务" active="true">
								<ll:ajaxgrid id="ajaxgridPersonal" onrowclick="rowClickTest()" onpageclick="retrieve()"
									ondblclickrow="dbclickgrid(1)"
								>
									<ll:gridcheck></ll:gridcheck>
									<ll:gridfield field="worksheetNo" title="工作单号" width="150"></ll:gridfield>
									<ll:gridfield field="name" title="工作单名称" width="150" readonly="false"></ll:gridfield>
									<ll:gridfield field="classification" title="工作单类别" width="150"></ll:gridfield>
									<ll:gridfield field="instanceId" title="实例号"></ll:gridfield>
								</ll:ajaxgrid>
							</ll:tab>
							<ll:tab title="角色待办">
								<ll:ajaxgrid id="lltestdatagrid2" onrowclick="rowClickTest()" onpageclick="retrieve()"
									ondblclickrow="dbclickgrid(1)"
								>
									<ll:gridcheck></ll:gridcheck>
									<ll:gridfield field="id" title="菜单标识" width="150"></ll:gridfield>
									<ll:gridfield field="name" title="菜单名称" width="150" readonly="false"></ll:gridfield>
									<ll:gridfield field="sn" title="菜单排序" width="150"></ll:gridfield>
									<ll:gridfield field="link" title="菜单链接"></ll:gridfield>
								</ll:ajaxgrid>
							</ll:tab>
						</ll:tabpanel>
					</ll:fillareatb>
				</ll:filllayout>
			</ll:fillarealr>
			<ll:fillarealr width="*">
				<div class="layui-tab-item layui-show" style="height: 100%; min-width: 700px"></div>
			</ll:fillarealr>
		</ll:filllayout>
		<script type="text/javascript" src="mainScript.js"></script>
	</form>
</body>
</html>