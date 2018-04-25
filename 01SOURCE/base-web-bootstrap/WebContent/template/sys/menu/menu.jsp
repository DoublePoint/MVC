
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
			<ll-fillarea-lr width="200px">
				<ll-tree  id="treeDemo" datasource="/template/sys/menu/menu-tree/datalist?isHasRoot=true" showLine="true" onclick="zTreeOnClick"></ll-tree>
			</ll-fillarea-lr>
			<ll-fillarea-lr width="*">
				<ll-filllayout > 
					<ll-fillarea-tb height="135" showtitle="true" title="查询条件" showborder="false">
							<ll-ajaxform id="ajaxform" cols="3" colproportion="1:3:1:3:1:3"> 
									<ll-formfield id="name" title="菜单名称"  field="name" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formfield>
									<ll-formfield id="fcdmc" title="父菜单名称"  field="parentId" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formfield>
									<ll-formdate title="创建时间" field="createTime" ></ll-formdate>
									<ll-formselect id="selectCdmcId" dropname="YesOrNo" colspan="1" title="下拉框"  field="" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formselect>
									<ll-formdroptree id="cdmcId2" colspan="1" title="下拉框"  field="" errmsg="菜单名称不能超过10" maxlen="10" datasource="${pageContext.request.contextPath}/template/sys/menu/menu-tree/datalist?isHasRoot=true"></ll-formdroptree>
									<ll-formtoolbar labelalign="right" colspan="1">
									 	<input type="button" class="btn btn-info btn-sm " onclick="retrieve()"  value="查询"/>
									 	&nbsp;&nbsp;
									</ll-formtoolbar>
							</ll-ajaxform>
					</ll-fillarea-tb>
					<ll-fillarea-tb height="45" >
						<div class="btn-group " style="margin-left:5px;">
							<input type="button" class="btn btn-info btn-sm" onclick="onClickAdd()" value="增加"/>
							<input type="button" class="btn btn-info btn-sm " onclick="onClickEdit()" value="编辑"/>
							<input type="button" class="btn btn-info btn-sm" onclick="onClickDelete()" value="删除"/></ll-toolbar>
 						</div>
					</ll-fillarea-tb>
					<ll-fillarea-tb height="*"  showtitle="true" title="菜单列表">
						<ll-ajaxgrid id="lltestdatagrid" onrowclick="rowClickTest()" onpageclick="retrieveAjaxDataGrid" ondblclick="dbclickgrid(1)"datasource="/template/sys/menu/datalistajaxdatawrap"> 
							<ll-gridcheck></ll-gridcheck>
							<ll-gridfield field="id" title="菜单标识"></ll-gridfield>
							<ll-gridfield field="name" title="菜单名称"></ll-gridfield> 
							<ll-gridfield field="sn" title="菜单排序"></ll-gridfield> 
							<ll-gridfield field="link" title="菜单链接"></ll-gridfield> 
							<ll-gridfield field="createTime" title="创建时间"></ll-gridfield> 
							<ll-gridfield field="modifyTime" title="更新时间"></ll-gridfield> 
						</ll-ajaxgrid>
					</ll-fillarea-tb>
				</ll-filllayout>
			</ll-fillarea-lr>
		</ll-filllayout>
	</form>
	<script type="text/javascript" src="${pageContext.request.contextPath}/template/sys/menu/menuScript.js"></script>
</style>
</body>
</html>
