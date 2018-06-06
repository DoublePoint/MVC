
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
			<ll-fillarea-tb height="220" showtitle="true" title="工作单信息" showborder="true">
				<ll-ajaxform id="ajaxform" cols="2" colproportion="1:3:1:3:1:3"> 
					<ll-formfield title="工作单编号"  field="worksheetNo" ></ll-formfield>
					<ll-formfield title="工作单名称"  field="name" ></ll-formfield>
					<ll-formfield title="工作单类别"  field="classification" ></ll-formfield>
					<ll-formfield title="创建时间"  field="classification" ></ll-formfield>
					<ll-formarea title="工作单描述"  field="description" colspan="2" rowspan="2"></ll-formarea>
				</ll-ajaxform>
			</ll-fillarea-tb>
			<ll-fillarea-tb height="*" showtitle="true" title="申请信息" showborder="true">
				<ll-ajaxform id="ajaxform2" cols="2" colproportion="1:3:1:3:1:3"> 
					<ll-formfield title="公告名称"  field="name" ></ll-formfield>
					<ll-formtoolbar labelalign="right" colspan="1">
					</ll-formtoolbar>
					<ll-formarea title="公告内容"  field="parentId"  colspan="2" rowspan="2" ></ll-formarea>
				</ll-ajaxform>
			</ll-fillarea-tb>
			<ll-fillarea-tb height="35" > 
				<ll-toolbar align="center">
					<button type="button" style="width:70px;" class="btn btn-default btn-sm ll-main" onclick="onClickAdd();">  
	  						<span class="glyphicon glyphicon-plus ll_add_icon"></span> 保存
					</button>  
					<button type="button" style="width:70px;" class="btn btn-default btn-sm ll-main" onclick="onClickDelete();">  
	  						<span class="glyphicon glyphicon-trash ll_delete_icon"></span> 传递
					</button>  
					<button type="button" style="width:70px;" class="btn btn-default btn-sm " onclick="onClickDelete();">  
	  						<span class="glyphicon glyphicon-trash ll_delete_icon"></span> 返回
					</button>  
				</ll-toolbar>
			</ll-fillarea-tb>
		</ll-filllayout>
	</form>
	<script type="text/javascript" src="announcementApplyScript.js"></script>
</style>
</body>
</html>
