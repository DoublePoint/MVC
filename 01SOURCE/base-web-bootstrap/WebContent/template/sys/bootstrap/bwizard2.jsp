﻿
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
			<div id="wizard"  >
				<h2>选择实体</h2>
				<section>
					<ll:filllayout>  
				        <ll:fillareatb  height="*">  
				          <ll:filllayout>  
				            <ll:fillarealr  width="400px"  height="100%">  
				              <ll:filllayout>  
				                <ll:fillareatb title="数据库表" showtitle="true">  
				                  <ll:ajaxgrid  id="gridResource"  onrowclick="rowClickTest()"  onpageclick="retrieveAjaxDataGrid"  ondblclick="dbclickgrid(1)"  datasource="/template/sys/tables">  
				                    <ll:gridcheck></ll:gridcheck>  
				                    <ll:gridfield  field="tableName"  title="表名"></ll:gridfield>  
				                  </ll:ajaxgrid>  
				                </ll:fillareatb>  
				              </ll:filllayout>  
				            </ll:fillarealr>  
				            <ll:fillarealr  width="60px"  height="100%"  style="text-align:center;">  
				              <ll:filllayout>  
				                <ll:fillareatb  height="50%">  
				                  <input  type="button"  value="&gt;&gt;"  class="btn  btn-info  btn-sm"  onclick="gridLeftOncheck()"  style="margin-top:  -35px;  top:  100%;  position:  relative;"  />  
				                </ll:fillareatb>  
				                <ll:fillareatb  height="50%">  
				                  <input  type="button"  value="&lt;&lt;"  class="  btn
							btn-info  btn-sm"  style="margin-top:  5px;  top:  0;  position:  relative;"  />  
				                </ll:fillareatb>  
				              </ll:filllayout>  
				            </ll:fillarealr>  
				            <ll:fillarealr  width="*"  height="100%">  
				              <ll:tabpanel  id="abc">  
				                <ll:tab  id="tabEntity"  active="true"  title="实体">  
				                </ll:tab>  
				                <ll:tab  id="tabRepository"  title="仓库">
				                    	仓库
				                </ll:tab>  
				                <ll:tab  id="tabApplication"  title="应用层">
				                   		 应用层
				                </ll:tab>  
				                 <ll:tab  id="tabApplication"  title=" Jsp页面">
				                   		 Jsp页面
				                </ll:tab>  
				              </ll:tabpanel>  
				            </ll:fillarealr>  
				          </ll:filllayout>  
				        </ll:fillareatb>  
				        <ll:fillareatb  height="35">  
				          <ll:toolbar  style="line-height:35px;height:100%;">  
				            <input  type="button"  class="btn  btn-info  btn-sm"  onclick="onClickAdd()"  value="增加"  />  
				            <input  type="button"  class="btn  btn-info  btn-sm  "  onclick="onClickEdit()"  value="编辑"  />  
				            <input  type="button"  class="btn  btn-info  btn-sm"  onclick="onClickDelete()"  value="删除"  />
				          </ll:toolbar>  
				        </ll:fillareatb>  
				        <ll:fillareatb  height="80">  
				          	<input id="myfile" type="file" name="file">  
				        </ll:fillareatb>  
				      </ll:filllayout>  
				</section>
				<h2>生成模板</h2>
				<section>
				<p>生成模板</p>
				</section>
				<h2>包名类名</h2>
				<section>
				<p>包名类名 .</p>
				</section>
				<h2>完成</h2>
				<section>
				<p>完成 .</p>
				</section>
				</div>
			</div>
		</div>

	</form>
</body>
</html>