
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
			<ll:fillareatb showtitle="true" title="工作单信息" showborder="true">
				<ll:ajaxform id="ajaxform" cols="2" colproportion="2:3:2:3:1:3">
					<ll:formfield title="工作单编号" field="worksheetNo"></ll:formfield>
					<ll:formfield title="工作单名称" field="name"></ll:formfield>
					<ll:formfield title="工作单类别" field="classification"></ll:formfield>
					<ll:formarea title="工作单描述" field="description"></ll:formarea>
					<ll:formfield title="创建时间" field="classification"></ll:formfield>
				</ll:ajaxform>
			</ll:fillareatb>
			<ll:fillareatb showtitle="true" title="审批信息" showborder="true">
				<ll:ajaxform id="ajaxform" cols="2" colproportion="2:3:2:3:1:3">
					<ll:formfield title="审批信息" field="name"></ll:formfield>
					<ll:formarea title="备注" field="parentId"></ll:formarea>
					<ll:formfield title="审批日期" field="name"></ll:formfield>
				</ll:ajaxform>
			</ll:fillareatb>
			<ll:fillareatb height="35">
				<button type="button" style="width: 70px;" class="btn btn-default btn-sm ll-main" onclick="onClickAdd();">
					<span class="glyphicon glyphicon-plus ll_add_icon"></span> 保存
				</button>
				<button type="button" style="width: 70px;" class="btn btn-default btn-sm ll-main" onclick="onClickDelete();">
					<span class="glyphicon glyphicon-trash ll_delete_icon"></span> 传递
				</button>
				<button type="button" style="width: 70px;" class="btn btn-default btn-sm " onclick="onClickDelete();">
					<span class="glyphicon glyphicon-trash ll_delete_icon"></span> 返回
				</button>
			</ll:fillareatb>
		</ll:filllayout>
	</form>
	<script type="text/javascript" src="announcementAduitScript.js"></script>
	</style>
</body>
</html>
