
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
<script  type="text/javascript"  src="generateEntityScript.js"></script>  
</head>
<body>
    
    <form>  
      <ll-filllayout>  
        <ll-fillarea-tb  height="*">  
          <ll-filllayout>  
            <ll-fillarea-lr  width="50%"  height="100%">  
              <ll-filllayout>  
                <ll-fillarea-tb>  
                  <ll-ajaxdatagrid  id="gridResource"  onrowclick="rowClickTest()"  onpageclick="retrieveAjaxDataGrid"  ondblclick="dbclickgrid(1)"  datasource="/template/sys/tables">  
                    <ll-gridcheck></ll-gridcheck>  
                    <ll-gridrow  field="tableName"  title="表名"></ll-gridrow>  
                  </ll-ajaxdatagrid>  
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
                <ll-tab  id="tabRepository"  title="仓库">
                    	仓库
                </ll-tab>  
                <ll-tab  id="tabApplication"  title="应用层">
                   		 应用层
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
        <ll-fillarea-tb  height="30">  
          	<input id="myfile" type="file" name="file">  
        </ll-fillarea-tb>  
      </ll-filllayout>  
    </form>    
  </body>
</html>