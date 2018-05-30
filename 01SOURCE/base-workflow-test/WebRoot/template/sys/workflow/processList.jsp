
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
		<ll-filllayout> 
			<ll-fillarea-lr width="*">
				<ll-filllayout > 
					<ll-fillarea-tb height="85" showtitle="true" title="查询条件" showborder="false">
							<ll-ajaxform id="ajaxform" cols="2" colproportion="1:3:3:3"> 
									<ll-formfield id="key" title="KEY"  field="key"  ></ll-formfield>
									<ll-formtoolbar labelalign="right" colspan="1">
										<button class="btn btn-info btn-sm ll-main" type="button" onclick="retrieve()" style="width:100px;">  
        									<span class="glyphicon glyphicon-search "></span> 查询
   										</button>  
   										&nbsp;
									</ll-formtoolbar>
							</ll-ajaxform>
					</ll-fillarea-tb>
					<ll-fillarea-tb height="*"  showtitle="true" title="流程列表">
						<ll-ajaxgrid id="ajaxgrid"  onpageclick="retrieve()" > 
							<ll-gridcheck ></ll-gridcheck>
							<ll-gridfield field="key" width="150"  title="KEY"  ></ll-gridfield>  
							<ll-gridfield field="version" width="150"  title="VERSION"  ></ll-gridfield>  
							<ll-gridfield field="resourceName" width="150"  title="RESOURCE NAME"  ></ll-gridfield>  
							<ll-gridfield field="diagramResourceName" title="DIAGRAM RESOURCE NAME"  ></ll-gridfield>  
						</ll-ajaxgrid>
					</ll-fillarea-tb>
				</ll-filllayout>
			</ll-fillarea-lr>
		</ll-filllayout>
	</form>
	<script type="text/javascript" src="processListScript.js"></script>
</style>
</body>
</html>
