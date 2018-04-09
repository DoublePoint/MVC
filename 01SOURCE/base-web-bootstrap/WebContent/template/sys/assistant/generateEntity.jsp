<%/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ：2018年4月9日 
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/%>
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
			<ll-ajaxform id="ajaxform" cols="2" colproportion="4:8:4:8:3:10"> 
				<ll-formfield id="name" title="菜单名称"  field="name" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formfield>
				<ll-formfield id="fcdmc" title="父菜单名称"  field="parentId" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formfield>
				<ll-formdate title="创建时间" field="createTime" ></ll-formdate>
				<ll-formselect id="cdmcId" colspan="1" title="下拉框"  field="" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formselect>
				<ll-formdroptree id="cdmcId2" colspan="1" title="下拉框"  field="" errmsg="菜单名称不能超过10" maxlen="10" datasource="${pageContext.request.contextPath}/template/sys/menu/menu-tree/datalist?isHasRoot=true"></ll-formdroptree>
				<ll-formtoolbar labelalign="right" colspan="1">
			<input type="button" class="btn btn-info btn-sm " onclick="retrieve()"  value="查询"/>
									 	&nbsp;&nbsp;
				</ll-formtoolbar>
			</ll-ajaxform>
	</form>
</body>
</html>