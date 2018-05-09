<%
	/* 
	 * 创   建   人： 刘磊
	 * 
	 * 创   建   时   间 ： 2018年5月9日
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
<script src="${pageContext.request.contextPath}/template/js/jquery-1.12.4.js" charset="utf-8"></script>
<script> var $ll_d = jQuery.noConflict(true); </script>
<title>Insert title here</title>
<script type="text/javascript">
	$ll_d.ready(function(){
		var dialogUrl=<%=dialogUrl%>;
		settings.url=dialogUrl;
		settings.type = "POST";
		settings.contentType = 'application/json;charset=UTF-8';
		settings.dataType = "html";
		settings.data= JSON.stringify(settings.data);
		settings.success=function(response){
			$("#ll_dialog_ll").append(response);
		}
		$.ajax(settings);
	});
</script>
</head>
<body>
	<div id="ll_dialog_ll"></div>
</body>
</html>