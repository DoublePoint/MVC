
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
		<div class="layui-row " style="height:100%;">
			<div class="layui-col-xs2 layui-col-sm2 layui-col-md2">
				<ll-tree  id="treeDemo" datasource="/template/xt/cd/cd-tree/datalist?isHasRoot=true" showLine="true" onclick="zTreeOnClick"></ll-tree>
			</div>
			<div class="layui-col-xs10 layui-col-sm10 layui-col-md10" >
				<ll-filllayout > 
					<ll-fillarea height="88px" >
							<ll-ajaxform id="ajaxform" cols="3" colproportion="2:8:2:8:2:8:2:8:2:8:1:9"> 
									<ll-formfield id="cdmcId" colspan="1" title="菜单名1" labelalign="left" field="cdmc" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formfield>
									<ll-formfield id="cdmcId" colspan="2" title="菜单名2" labelalign="left" field="cdmc" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formfield>
									<ll-formfield id="cdmcId" title="菜单名3" visible="false" labelalign="left" field="cdmc" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formfield>
									<ll-formfield id="cdmcId" title="菜单名4" labelalign="left" field="cdmc" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formfield>
									<ll-formfield id="cdmcId" title="菜单名5" labelalign="left" field="cdmc" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formfield>
									<ll-formfield id="cdmcId" title="至" labelalign="left" field="cdmc" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formfield>
									<!-- <ll-formfield id="cdmcId" title="菜单名7" labelalign="left" field="cdmc" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formfield>
									<ll-formfield id="cdmcId" title="菜单名8" labelalign="left" field="cdmc" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formfield>
									 --><!-- <input type="button" class="layui-btn" onclick="onClickAdd()" value="查询"/> -->
							</ll-ajaxform>
					</ll-fillarea>
					<ll-fillarea height="40px" >
						<div class="layui-btn-group" style="height: 39px; padding-top: 1px;">
							<input type="button" class="layui-btn" onclick="onClickAdd()" value="增加"/>
							<input type="button" class="layui-btn " value="编辑"/>
							<input type="button" class="layui-btn" onclick="onClickDelete()" value="删除"/>
						</div>
					</ll-fillarea>
					<ll-fillarea height="*" >
						<ll-ajaxdatagrid id="lltestdatagrid" onrowclick="rowClickTest()" onpageclick="retrieveAjaxDataGrid" datasource="/template/xt/cd/datalistajaxdatawrap"> 
							<ll-gridrow field="cdbs" title="菜单标识"></ll-gridrow>
							<ll-gridrow field="cdmc" title="菜单名称"></ll-gridrow> 
							<ll-gridrow field="cdpx" title="菜单排序"></ll-gridrow> 
							<ll-gridrow field="cdlj" title="菜单链接"></ll-gridrow> 
							<ll-gridrow field="cjsj" title="创建时间"></ll-gridrow> 
							<ll-gridrow field="gxsj" title="更新时间"></ll-gridrow> 
						</ll-datagrid>
					</ll-fillarea>
				</ll-filllayout>
			</div>
		</div>
	</form>
	<script type="text/javascript" src="${pageContext.request.contextPath}/template/xt/cd/cdScript.js"></script>
	<style>
.layui-table-view {
	margin: 0px;
}
</style>
</body>
</html>
