
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

<script>
	function aa() {
		$.openDialog({
			type : 2,
			title : "详细信息",
			width : 930,
			height : 630,
			shade : 0.4,
			closeBtn : 1,
			shadeClose : true,
			maxmin : true,
			content : $$pageContextPath + '/template/sys/assistant/generateDetail?generateDirPath='+1+"&tableName="+2,
			data : {
				generateDirPath:1,
				tableName:2
			},
			yes : function() {
				
			},
			cancel : function() {

			}
		});
	}
	$(function() {
		$("table").find("tr").on("dblclick.a", function() {
			aa();
		});
		$("table").find("tr").on("dblclick", function() {
			aa();
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