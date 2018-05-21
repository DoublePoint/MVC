
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
					<ll-fillarea-tb height="85" showtitle="true" title="查询条件" showborder="false">
							<ll-ajaxform id="ajaxform" cols="3" colproportion="2:3:2:3:1:3"> 
									<ll-formfield id="name" title="菜单名称"  field="name" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formfield>
									<ll-formfield id="fcdmc" title="父菜单名称"  field="parentId" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formfield>
									<ll-formtoolbar labelalign="right" colspan="1">
										<button class="btn btn-info btn-sm ll-search" type="button" onclick="retrieve()" style="width:100px;">  
        									<span class="glyphicon glyphicon-search ll-main"></span> 查询
   										</button>  
   										&nbsp;
									</ll-formtoolbar>
									
							</ll-ajaxform>
							
					</ll-fillarea-tb>
					<ll-fillarea-tb height="35" > 
							<button type="button" style="width:70px;" class="btn btn-default btn-sm " onclick="onClickAdd();">  
        						<span class="glyphicon glyphicon-plus ll_add_icon"></span> 增加
   							</button>  
   							<button type="button" style="width:70px;" class="btn btn-default btn-sm" onclick="onClickDelete();">  
        						<span class="glyphicon glyphicon-trash ll_delete_icon"></span> 删除
   							</button>  
					</ll-fillarea-tb>
					<ll-fillarea-tb height="*"  showtitle="true" title="菜单列表">
						<ll-ajaxgrid id="lltestdatagrid" onrowclick="rowClickTest()" onpageclick="retrieve()" ondblclickrow="dbclickgrid(1)" datasource="/template/sys/menu/datalistajaxdatawrap"> 
							<ll-gridcheck ></ll-gridcheck>
							<ll-gridfield field="id" title="菜单标识" width="150"></ll-gridfield>
							<ll-gridfield field="name" title="菜单名称" width="150"  readonly="false" ></ll-gridfield> 
							<ll-gridfield field="sn" title="菜单排序" width="150"></ll-gridfield> 
							<ll-gridfield field="link" title="菜单链接"  ></ll-gridfield> 
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
