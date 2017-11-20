<%@ taglib prefix="ll" uri="http://ll.taglib/menu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/layui/css/layui.css"
	media="all">

<script
	src="${pageContext.request.contextPath}/template/layui/layui.all.js"
	charset="utf-8"></script>
<script
	src="${pageContext.request.contextPath}/template/js/jquery-1.9.1.js"
	charset="utf-8"></script>
<script
	src="${pageContext.request.contextPath}/template/js/framework.js"
	charset="utf-8"></script>
<script
	src="${pageContext.request.contextPath}/template/ftls/ajaxdatagrid/ajaxdatagridtag.js"
	charset="utf-8"></script>
<script
	src="${pageContext.request.contextPath}/template/ftls/menu/menutag.js"
	charset="utf-8"></script>
<script type="text/javascript">
	var $$pageContextPath = "${pageContext.request.contextPath}";
	var $element;
	var $layer;
	var $form;
	var $layedit;
	var $laydate;
	var $tree;
	var $table;
	$element = layui.element; // 导航的hover效果、二级菜单等功能，需要依赖element模块
	$layer = layui.layer;
	$form = layui.form;
	$layedit = layui.layedit;
	$laydate = layui.laydate;
	$tree = layui.tree;
	$table = layui.table;
	
</script>
<script src="https://unpkg.com/vue"></script>
<script
	src="${pageContext.request.contextPath}/template/js/framework-vue-datagrid.js"
	charset="utf-8"></script>
	
