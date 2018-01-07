<%-- <%@ taglib prefix="ll" uri="http://ll.taglib/menu"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/template/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath}/template/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/framework.css" type="text/css">
<script src="${pageContext.request.contextPath}/template/layui/layui.all.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/jquery-1.9.1.js" charset="utf-8"></script>

<script src="${pageContext.request.contextPath}/template/js/framework-constant.js" charset="utf-8"></script>
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
	$laypage = layui.laypage;
	$tree = layui.tree;
	$table = layui.table;
	$layer.config({
		  extend: 'frameworkskin/dialogStyle.css', //加载您的扩展样式
		  skin: 'layui-layer-iframe'
	}); 
</script>
<script src="https://unpkg.com/vue"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-layout.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-layoutfield-h.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-layoutfield-v.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-datagrid.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-datagridrow.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-tree.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-menu.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-ajaxform.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-ajaxformline.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-formfield.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-forminputbutton.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-formdate.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-toolbar.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-jquery.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-model.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-init.js" charset="utf-8"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/template/zTree_v3/js/jquery.ztree.core.js"></script>