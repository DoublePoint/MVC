<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Bootstrap-select test page</title>
  <%@ include file="/template/base.jsp"%>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/template/bootstrap-select/dist/css/bootstrap-select.css">
  
  <link href="${pageContext.request.contextPath}/template/btts_9_sp/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="${pageContext.request.contextPath}/template/btts_9_sp/assets/css/font-awesome.css" rel="stylesheet" />
       <!--CUSTOM BASIC STYLES-->
    <link href="${pageContext.request.contextPath}/template/btts_9_sp/assets/css/basic.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="${pageContext.request.contextPath}/template/btts_9_sp/assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
	
</head>
<body><form>
 	<ll:menu id="treeDemo" datasource="/template/sys/menu/menu-tree/datalist?isHasRoot=false">
	</ll:menu>
	</form>
          <!-- <script src="${pageContext.request.contextPath}/template/btts_9_sp/assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="${pageContext.request.contextPath}/template/btts_9_sp/assets/js/bootstrap.js"></script>
   <!--   METISMENU SCRIPTS -->
    <script src="${pageContext.request.contextPath}/template/btts_9_sp/assets/js/jquery.metisMenu.js"></script>
       <!-- CUSTOM SCRIPTS -->
    <script src="${pageContext.request.contextPath}/template/btts_9_sp/assets/js/custom.js"></script>
    
</body>
</html>
