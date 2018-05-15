
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
<script  type="text/javascript"  src="generateEntityOomScript.js"></script>  
</head>
<body>
	<form>
			<ll-steppanel id="wizard"  onstepchanged="stepChanged()" onstepchanging="stepChanging()">
				<ll-step title="选择实体">
					<ll-filllayout>  
				        <ll-fillarea-tb title="文件导入"  height="120" showtitle="true">  
				          	<ll-ajaxform>
				          		<ll-formfileinput fileuploaded="fileuploaded()"></ll-formfileinput>
				          	</ll-ajaxform>
				        </ll-fillarea-tb>  
				        <ll-fillarea-tb height="*" title="数据库表" showtitle="true">  
				           <ll-ajaxgrid  id="gridResource"  >  
				           		<ll-gridcheck></ll-gridcheck>  
				              	<ll-gridfield  field="annotationTableName"  title="表名"></ll-gridfield>  
				         	</ll-ajaxgrid>
				         </ll-fillarea-tb>  
				      </ll-filllayout>  
				</ll-step>
				<ll-step title="生成模板">
						<ll-filllayout > 
							<ll-fillarea-tb showtitle="true" title="查询条件" showborder="false">
									<ll-ajaxform id="ajaxform" cols="1" colproportion="1:3:1:3:1:3" style="width:80%;"> 
											<ll-formfield id="name" title="Package"  field="name" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formfield>
											<ll-formfield id="fcdmc" title="SuperClass"  field="parentId" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formfield>
											<ll-formdate title="创建时间" field="createTime" ></ll-formdate>
											<ll-formselect id="selectCdmcId" dropname="YesOrNo" colspan="1" title="下拉框"  field="" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formselect>
											<ll-formdroptree id="cdmcId2" colspan="1" title="下拉框"  field="" errmsg="菜单名称不能超过10" maxlen="10" datasource="${pageContext.request.contextPath}/template/sys/menu/menu-tree/datalist?isHasRoot=true"></ll-formdroptree>
									</ll-ajaxform>
							</ll-fillarea-tb>
					</ll-filllayout>
				</ll-step>
				<ll-step title="实体类名过滤">
						<ll-filllayout > 
							<ll-fillarea-tb showtitle="true" title="实体类名过滤1" showborder="false">
									<ll-ajaxgrid   datasource="/template/sys/config/entityFilter">  
				                    <ll-gridcheck></ll-gridcheck>  
				                    <ll-gridfield  field="filter"  title="过滤字符串"></ll-gridfield>  
				                  </ll-ajaxgrid>  
							</ll-fillarea-tb>
						</ll-filllayout>
				</ll-step>
				<ll-step title="包名类名">
					<ll-filllayout>  
				        <ll-fillarea-tb  height="*">  
				             <ll-ajaxgrid id="gridAim" >  
				                <ll-gridcheck></ll-gridcheck>  
				                <ll-gridcustom align="center" width="80" title="操作" formatter="customerFunction"></ll-gridcustom>  
				                <ll-gridfield  field="tableName" title="表名"></ll-gridfield>  
				             </ll-ajaxgrid>  
				         </ll-fillarea-tb>  
				     </ll-filllayout>  
				</ll-step>
				<ll-step title="完成">
						<input type="button" class="btn btn-info btn-sm" onclick="zipAndDownLoad()" value="打包并下载"/>
				</ll-step>
			</ll-steppanel>

</body>
</html>