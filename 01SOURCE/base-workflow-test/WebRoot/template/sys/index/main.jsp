
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
</head>
<body>
	<form>
		<ll-filllayout width="200px"> <ll-fillarea-lr width="50%"> <ll-filllayout>
		<ll-fillarea-tb height="50%">
		<div id="main1" style="width: 100%; height: 100%;"></div>
		</ll-fillarea-tb> <ll-fillarea-tb height="50%">
		<div id="main2" style="width: 100%; height: 100%;"></div>
		</ll-fillarea-tb> </ll-filllayout> </ll-fillarea-lr> <ll-fillarea-lr width="*"> <ll-filllayout> <ll-fillarea-tb
			height="50%"
		>
		<div id="main3" style="width: 100%; height: 100%;"></div>
		</ll-fillarea-tb> <ll-fillarea-tb height="50%">
		<div id="main4" style="width: 100%; height: 100%;"></div>
		</ll-fillarea-tb> </ll-filllayout> </ll-fillarea-lr> </ll-filllayout>
	</form>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->

	<script type="text/javascript">
	function init() {
		// 基于准备好的dom，初始化echarts实例
		var myChart1 = echarts.init(document.getElementById('main1'), "shine");
		var myChart2 = echarts.init(document.getElementById('main2'), "shine");
		var myChart3 = echarts.init(document.getElementById('main3'), "shine");
		var myChart4 = echarts.init(document.getElementById('main4'), "shine");
		// 指定图表的配置项和数据

		
		var option1 = {
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
				data : [ 5, 20, 36, 10, 10, 20 ],
				itemStyle : {
					normal : {
						color : '#F38F4A'
					}
				},
			} ]
		};
		
		var date = [1,2,3,4,5,6,7,8,9,10,11,12];
		var data = [200,250,230,200,500,250,300,280,400,310,411,312];
		var option2 = {
			tooltip : {
				trigger : 'axis',
				position : function(pt) {
					return [ pt[0], '10%' ];
				}
			},
			title : {
				left : 'center',
				text : 'Big Area',
			},
			xAxis : {
				type : 'category',
				boundaryGap : false,
				data : date
			},
			yAxis : {
				type : 'value',
				boundaryGap : [ 0, '50%' ]
			},
			dataZoom : [ {
				type : 'inside',
				start : 0,
				end : 100
			} ],
			series : [ {
				name : 'count',
				type : 'line',
				smooth : true,
				symbol : 'none',
				sampling : 'average',
				itemStyle : {
					normal : {
						color : '#F38F4A'
					}
				},
				areaStyle : {
					normal : {
						color : new echarts.graphic.LinearGradient(0, 0, 0, 1, [ {
							offset : 0,
							color : '#FABD97'
						}, {
							offset : 1,
							color : '#FBDB73'
						} ])
					}
				},
				data : data
			} ]
		};

		var xAxisData = [ "Chanchen", "Nanhai", "Shunde", "Shanshui", "Gaoming" ];
		var data1 = [ 5, 2, 3, 4, 5 ];
		var data2 = [ 1, 4, 4, 5, 6 ];
		var data3 = [ 3, 3, 3.5, 4.5, 5.5 ];
		var itemStyle1 = {
			normal : {
				color : new echarts.graphic.LinearGradient(0, 0, 0, 1, [ {
					offset : 0,
					color : '#FDA3B0'
				}, {
					offset : 0.5,
					color : '#FF9BAB'
				}, {
					offset : 1,
					color : '#FE859D'
				} ]),
				borderColor : 'white',
				barBorderWidth : 1,
				shadowBlur : 0,
				shadowOffsetX : 0,
				shadowOffsetY : 0,
				shadowColor : 'rgba(0,0,0,0.5)'

			}
		};
		var itemStyle2 = {
			normal : {
				color : new echarts.graphic.LinearGradient(0, 0, 0, 1, [ {
					offset : 0,
					color : '#FBDA71'
				}, {
					offset : 0.5,
					color : '#FACB94'
				}, {
					offset : 1,
					color : '#FABD95'
				} ]),
				borderColor : 'white',
				barBorderWidth : 1,
				shadowBlur : 0,
				shadowOffsetX : 0,
				shadowOffsetY : 0,
				shadowColor : 'rgba(0,0,0,0.5)'

			}
		};
		var itemStyleLine = {
			normal : {
				color : "#7AD0B7",
				borderColor : 'white',
				barBorderWidth : 1,
				shadowBlur : 0,
				shadowOffsetX : 0,
				shadowOffsetY : 0,
				shadowColor : 'rgba(0,0,0,0.5)'

			}
		};

		var option3 = {
			title : {
				text : '2018-01',
				x : 'center'
			},
			backgroundColor : '#eee',
			legend : {
				data : [ 'one', 'two', 'three' ],
				align : 'right',
				right : 10
			},
			tooltip : {},
			xAxis : {
				data : xAxisData,
				name : 'month',
				silent : false,
				axisLine : {
					onZero : false
				},
				splitLine : {
					show : false
				},
				splitArea : {
					show : false
				}
			},
			yAxis : {
				inverse : false,
				splitArea : {
					show : false
				}
			},
			grid : {
				left : 100
			},

			series : [ {
				name : 'one',
				type : 'bar',
				stack : 'one',
				itemStyle : itemStyle1,
				data : data1
			}, {
				name : 'two',
				type : 'bar',
				stack : 'one',
				align : 'right',
				itemStyle : itemStyle2,
				data : data2
			}, {
				name : 'three',
				type : 'line',
				stack : 'two',
				align : 'right',
				itemStyle : itemStyleLine,
				data : data3
			} ]
		};

		// 指定图表的配置项和数据
		var option4 = {
			title : {
				text : 'Arrearage 2018-01',
				x : 'center'
			},
			tooltip : {},
			//legend: {
			//    data:['Households']
			//},
			xAxis : {
				type : 'category',
				boundaryGap : false,
				data : [ "Chancheng", "Nanhai", "Shunde", "Sanshui", "Gaoming" ],
				axisLabel : {
					interval : 0
				}
			},
			yAxis : {
				type : 'value'
			},
			series : [ {
				name : 'Charges(10K)',
				type : 'line',
				symbolSize : 8,
				smooth : true,
				areaStyle : {},
				data : [ 357, 189, 320, 276, 257 ]
			} ]
		};
		
		// 使用刚指定的配置项和数据显示图表。
		myChart1.setOption(option1);
		myChart2.setOption(option2);
		myChart3.setOption(option3);
		myChart4.setOption(option4);
	};
	</script>
</body>
</html>