
<%
	/** 
	* 创   建   人： 刘磊
	* 
	* 创   建   时   间 ：2018年1月17日 
	* 
	* 类   说   明 ：
	* 
	* 修   改   人：          修   改   日   期：
	*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/template/base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<TITLE>New Document</TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
<script src="jquery.js"></script>
<script>
	function aa() {
		alert("2");
	}
	$(function() {
		$("table").find("tr").on("dblclick.a", function() {
			alert("11");
		});
		$("table").find("tr").on("dblclick", function() {
			alert("111");
		});
	});
</script>
</HEAD>
<BODY>
	<table id="tab" border=1 width="400px">
		<tr class="_tr">
			<td>1</td>
			<td>1</td>
			<td>1</td>
		</tr>
		<tr onclick="aa()">
			<td>2</td>
			<td>2</td>
			<td>2</td>
		</tr>
		<tr>
			<td>3</td>
			<td>3</td>
			<td>3</td>
		</tr>
	</table>

</body>
</html>