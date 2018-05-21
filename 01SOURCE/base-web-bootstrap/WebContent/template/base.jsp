<%-- <%@ taglib prefix="ll" uri="http://ll.taglib/menu"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/template/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath}/template/plugins/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
<link rel="stylesheet/less" href="${pageContext.request.contextPath}/template/css/framework.less" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/template/plugins/bootstrap-3.3.7/dist/css/bootstrap.min.css" media="all">
<!-- 引入bootstrap-table样式 -->
<link href="${pageContext.request.contextPath}/template/plugins/bootstrap-table-1.12.1/dist/bootstrap-table.min.css" rel="stylesheet">
<!-- jquery -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/template/plugins/bootstrap-select/dist/css/bootstrap-select.css">
<!-- FONTAWESOME STYLES-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/template/plugins/Font-Awesome-3.2.1/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/template/btts_9_sp/assets/css/font-awesome.css" rel="stylesheet" />
<!--CUSTOM BASIC STYLES-->
<link href="${pageContext.request.contextPath}/template/btts_9_sp/assets/css/basic.css" rel="stylesheet" />
<!--CUSTOM MAIN STYLES-->
<link href="${pageContext.request.contextPath}/template/btts_9_sp/assets/css/custom.css" rel="stylesheet" />

<script src="${pageContext.request.contextPath}/template/plugins/less.js-2.5.3/dist/less.min.js"></script>

<script src="${pageContext.request.contextPath}/template/js/jquery-1.12.4.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/layui/layui.all.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-constant.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>

<script src="${pageContext.request.contextPath}/template/plugins/bootstrap-fileinput-master/js/fileinput.js" ></script>
<script src="${pageContext.request.contextPath}/template/plugins/bootstrap-fileinput-master/js/locales/zh.js" ></script>
<script src="${pageContext.request.contextPath}/template/plugins/bootstrap-3.3.7/dist/js/bootstrap.min.js" media="all"></script>
<!-- bootstrap-table.min.js -->
<script src="${pageContext.request.contextPath}/template/plugins/bootstrap-table-1.12.1/dist/bootstrap-table.js" media="all"></script>
<script src="${pageContext.request.contextPath}/template/plugins/bootstrap3-editable-1.5.1/bootstrap3-editable/js/bootstrap-editable.js" media="all"></script>
<script src="${pageContext.request.contextPath}/template/plugins/bootstrap-table-1.12.1/dist/extensions/editable/bootstrap-table-editable.js" media="all"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="${pageContext.request.contextPath}/template/plugins/bootstrap-select/js/bootstrap-select.js" ></script>
<script src="${pageContext.request.contextPath}/template/plugins/bootstrap-table-1.12.1/dist/locale/bootstrap-table-zh-CN.min.js"></script>

<script type="text/javascript">
	var $$pageContextPath = "${pageContext.request.contextPath}";
	var $element;
	var $layer;
	var $form;
	var $layedit;
	var $laydate;
	var $tree;
	$element = layui.element; // 导航的hover效果、二级菜单等功能，需要依赖element模块
	$layer = layui.layer;
	$form = layui.form;
	$layedit = layui.layedit;
	$laydate = layui.laydate;
	$laypage = layui.laypage;
	$tree = layui.tree;
	$layer.config({
		  extend: 'frameworkskin/dialogStyle.css', //加载您的扩展样式
		  skin: 'layui-layer-iframe'
	}); 
</script>
<script src="${pageContext.request.contextPath}/template/js/framework-model.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-jquery.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/vue.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/plugins/zTree_v3/js/jquery.ztree.core.js"></script>
<script src="${pageContext.request.contextPath}/template/plugins/zTree_v3/js/jquery.ztree.excheck.js"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-layout.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-layoutarea-lr.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-layoutarea-tb.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-ajaxgrid.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-gridfieldbase.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-gridfield.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-gridcheckbox.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-gridcustom.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-tree.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-menu.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-ajaxform.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-ajaxformline.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-formfieldbase.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-formfield.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-forminputbutton.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-formfileinput.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-formdate.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-formselect.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-formdroptree.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-formtoolbar.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-toolbar.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-tabpanel.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-tab.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-steppanel.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-step.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-region.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/template/js/framework-vue-init.js" charset="utf-8"></script> 
 <!-- METISMENU SCRIPTS -->
<script src="${pageContext.request.contextPath}/template/btts_9_sp/assets/js/jquery.metisMenu.js"></script>

<link href="${pageContext.request.contextPath}/template/plugins/bootstrap-fileinput-master/css/fileinput.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/template/plugins/bootstrap3-editable-1.5.1/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet" />

<script type="text/javascript">
$(document).ready(function(){
	try{
		var LLAjaxResponse= new AjaxResponse(${LLAjaxResponse});
		if(init!=null){
			init(LLAjaxResponse);
		}
	}
	catch(e){
	}
});
</script>