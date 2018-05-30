
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
									<ll-formfield id="name" title="流程名称"  field="name"  ></ll-formfield>
									<ll-formtoolbar labelalign="right" colspan="1">
										<button class="btn btn-info btn-sm ll-main" type="button" onclick="retrieve()" style="width:100px;">  
        									<span class="glyphicon glyphicon-search "></span> 查询
   										</button>  
   										&nbsp;
									</ll-formtoolbar>
							</ll-ajaxform>
					</ll-fillarea-tb>
					<ll-fillarea-tb height="35" > 
							<button type="button" style="width:100px;" class="btn btn-default btn-sm " onclick="onClickAdd();">  
        						<span class="glyphicon glyphicon-plus ll_add_icon"></span> 创建模型
   							</button>  
					</ll-fillarea-tb>
					<ll-fillarea-tb height="*"  showtitle="true" title="流程列表">
						<ll-ajaxgrid id="ajaxgrid"  onpageclick="retrieve()" > 
							<ll-gridcheck ></ll-gridcheck>
							<ll-gridfield field="name" width="150"  title="流程名称"  ></ll-gridfield>  
							<ll-gridfield field="version" width="150"  title="版本"  ></ll-gridfield>  
							<ll-gridfield field="createTime"   title="创建时间"  ></ll-gridfield>  
						</ll-ajaxgrid>
					</ll-fillarea-tb>
				</ll-filllayout>
			</ll-fillarea-lr>
		</ll-filllayout>
	</form>
	<script type="text/javascript" src="modelListScript.js"></script>
</style>
</body>
</html>
