
<%
	/** 
	* 创   建   人： 刘磊
	* 
	* 创   建   时   间 ：2018年4月9日 
	* 
	* 类   说   明 ：
	* 
	* 修   改   人：          修   改   日   期：
	*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/template/base.jsp"%>
<script type="text/javascript" src="generateEntityScript.js"></script>
</head>
<body>
	<form>
		<ll-filllayout> <ll-fillarea-tb height="*"> <ll-filllayout>
		<ll-fillarea-lr width="50%" height="100%"> <ll-filllayout> <ll-fillarea-tb>
		<ll-ajaxdatagrid id="gridResource" onrowclick="rowClickTest()" onpageclick="retrieveAjaxDataGrid"
			ondblclick="dbclickgrid(1)" datasource="/template/sys/tables"
		> <ll-gridcheck></ll-gridcheck> <ll-gridrow field="tableName" title="表名"></ll-gridrow> </ll-ajaxdatagrid> </ll-fillarea-tb> </ll-filllayout> </ll-fillarea-lr> <ll-fillarea-lr
			width="60px" height="100%" style="text-align:center;"
		> <ll-filllayout> <ll-fillarea-tb height="50%"> <input
			type="button" value=">>" class="btn btn-info btn-sm" onclick="gridLeftOncheck()"
			style="margin-top: -35px; top: 100%; position: relative;"
		/> </ll-fillarea-tb> <ll-fillarea-tb height="50%"> <input type="button" value="<<" class=" btn
			btn-info btn-sm" style="margin-top: 5px; top: 0; position: relative;"
		/> </ll-fillarea-tb> </ll-filllayout> </ll-fillarea-lr> <ll-fillarea-lr width="*" height="100%">
		<ul id="myTab" class="nav nav-tabs">
			<li class="active"><a href="#home" data-toggle="tab"> 菜鸟教程 </a></li>
			<li><a href="#ios" data-toggle="tab">iOS</a></li>
			<li class="dropdown"><a href="#" id="myTabDrop1" class="dropdown-toggle"
				data-toggle="dropdown"
			>Java <b class="caret"></b>
			</a>
				<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
					<li><a href="#jmeter" tabindex="-1" data-toggle="tab">jmeter</a></li>
					<li><a href="#ejb" tabindex="-1" data-toggle="tab">ejb</a></li>
				</ul></li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade in active" id="home">
				<p>菜鸟教程是一个提供最新的web技术站点，本站免费提供了建站相关的技术文档，帮助广大web技术爱好者快速入门并建立自己的网站。菜鸟先飞早入行——学的不仅是技术，更是梦想。菜鸟教程是一个提供最新的web技术站点，本站免费提供了建站相关的技术文档，帮助广大web技术爱好者快速入门并建立自己的网站。菜鸟先飞早入行——学的不仅是技术，更是梦想。菜鸟教程是一个提供最新的web技术站点，本站免费提供了建站相关的技术文档，帮助广大web技术爱好者快速入门并建立自己的网站。菜鸟先飞早入行——学的不仅是技术，更是梦想。菜鸟教程是一个提供最新的web技术站点，本站免费提供了建站相关的技术文档，帮助广大web技术爱好者快速入门并建立自己的网站。菜鸟先飞早入行——学的不仅是技术，更是梦想。菜鸟教程是一个提供最新的web技术站点，本站免费提供了建站相关的技术文档，帮助广大web技术爱好者快速入门并建立自己的网站。菜鸟先飞早入行——学的不仅是技术，更是梦想。菜鸟教程是一个提供最新的web技术站点，本站免费提供了建站相关的技术文档，帮助广大web技术爱好者快速入门并建立自己的网站。菜鸟先飞早入行——学的不仅是技术，更是梦想。菜鸟教程是一个提供最新的web技术站点，本站免费提供了建站相关的技术文档，帮助广大web技术爱好者快速入门并建立自己的网站。菜鸟先飞早入行——学的不仅是技术，更是梦想。菜鸟教程是一个提供最新的web技术站点，本站免费提供了建站相关的技术文档，帮助广大web技术爱好者快速入门并建立自己的网站。菜鸟先飞早入行——学的不仅是技术，更是梦想。菜鸟教程是一个提供最新的web技术站点，本站免费提供了建站相关的技术文档，帮助广大web技术爱好者快速入门并建立自己的网站。菜鸟先飞早入行——学的不仅是技术，更是梦想。菜鸟教程是一个提供最新的web技术站点，本站免费提供了建站相关的技术文档，帮助广大web技术爱好者快速入门并建立自己的网站。菜鸟先飞早入行——学的不仅是技术，更是梦想。菜鸟教程是一个提供最新的web技术站点，本站免费提供了建站相关的技术文档，帮助广大web技术爱好者快速入门并建立自己的网站。菜鸟先飞早入行——学的不仅是技术，更是梦想。菜鸟教程是一个提供最新的web技术站点，本站免费提供了建站相关的技术文档，帮助广大web技术爱好者快速入门并建立自己的网站。菜鸟先飞早入行——学的不仅是技术，更是梦想。菜鸟教程是一个提供最新的web技术站点，本站免费提供了建站相关的技术文档，帮助广大web技术爱好者快速入门并建立自己的网站。菜鸟先飞早入行——学的不仅是技术，更是梦想。菜鸟教程是一个提供最新的web技术站点，本站免费提供了建站相关的技术文档，帮助广大web技术爱好者快速入门并建立自己的网站。菜鸟先飞早入行——学的不仅是技术，更是梦想。</p>
			</div>
			<div class="tab-pane fade" id="ios">
				<p>iOS 是一个由苹果公司开发和发布的手机操作系统。最初是于 2007 年首次发布 iPhone、iPod Touch 和 Apple TV。iOS 派生自 OS X，它们共享
					Darwin 基础。OS X 操作系统是用在苹果电脑上，iOS 是苹果的移动版本。</p>
			</div>
			<div class="tab-pane fade" id="jmeter">
				<p>jMeter 是一款开源的测试软件。它是 100% 纯 Java 应用程序，用于负载和性能测试。</p>
			</div>
			<div class="tab-pane fade" id="ejb">
				<p>Enterprise Java Beans（EJB）是一个创建高度可扩展性和强大企业级应用程序的开发架构，部署在兼容应用程序服务器（比如 JBOSS、Web Logic 等）的
					J2EE 上。</p>
			</div>
		</div>
		</ll-fillarea-lr> </ll-filllayout> </ll-fillarea-tb> <ll-fillarea-tb height="35"> <ll-toolbar style="line-height:35px;height:100%;">
		<input type="button" class="btn btn-info btn-sm" onclick="onClickAdd()" value="增加" /> <input
			type="button" class="btn btn-info btn-sm " onclick="onClickEdit()" value="编辑"
		/> <input type="button" class="btn btn-info btn-sm" onclick="onClickDelete()" value="删除" /></ll-toolbar> </ll-fillarea-tb> </ll-filllayout>
	</form>
</body>
</html>