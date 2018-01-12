
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
		<ll-filllayout > 
			<ll-fillarea-lr>
				<ll-tree  id="treeDemo" datasource="/template/xt/cd/cd-tree/datalist?isHasRoot=true" showLine="true" onclick="zTreeOnClick"></ll-tree>
			</ll-fillarea-lr>
			<ll-fillarea-lr width="*">
				<ll-filllayout > 
					<ll-fillarea-tb height="86px" >
							<ll-ajaxform id="ajaxform" cols="3" colproportion="2:8:3:8:2:10"> 
									<ll-formfield id="cdmc" title="菜单名称"  field="cdmc" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formfield>
									<ll-formfield id="fcdmc" title="父菜单名成"  field="cdmc" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formfield>
									<ll-formdate title="创建时间" field="sjcd" ></ll-formdate>
									<ll-formselect id="cdmcId" colspan="1" title="下拉框"  field="cdmc" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formselect>
									<ll-formtoolbar labelalign="right" colspan="2">
										<select id="cdmcIdd016d13e-9e0b-4cd0-b46c-0428f306c9ee" style="display:inline-block;height:38px;width:347.45px;" field="cdmc" lay-filter="aihao" style="padding-left: 10px; width: 80%;">
											 <option value="state">写作</option>  
										     <option value="state">阅读</option>  
										     <option value="state">游戏</option>  
										</select>
									 	<input type="button" class="layui-btn" onclick="onClickAdd()"  value="查询"/>
									 	&nbsp;&nbsp;
									</ll-formtoolbar>
							</ll-ajaxform>
					</ll-fillarea-tb>
					<ll-fillarea-tb height="40px" >
						<div class="layui-btn-group" style="height: 39px; padding-top: 1px;">
							<input type="button" class="layui-btn" onclick="onClickAdd()" value="增加"/>
							<input type="button" class="layui-btn " value="编辑"/>
							<input type="button" class="layui-btn" onclick="onClickDelete()" value="删除"/>
						</div>
					</ll-fillarea-tb>
					<ll-fillarea-tb height="*" >
						<ll-ajaxdatagrid id="lltestdatagrid" onrowclick="rowClickTest()" onpageclick="retrieveAjaxDataGrid" datasource="/template/xt/cd/datalistajaxdatawrap"> 
							<ll-gridrow field="cdbs" title="菜单标识"></ll-gridrow>
							<ll-gridrow field="cdmc" title="菜单名称"></ll-gridrow> 
							<ll-gridrow field="cdpx" title="菜单排序"></ll-gridrow> 
							<ll-gridrow field="cdlj" title="菜单链接"></ll-gridrow> 
							<ll-gridrow field="cjsj" title="创建时间"></ll-gridrow> 
							<ll-gridrow field="gxsj" title="更新时间"></ll-gridrow> 
						</ll-datagrid>
					</ll-fillarea-tb>
				</ll-filllayout>
			</ll-fillarea-lr>
		</ll-filllayout>
	</form>
	<script type="text/javascript" src="${pageContext.request.contextPath}/template/xt/cd/cdScript.js"></script>
</style>
</body>
</html>
