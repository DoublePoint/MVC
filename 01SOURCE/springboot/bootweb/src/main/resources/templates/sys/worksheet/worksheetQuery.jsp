
<%
	/** 
	* 创   建   人： 刘磊
	* 
	* 创   建   时   间 ：2018年6月12日 
	* 
	* 类   说   明 ：
	* 
	* 修   改   人：          修   改   日   期：
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
	<form>
		<ll:filllayout>
			<ll:fillarealr width="*">
				<ll:filllayout>
					<ll:fillareatb height="85" showtitle="true" title="查询条件"
						showborder="false">
						<ll:ajaxform id="ajaxform" cols="3" colproportion="2:3:2:3:1:3:1:3">
							<ll:formfield title="工作单编号" field="worksheetNo"></ll:formfield>
							<ll:formfield  title="工作单名称" field="name"></ll:formfield>
							<ll:formtoolbar labelalign="right" colspan="1">
								<button class="btn btn-info btn-sm ll-main" type="button"
									onclick="retrieve()" style="width: 100px;">
									<span class="glyphicon glyphicon-search "></span> 查询
								</button>
							</ll:formtoolbar>
						</ll:ajaxform>
					</ll:fillareatb>
					<ll:fillareatb height="*" >
						<ll:ajaxgrid id="ajaxgrid" onpageclick="retrieve()">
							<ll:gridcheck></ll:gridcheck>
							<ll:gridselect field="state" readonly="true" width="150" title="当前环节" dropname="WorksheetState"></ll:gridselect>
							<ll:gridcustom align="center" width="80" title="流程图"
								formatter="imageCustomer()"></ll:gridcustom>
							<ll:gridcustom align="center" width="150" title="工作单编号"
								formatter="sheetCustomer"></ll:gridcustom>
							<ll:gridfield field="name" width="150" title="工作单名称"></ll:gridfield>
							<ll:gridfield field="state" width="150" title="状态"></ll:gridfield>
							<ll:gridfield field="name" width="150" title="当前环节"></ll:gridfield>
							<ll:gridfield field="createUser" width="150" title="创建人"></ll:gridfield>
							<ll:gridfield field="createTime" width="150" title="创建时间"></ll:gridfield>
							<ll:gridfield field="name" width="150" title="备注"></ll:gridfield>
						</ll:ajaxgrid>
					</ll:fillareatb>
				</ll:filllayout>
			</ll:fillarealr>
		</ll:filllayout>
	</form>
	<script type="text/javascript" src="worksheetQueryScript.js"></script>
</body>
</html>