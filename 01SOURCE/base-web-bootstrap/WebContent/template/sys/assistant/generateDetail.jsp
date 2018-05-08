
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/template/plugins/jquery-steps-master/demo/css/jquery.steps.css">

<script src="${pageContext.request.contextPath}/template/plugins/jquery-steps-master/build/jquery.steps.js"></script>
<script  type="text/javascript"  src="generateDetailScript.js"></script>  
</head>
<body>
	<form>
		 <ll-filllayout>  
            <ll-fillarea-lr  width="*"  height="100%">  
              <ll-tabpanel  id="abc">  
                <ll-tab  id="tabEntity"  active="true"  title="实体">  
                	 
                </ll-tab>  
                <ll-tab  id="tabRepository"  title="仓库">
                    	仓库
                </ll-tab>  
                <ll-tab  id="tabApplication"  title="应用层">
                   		 应用层
                </ll-tab>  
                 <ll-tab  id="tabApplication"  title=" Jsp页面">
                   		 Jsp页面
                </ll-tab>  
              </ll-tabpanel>  
            </ll-fillarea-lr>  
		  </ll-filllayout>  

</body>
</html>