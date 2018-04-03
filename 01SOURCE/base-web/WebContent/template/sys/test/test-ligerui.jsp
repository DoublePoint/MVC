
<%
	/* 
	 * 创   建   人： 刘磊
	 * 
	 * 创   建   时   间 ： 2018年1月11日
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
<%@ include file="/template/base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>布局控件</title>
<link href="${pageContext.request.contextPath}/template/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css">
<style type="text/css">
</style>
<script src="${pageContext.request.contextPath}/template/ligerUI/js/core/base.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/template/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>

<script type="text/javascript">
var layout={};
var explorerHeight = $(window).height();
layout.resize=function(trueHeight){
	$("#layout1").ligerLayout({
		leftWidth : 200,
		height : '100%'
	});
};
	
	
	$._RegisterResizeModel(layout);
</script>


<style type="text/css">

.l-layout-drophandle-left, .l-layout-header {
	background-color: #1AA094;
}

.l-layout-left {
	border: 0px;
	border-bottom: 0px;
}

.l-layout-center {
	border: 0px;
}

#layout1 {
	width: 100%;
	margin: 0;
	padding: 0;
}


</style>
</head>
<body >
	<form>
		<div id="layout1">
			<div position="left">
				<ll-tree id="treeDemo" datasource="/template/sys/menu/menu-tree/datalist?isHasRoot=true" showLine="true" onclick="zTreeOnClick"></ll-tree>
			</div>
			<div position="center" style="border: 0px;">
				<ll-filllayout> <ll-fillarea height="86px"> <ll-ajaxform id="ajaxform" cols="3"
					colproportion="2:8:3:8:2:10"
				> <ll-formfield id="cdmc" title="菜单名称" field="cdmc" errmsg="菜单名称不能超过10" maxlen="10"></ll-formfield> <ll-formfield id="fcdmc"
					title="父菜单名成" field="cdmc" errmsg="菜单名称不能超过10" maxlen="10"
				></ll-formfield> <ll-formdate title="创建时间" field="sjcd"></ll-formdate> <ll-formselect id="cdmcId" colspan="1" title="下拉框" field="cdmc"
					errmsg="菜单名称不能超过10" maxlen="10"
				></ll-formselect> <ll-formtoolbar labelalign="right" colspan="2"> <select id="cdmcIdd016d13e-9e0b-4cd0-b46c-0428f306c9ee"
					style="display: inline-block; height: 38px; width: 347.45px;" field="cdmc" lay-filter="aihao" style="padding-left: 10px; width: 80%;"
				>
					<option value="state">写作</option>
					<option value="state">阅读</option>
					<option value="state">游戏</option>
				</select> <input type="button" class="layui-btn" onclick="onClickAdd()" value="查询" /> &nbsp;&nbsp; </ll-formtoolbar> </ll-ajaxform> </ll-fillarea> <ll-fillarea height="40px">
				<div class="layui-btn-group" style="height: 39px; padding-top: 1px;">
					<input type="button" class="layui-btn" onclick="onClickAdd()" value="增加" /> <input type="button" class="layui-btn " value="编辑" /> <input
						type="button" class="layui-btn" onclick="onClickDelete()" value="删除"
					/>
				</div>
				</ll-fillarea> <ll-fillarea height="*"> <ll-ajaxdatagrid id="lltestdatagrid" onrowclick="rowClickTest()"
					onpageclick="retrieveAjaxDataGrid" datasource="/template/sys/menu/datalistajaxdatawrap"
				> <ll-gridrow field="cdbs" title="菜单标识"></ll-gridrow> <ll-gridrow field="cdmc" title="菜单名称"></ll-gridrow> <ll-gridrow field="cdpx"
					title="菜单排序"
				></ll-gridrow> <ll-gridrow field="cdlj" title="菜单链接"></ll-gridrow> <ll-gridrow field="cjsj" title="创建时间"></ll-gridrow> <ll-gridrow field="gxsj"
					title="更新时间"
				></ll-gridrow> </ll-datagrid></ll-fillarea> </ll-filllayout>
			</div>
		</div>
	</form>
</body>
</html>
