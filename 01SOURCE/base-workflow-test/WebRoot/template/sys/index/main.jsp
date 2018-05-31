
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/template/layui/css/global.css" />
<%@ include file="/template/base-chart.jsp"%>
<!-- AdminLTE-3.0.0-alpha.2 -->
<link
	href="${pageContext.request.contextPath}/template/plugins/AdminLTE-3.0.0-alpha.2/dist/css/adminlte.min.css"
	rel="stylesheet"
/>

</head>
<body>
	<form>
		<ll-filllayout> 
			<ll-fillarea-lr width="600px">
				<ll-filllayout> 
					<ll-fillarea-tb height="140px">
						<div style="width:100%;height:100%;margin:5px;">
							<ll-filllayout> 
								<ll-fillarea-lr width="300">
									<ll-card value="150" title="代办任务" url="#" type="info" ></ll-card>
								</ll-fillarea-lr>
								<ll-fillarea-lr width="300" style="margin-left:5px">
									<ll-card value="2" title="新消息" url="#" type="warning" ></ll-card>
								</ll-fillarea-lr>
							</ll-filllayout>
						</div>
					</ll-fillarea-tb>
					<ll-fillarea-tb height="*" title="代办任务" showtitle="true">
						<ll-ajaxgrid id="lltestdatagrid" onrowclick="rowClickTest()" onpageclick="retrieve()" ondblclickrow="dbclickgrid(1)" > 
							<ll-gridcheck ></ll-gridcheck>
							<ll-gridfield field="id" title="菜单标识" width="150"></ll-gridfield>
							<ll-gridfield field="name" title="菜单名称" width="150"  readonly="false" ></ll-gridfield> 
							<ll-gridfield field="sn" title="菜单排序" width="150"></ll-gridfield> 
							<ll-gridfield field="link" title="菜单链接"  ></ll-gridfield> 
						</ll-ajaxgrid>
					</ll-fillarea-tb>
				</ll-filllayout>
			</ll-fillarea-lr>
			<ll-fillarea-lr width="*">
      			<div class="layui-tab-item layui-show" style="height: 100%; min-width: 700px">
					<iframe src="${pageContext.request.contextPath}/template/sys/map-polygon.html"  style="height: 100%; width: 100%;"></iframe>
				</div>
			</ll-fillarea-lr>
		</ll-filllayout>
	</form>
</body>
</html>