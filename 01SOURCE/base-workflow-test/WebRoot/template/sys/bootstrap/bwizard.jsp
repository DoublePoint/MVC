
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
<script  type="text/javascript"  src="bwizardScript.js"></script>  
</head>
<body>
	<form>
		<div class="content" style="width:100%;height:100%;">
			<ll-steppanel id="wizard"  >
				<ll-step title="选择实体">
					<ll-filllayout>  
				        <ll-fillarea-tb  height="*">  
				          <ll-filllayout>  
				            <ll-fillarea-lr  width="400px"  height="100%">  
				              <ll-filllayout>  
				                <ll-fillarea-tb title="数据库表" showtitle="true">  
				                  <ll-ajaxgrid  id="gridResource"  onrowclick="rowClickTest()"  onpageclick="retrieveAjaxDataGrid"  ondblclick="dbclickgrid(1)"  datasource="/template/sys/tables">  
				                    <ll-gridcheck></ll-gridcheck>  
				                    <ll-gridfield  field="tableName"  title="表名"></ll-gridfield>  
				                  </ll-ajaxgrid>  
				                </ll-fillarea-tb>  
				              </ll-filllayout>  
				            </ll-fillarea-lr>  
				            <ll-fillarea-lr  width="60px"  height="100%"  style="text-align:center;">  
				              <ll-filllayout>  
				                <ll-fillarea-tb  height="50%">  
				                  <input  type="button"  value="&gt;&gt;"  class="btn  btn-info  btn-sm"  onclick="gridLeftOncheck()"  style="margin-top:  -35px;  top:  100%;  position:  relative;"  />  
				                </ll-fillarea-tb>  
				                <ll-fillarea-tb  height="50%">  
				                  <input  type="button"  value="&lt;&lt;"  class="  btn
							btn-info  btn-sm"  style="margin-top:  5px;  top:  0;  position:  relative;"  />  
				                </ll-fillarea-tb>  
				              </ll-filllayout>  
				            </ll-fillarea-lr>  
				            <ll-fillarea-lr  width="*"  height="100%">  
				              <ll-tabpanel  id="abc">  
				                <ll-tab  id="tabEntity"  active="true"  title="实体">  
				                </ll-tab>  
				                <ll-tab  id="tabRepository22"  title="仓库">
				                    	<ll-filllayout>  
				        <ll-fillarea-tb  height="*">  
				          <ll-filllayout>  
				            <ll-fillarea-lr  width="400px"  height="100%">  
				              <ll-filllayout>  
				                <ll-fillarea-tb title="数据库表" showtitle="true">  
				                  <ll-ajaxgrid  id="gridResource22" datasource="/template/sys/tables">  
				                    <ll-gridcheck></ll-gridcheck>  
				                    <ll-gridfield  field="tableName"  title="表名"></ll-gridfield>  
				                  </ll-ajaxgrid>  
				                </ll-fillarea-tb>  
				              </ll-filllayout>  
				            </ll-fillarea-lr>  
				            <ll-fillarea-lr  width="60px"  height="100%"  style="text-align:center;">  
				              <ll-filllayout>  
				                <ll-fillarea-tb  height="50%">  
				                  <input  type="button"  value="&gt;&gt;"  class="btn  btn-info  btn-sm"  onclick="gridLeftOncheck()"  style="margin-top:  -35px;  top:  100%;  position:  relative;"  />  
				                </ll-fillarea-tb>  
				                <ll-fillarea-tb  height="50%">  
				                  <input  type="button"  value="&lt;&lt;"  class="  btn
							btn-info  btn-sm"  style="margin-top:  5px;  top:  0;  position:  relative;"  />  
				                </ll-fillarea-tb>  
				              </ll-filllayout>  
				            </ll-fillarea-lr>  
				            <ll-fillarea-lr  width="*"  height="100%">  
				              <ll-tabpanel  id="abc">  
				                <ll-tab  id="tabEntity2"  active="true"  title="实体">  
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
				        <ll-fillarea-tb  height="35">  
				          <ll-toolbar  style="line-height:35px;height:100%;">  
				            <input  type="button"  class="btn  btn-info  btn-sm"  onclick="onClickAdd()"  value="增加"  />  
				            <input  type="button"  class="btn  btn-info  btn-sm  "  onclick="onClickEdit()"  value="编辑"  />  
				            <input  type="button"  class="btn  btn-info  btn-sm"  onclick="onClickDelete()"  value="删除"  />
				          </ll-toolbar>  
				        </ll-fillarea-tb>  
				        <ll-fillarea-tb  height="80">  
				          	<input id="myfile" type="file" name="file">  
				        </ll-fillarea-tb>  
				      </ll-filllayout>  
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
				        <ll-fillarea-tb  height="35">  
				          <ll-toolbar  style="line-height:35px;height:100%;">  
				            <input  type="button"  class="btn  btn-info  btn-sm"  onclick="onClickAdd()"  value="增加"  />  
				            <input  type="button"  class="btn  btn-info  btn-sm  "  onclick="onClickEdit()"  value="编辑"  />  
				            <input  type="button"  class="btn  btn-info  btn-sm"  onclick="onClickDelete()"  value="删除"  />
				          </ll-toolbar>  
				        </ll-fillarea-tb>  
				        <ll-fillarea-tb  height="80">  
				          	<input id="myfile" type="file" name="file">  
				        </ll-fillarea-tb>  
				      </ll-filllayout>  
				</ll-step>
					
					<ll-step title="生成模板">
						<ll-filllayout > 
							<ll-fillarea-tb showtitle="true" title="查询条件" showborder="false">
									<ll-ajaxform id="ajaxform" cols="3" colproportion="1:3:1:3:1:3"> 
											<ll-formfield id="name" title="Package"  field="name" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formfield>
											<ll-formfield id="fcdmc" title="SuperClass"  field="parentId" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formfield>
											<ll-formdate title="创建时间" field="createTime" ></ll-formdate>
											<ll-formselect id="selectCdmcId" dropname="YesOrNo" colspan="1" title="下拉框"  field="" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formselect>
											<ll-formdroptree id="cdmcId2" colspan="1" title="下拉框"  field="" errmsg="菜单名称不能超过10" maxlen="10" datasource="${pageContext.request.contextPath}/template/sys/menu/menu-tree/datalist?isHasRoot=true"></ll-formdroptree>
											<ll-formtoolbar labelalign="right" colspan="1">
											 	<input type="button" class="btn btn-info btn-sm " onclick="retrieve()"  value="查询"/>
											 	&nbsp;&nbsp;
											</ll-formtoolbar>
									</ll-ajaxform>
							</ll-fillarea-tb>
					</ll-filllayout>
				</ll-step>
				<ll-step title="实体类名过滤">
						<ll-filllayout > 
							<ll-fillarea-tb showtitle="true" title="实体类名过滤1" showborder="false">
									<ll-ajaxgrid  id="gridResource2"  onrowclick="rowClickTest()"  onpageclick="retrieveAjaxDataGrid"  ondblclick="dbclickgrid(1)"  datasource="/template/sys/tables">  
				                    <ll-gridcheck></ll-gridcheck>  
				                    <ll-gridfield  field="tableName"  title="过滤字符串"></ll-gridfield>  
				                  </ll-ajaxgrid>  
							</ll-fillarea-tb>
						</ll-filllayout>
				</ll-step>
				<ll-step title="包名类名">
						<p>包名类名。</p>
				</ll-step>
				<ll-step title="完成">
						<p>完成</p>
				</ll-step>
				</div>
			</div>
		</div>

	</form>
</body>
</html>