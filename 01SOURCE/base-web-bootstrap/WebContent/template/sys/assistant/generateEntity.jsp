
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
<script  type="text/javascript"  src="generateEntityScript.js"></script>  
</head>
<body>
	<form>
			<ll-steppanel id="wizard"  >
				<ll-step title="选择实体">
					<ll-filllayout>  
				       <ll-fillarea-tb title="数据库表" showtitle="true">  
				           <ll-ajaxdatagrid  id="gridResource"  onrowclick="rowClickTest()"  onpageclick="retrieveAjaxDataGrid"  ondblclick="dbclickgrid(1)"  datasource="/template/sys/tables">  
				           		<ll-gridcheck></ll-gridcheck>  
				              	<ll-gridrow  field="tableName"  title="表名"></ll-gridrow>  
				         	</ll-ajaxdatagrid>
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
									<ll-ajaxdatagrid  id="gridResource2" datasource="/template/sys/config/entityFilter">  
				                    <ll-gridcheck></ll-gridcheck>  
				                    <ll-gridrow  field="filter"  title="过滤字符串"></ll-gridrow>  
				                  </ll-ajaxdatagrid>  
							</ll-fillarea-tb>
						</ll-filllayout>
				</ll-step>
				<ll-step title="包名类名">
						 <ll-filllayout>  
				        <ll-fillarea-tb  height="*">  
				          <ll-filllayout>  
				            <ll-fillarea-lr  width="400px"  height="100%">  
				              <ll-filllayout>  
				                <ll-fillarea-tb title="数据库表" showtitle="true">  
				                  <ll-ajaxdatagrid datasource="/template/sys/tables">  
				                    <ll-gridcheck></ll-gridcheck>  
				                    <ll-gridrow  field="tableName"  title="表名"></ll-gridrow>  
				                  </ll-ajaxdatagrid>  
				                </ll-fillarea-tb>  
				              </ll-filllayout>  
				            </ll-fillarea-lr>  
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
				        </ll-fillarea-tb>  
				      </ll-filllayout>  
				</ll-step>
				<ll-step title="完成">
						<p>完成</p>
				</ll-step>
			</ll-steppanel>

</body>
</html>