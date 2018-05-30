<%
	/* 
	 * 创   建   人： 刘磊
	 * 
	 * 创   建   时   间 ： 2018年4月23日
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
</head>
<body>
<form>
	<ll-filllayout>  
            <ll-fillarea-lr  width="500px" >  
              <ll-filllayout>  
                <ll-fillarea-tb height="*" title="实体过滤字" showtitle="true">  
                  <ll-ajaxgrid  id="gridResource" datasource="/template/sys/config/entityFilter">  
                    <ll-gridcheck></ll-gridcheck>  
                    <ll-gridfield  field="filter"  title="过滤关键字"></ll-gridfield>  
                  </ll-ajaxgrid>  
                </ll-fillarea-tb>  
                <ll-fillarea-tb  height="35">  
			          <ll-toolbar  style="line-height:35px;height:100%;text-align:right;margin-right:20px;">  
			            	<input  type="button"  class="btn  btn-info  btn-sm"  onclick="onClickDelete()"  value="删除"  />  
			          </ll-toolbar>   
	        		</ll-fillarea-tb> 
              </ll-filllayout>  
            </ll-fillarea-lr>  
            <ll-fillarea-lr width="*" >  
              <ll-filllayout>  
	                <ll-fillarea-tb height="*">  
	                  <ll-ajaxform id="ajaxform" cols="1" colproportion="1:5:2:3:2:3" style="width:50%;"> 
						<ll-formfield id="name" title="过滤关键字"  field="name" errmsg="菜单名称不能超过10" maxlen="10" ></ll-formfield>
					</ll-ajaxform>
	                </ll-fillarea-tb>  
	                <ll-fillarea-tb  height="35">  
			          <ll-toolbar  style="line-height:35px;height:100%;text-align:right;margin-right:20px;">  
			            <input  type="button"  class="btn  btn-info  btn-sm"  onclick="onClickAdd()"  value="增加"  />  
			            <input  type="button"  class="btn  btn-info  btn-sm  "  onclick="onClickEdit()"  value="保存"  /> 
			          </ll-toolbar>  
	        		</ll-fillarea-tb> 
              </ll-filllayout>  
            </ll-fillarea-lr>  
          </ll-filllayout>  
	</form>
</body>
</html>