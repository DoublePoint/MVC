<%/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ：2018年4月9日 
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<ll-fillarea-tb height="*">
			<ll-filllayout> 
				<ll-fillarea-lr width="50%"  height="100%">
					<ll-filllayout > 
						<ll-fillarea-tb >
							<ll-ajaxdatagrid id="lltestdatagrid1" onrowclick="rowClickTest()" onpageclick="retrieveAjaxDataGrid" ondblclick="dbclickgrid(1)" datasource="/template/sys/tables"> 
								<ll-gridcheck></ll-gridcheck>
								<ll-gridrow field="tABLE_NAME" title="表名"></ll-gridrow>
							</ll-ajaxdatagrid>
						</ll-fillarea-tb>
					</ll-filllayout>
				</ll-fillarea-lr>
				<ll-fillarea-lr width="*"  height="100%">
						<ll-filllayout > 
							<ll-fillarea-tb >
								<ll-ajaxdatagrid id="lltestdatagrid2" onrowclick="rowClickTest()" onpageclick="retrieveAjaxDataGrid" ondblclick="dbclickgrid(1)"datasource="/template/sys/menu/datalistajaxdatawrap"> 
									<ll-gridcheck></ll-gridcheck>
									<ll-gridrow field="id" title="表名"></ll-gridrow>
								</ll-ajaxdatagrid>
							</ll-fillarea-tb>
					</ll-filllayout>
				</ll-fillarea-lr>
			</ll-filllayout>
		</ll-fillarea-tb>
		<ll-fillarea-tb height="35">
			<ll-toolbar style="line-height:35px;height:100%;">
							<input type="button" class="btn btn-info btn-sm" onclick="onClickAdd()" value="增加"/>
							<input type="button" class="btn btn-info btn-sm " onclick="onClickEdit()" value="编辑"/>
							<input type="button" class="btn btn-info btn-sm" onclick="onClickDelete()" value="删除"/></ll-toolbar>
		</ll-fillarea-tb>
			
	</ll-filllayout>
	</form>
</body>
</html>