
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
					<ll:fillareatb height="85" showtitle="true" title="查询条件" showborder="false">
						<ll:ajaxform id="ajaxform" cols="2" colproportion="1:3:3:3">
							<ll:formfield id="name" title="操作员名称" field="name"></ll:formfield>
							<ll:formtoolbar labelalign="right" colspan="1">
								<button class="btn btn-info btn-sm ll-main" type="button" onclick="retrieve()" style="width: 100px;">
									<span class="glyphicon glyphicon-search "></span> 查询
								</button>  
   								&nbsp;
							</ll:formtoolbar>
						</ll:ajaxform>
					</ll:fillareatb>
					<ll:fillareatb height="35">
						<button type="button" style="width: 70px;" class="btn btn-default btn-sm " onclick="maintenceAdmin();">
							<span class="glyphicon glyphicon-plus ll_add_icon"></span> 增加
						</button>
						<button type="button" style="width: 70px;" class="btn btn-default btn-sm" onclick="onClickDelete();">
							<span class="glyphicon glyphicon-trash ll_delete_icon"></span> 删除
						</button>
					</ll:fillareatb>
					<ll:fillareatb height="*" showtitle="true" title="菜单列表">
						<ll:ajaxgrid id="ajaxgrid" onpageclick="retrieve()">
							<ll:gridcheck></ll:gridcheck>
							<ll:gridcustom align="center" width="80" title="操作" formatter="customerFunction"></ll:gridcustom>
							<ll:gridcustom align="center" width="150" title="是否启用" formatter="customerEnableFunction"></ll:gridcustom>
							<ll:gridfield field="roleId" width="150" title="绑定角色"></ll:gridfield>
							<ll:gridfield field="loginAccountNo" title="登录账号"></ll:gridfield>
						</ll:ajaxgrid>
					</ll:fillareatb>
				</ll:filllayout>
			</ll:fillarealr>
		</ll:filllayout>
	</form>
	<script type="text/javascript" src="${pageContext.request.contextPath}/template/sys/admin/adminScript.js"></script>
</body>
</html>
