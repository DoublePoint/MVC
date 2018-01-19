
<%
	/* 
	 * 创   建   人： 刘磊
	 * 
	 * 创   建   时   间 ： 2018年1月19日
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
<%@ include file="/template/base-chart.jsp"%>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
</head>
<body>
	<form>
		<ll-filllayout width="200px"> 
			<ll-fillarea-lr width="50%"> 
				<ll-filllayout>
					<ll-fillarea-tb height="50%">
							<div id="main1" style="width: 100%; height: 100%;"></div>
					</ll-fillarea-tb> 
					
					<ll-fillarea-tb height="50%">
							<div id="main2" style="width: 100%; height: 100%;"></div>
					</ll-fillarea-tb> 
				</ll-filllayout> 
			</ll-fillarea-lr> 
			
			<ll-fillarea-lr width="*"> 
				<ll-filllayout> 
					<ll-fillarea-tb	height="50%">
						<div id="main3" style="width: 100%; height: 100%;"></div>
					</ll-fillarea-tb> 
					<ll-fillarea-tb height="50%">
						<div id="main4" style="width: 100%; height: 100%;"></div>
					</ll-fillarea-tb> 
				</ll-filllayout> 
			</ll-fillarea-lr> 
		</ll-filllayout>
	</form>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->

	<script type="text/javascript">
		function init(){
			alert(1);
			// 基于准备好的dom，初始化echarts实例
			var myChart1 = echarts.init(document.getElementById('main1'), "shine");
			var myChart2 = echarts.init(document.getElementById('main2'), "shine");
			var myChart3 = echarts.init(document.getElementById('main3'), "shine");
			var myChart4 = echarts.init(document.getElementById('main4'), "shine");
			// 指定图表的配置项和数据
			var option = {
				title : {
					text : 'ECharts 入门示例'
				},
				tooltip : {},
				legend : {
					data : [ '销量' ]
				},
				xAxis : {
					data : [ "衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子" ]
				},
				yAxis : {},
				series : [ {
					name : '销量',
					type : 'bar',
					data : [ 5, 20, 36, 10, 10, 20 ]
				} ]
			};
	
			// 使用刚指定的配置项和数据显示图表。
			myChart1.setOption(option);
			myChart2.setOption(option);
			myChart3.setOption(option);
			myChart4.setOption(option);
		}
	</script>
</body>
</html>