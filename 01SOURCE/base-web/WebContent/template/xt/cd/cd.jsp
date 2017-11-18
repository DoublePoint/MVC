
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/template/base.jsp"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/template/xt/cd/cdScript.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/zTree_v3/css/demo.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/zTree_v3/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/template/zTree_v3/js/jquery.ztree.core.js"></script>
<!--  <script type="text/javascript" src="../../../js/jquery.ztree.excheck.js"></script>
	  <script type="text/javascript" src="../../../js/jquery.ztree.exedit.js"></script>-->
<SCRIPT type="text/javascript">
	var setting = {
		async : {
			enable : true,
			url : $$pageContextPath + "/template/xt/cdTree",
			autoParam : [ "id", "name=n", "level=lv" ],
			otherParam : {
				"otherParam" : "zTreeAsyncTest"
			},
			dataFilter : filter
		},
		data : {
			key : {
				name : "cdmc",
				children : "childrenCDList"
			},

		}
	};

	function filter(treeId, parentNode, childNodes) {
		if (!childNodes)
			return null;
		for (var i = 0, l = childNodes.length; i < l; i++) {
			childNodes[i].cdmc = childNodes[i].cdmc.replace(/\.n/g, '.');
		}
		return childNodes;
	}

	$(document).ready(function() {
		$.fn.zTree.init($("#treeDemo"), setting);
	});
</SCRIPT>
</head>
<body>
	<div class="layui-row ">
		<div class="layui-col-md2">
			<ul id="treeDemo" class="ztree"></ul>
		</div>
		<div class="layui-col-md10" style="padding-left: 3px;">
			<div class="layui-btn-group" style="height:39px;padding-top:1px;">
				<button class="layui-btn layui-btn-sm" onclick="showAddDialog()">
					<i class="layui-icon"></i>
				</button>
				<button class="layui-btn layui-btn-sm">
					<i class="layui-icon"></i>
				</button>
				<button class="layui-btn layui-btn-sm">
					<i class="layui-icon"></i>
				</button>
				<button class="layui-btn layui-btn-sm">
					<i class="layui-icon"></i>
				</button>
			</div>
			<div style="height:100%">
				<table id="demo"></table>
				<input type="hidden"/>
			</div>

		</div>
	</div>
	<style>
.layui-table-view {
	margin: 0px;
}
</style>
</body>