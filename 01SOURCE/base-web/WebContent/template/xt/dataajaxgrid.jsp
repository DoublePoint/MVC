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
	<div>


		<table id="demo" style="margin:0px;"></table>
		<script>
			var tabldHeight;
			layui.use(['table','jquery'], function() {
				var table = layui.table;
				var $=layui.jquery;
				/* alert($(window).height())
				alert($(window).height()-20)
				//展示已知数据
				table.render({
					elem : '#demo',
					data : [ {
						"id" : "10001",
						"username" : "杜甫",
						"email" : "xianxin@layui.com",
						"sex" : "男",
						"city" : "浙江杭州",
						"sign" : "人生恰似一场修行",
						"experience" : "116",
						"ip" : "192.168.0.8",
						"logins" : "108",
						"joinTime" : "2016-10-14"
					}, {
						"id" : "10002",
						"username" : "李白",
						"email" : "xianxin@layui.com",
						"sex" : "男",
						"city" : "浙江杭州",
						"sign" : "人生恰似一场修行",
						"experience" : "12",
						"ip" : "192.168.0.8",
						"logins" : "106",
						"joinTime" : "2016-10-14",
						"LAY_CHECKED" : true
					}, {
						"id" : "10003",
						"username" : "王勃",
						"email" : "xianxin@layui.com",
						"sex" : "男",
						"city" : "浙江杭州",
						"sign" : "人生恰似一场修行",
						"experience" : "65",
						"ip" : "192.168.0.8",
						"logins" : "106",
						"joinTime" : "2016-10-14"
					}, {
						"id" : "10004",
						"username" : "贤心",
						"email" : "xianxin@layui.com",
						"sex" : "男",
						"city" : "浙江杭州",
						"sign" : "人生恰似一场修行",
						"experience" : "666",
						"ip" : "192.168.0.8",
						"logins" : "106",
						"joinTime" : "2016-10-14"
					}, {
						"id" : "10005",
						"username" : "贤心",
						"email" : "xianxin@layui.com",
						"sex" : "男",
						"city" : "浙江杭州",
						"sign" : "人生恰似一场修行",
						"experience" : "86",
						"ip" : "192.168.0.8",
						"logins" : "106",
						"joinTime" : "2016-10-14"
					}, {
						"id" : "10006",
						"username" : "贤心",
						"email" : "xianxin@layui.com",
						"sex" : "男",
						"city" : "浙江杭州",
						"sign" : "人生恰似一场修行",
						"experience" : "12",
						"ip" : "192.168.0.8",
						"logins" : "106",
						"joinTime" : "2016-10-14"
					}, {
						"id" : "10007",
						"username" : "贤心",
						"email" : "xianxin@layui.com",
						"sex" : "男",
						"city" : "浙江杭州",
						"sign" : "人生恰似一场修行",
						"experience" : "16",
						"ip" : "192.168.0.8",
						"logins" : "106",
						"joinTime" : "2016-10-14"
					}, {
						"id" : "10008",
						"username" : "贤心",
						"email" : "xianxin@layui.com",
						"sex" : "男",
						"city" : "浙江杭州",
						"sign" : "人生恰似一场修行",
						"experience" : "106",
						"ip" : "192.168.0.8",
						"logins" : "106",
						"joinTime" : "2016-10-14"
					}, {
						"id" : "10008",
						"username" : "贤心",
						"email" : "xianxin@layui.com",
						"sex" : "男",
						"city" : "浙江杭州",
						"sign" : "人生恰似一场修行",
						"experience" : "106",
						"ip" : "192.168.0.8",
						"logins" : "106",
						"joinTime" : "2016-10-14"
					}, {
						"id" : "10008",
						"username" : "贤心",
						"email" : "xianxin@layui.com",
						"sex" : "男",
						"city" : "浙江杭州",
						"sign" : "人生恰似一场修行",
						"experience" : "106",
						"ip" : "192.168.0.8",
						"logins" : "106",
						"joinTime" : "2016-10-14"
					}, {
						"id" : "10008",
						"username" : "贤心",
						"email" : "xianxin@layui.com",
						"sex" : "男",
						"city" : "浙江杭州",
						"sign" : "人生恰似一场修行",
						"experience" : "106",
						"ip" : "192.168.0.8",
						"logins" : "106",
						"joinTime" : "2016-10-14"
					}, {
						"id" : "10008",
						"username" : "贤心",
						"email" : "xianxin@layui.com",
						"sex" : "男",
						"city" : "浙江杭州",
						"sign" : "人生恰似一场修行",
						"experience" : "106",
						"ip" : "192.168.0.8",
						"logins" : "106",
						"joinTime" : "2016-10-14"
					}, {
						"id" : "10008",
						"username" : "贤心",
						"email" : "xianxin@layui.com",
						"sex" : "男",
						"city" : "浙江杭州",
						"sign" : "人生恰似一场修行",
						"experience" : "106",
						"ip" : "192.168.0.8",
						"logins" : "106",
						"joinTime" : "2016-10-14"
					} ],
					//height : 'auto',
					//height : '400',
					height:$(window).height()-20,
					cols : [ [ //标题栏
					{
						checkbox : true,
						LAY_CHECKED : true
					} //默认全选
					, {
						field : 'id',
						title : 'ID',
						width : 80,
						sort : true
					}, {
						field : 'username',
						title : '用户名',
						width : 120
					}, {
						field : 'email',
						title : '邮箱',
						width : 150
					}, {
						field : 'sign',
						title : '签名',
						width : 150
					}, {
						field : 'sex',
						title : '性别',
						width : 80
					}, {
						field : 'city',
						title : '城市',
						width : 100
					}, {
						field : 'experience',
						title : '积分',
						width : 80,
						sort : true
					} ] ],
					skin : 'row' //表格风格
					,
					even : true,
					page : true //是否显示分页
					,
					limits : [ 5, 7, 10,20,100 ],
					limit : 50
				//每页默认显示的数量
				}); */
				
				 $(window).on('resize', function () {table.render({
						elem : '#demo',
						data : [ {
							"id" : "10001",
							"username" : "杜甫",
							"email" : "xianxin@layui.com",
							"sex" : "男",
							"city" : "浙江杭州",
							"sign" : "人生恰似一场修行",
							"experience" : "116",
							"ip" : "192.168.0.8",
							"logins" : "108",
							"joinTime" : "2016-10-14"
						}, {
							"id" : "10002",
							"username" : "李白",
							"email" : "xianxin@layui.com",
							"sex" : "男",
							"city" : "浙江杭州",
							"sign" : "人生恰似一场修行",
							"experience" : "12",
							"ip" : "192.168.0.8",
							"logins" : "106",
							"joinTime" : "2016-10-14",
							"LAY_CHECKED" : true
						}, {
							"id" : "10003",
							"username" : "王勃",
							"email" : "xianxin@layui.com",
							"sex" : "男",
							"city" : "浙江杭州",
							"sign" : "人生恰似一场修行",
							"experience" : "65",
							"ip" : "192.168.0.8",
							"logins" : "106",
							"joinTime" : "2016-10-14"
						}, {
							"id" : "10004",
							"username" : "贤心",
							"email" : "xianxin@layui.com",
							"sex" : "男",
							"city" : "浙江杭州",
							"sign" : "人生恰似一场修行",
							"experience" : "666",
							"ip" : "192.168.0.8",
							"logins" : "106",
							"joinTime" : "2016-10-14"
						}, {
							"id" : "10005",
							"username" : "贤心",
							"email" : "xianxin@layui.com",
							"sex" : "男",
							"city" : "浙江杭州",
							"sign" : "人生恰似一场修行",
							"experience" : "86",
							"ip" : "192.168.0.8",
							"logins" : "106",
							"joinTime" : "2016-10-14"
						}, {
							"id" : "10006",
							"username" : "贤心",
							"email" : "xianxin@layui.com",
							"sex" : "男",
							"city" : "浙江杭州",
							"sign" : "人生恰似一场修行",
							"experience" : "12",
							"ip" : "192.168.0.8",
							"logins" : "106",
							"joinTime" : "2016-10-14"
						}, {
							"id" : "10007",
							"username" : "贤心",
							"email" : "xianxin@layui.com",
							"sex" : "男",
							"city" : "浙江杭州",
							"sign" : "人生恰似一场修行",
							"experience" : "16",
							"ip" : "192.168.0.8",
							"logins" : "106",
							"joinTime" : "2016-10-14"
						}, {
							"id" : "10008",
							"username" : "贤心",
							"email" : "xianxin@layui.com",
							"sex" : "男",
							"city" : "浙江杭州",
							"sign" : "人生恰似一场修行",
							"experience" : "106",
							"ip" : "192.168.0.8",
							"logins" : "106",
							"joinTime" : "2016-10-14"
						}, {
							"id" : "10008",
							"username" : "贤心",
							"email" : "xianxin@layui.com",
							"sex" : "男",
							"city" : "浙江杭州",
							"sign" : "人生恰似一场修行",
							"experience" : "106",
							"ip" : "192.168.0.8",
							"logins" : "106",
							"joinTime" : "2016-10-14"
						}, {
							"id" : "10008",
							"username" : "贤心",
							"email" : "xianxin@layui.com",
							"sex" : "男",
							"city" : "浙江杭州",
							"sign" : "人生恰似一场修行",
							"experience" : "106",
							"ip" : "192.168.0.8",
							"logins" : "106",
							"joinTime" : "2016-10-14"
						}, {
							"id" : "10008",
							"username" : "贤心",
							"email" : "xianxin@layui.com",
							"sex" : "男",
							"city" : "浙江杭州",
							"sign" : "人生恰似一场修行",
							"experience" : "106",
							"ip" : "192.168.0.8",
							"logins" : "106",
							"joinTime" : "2016-10-14"
						}, {
							"id" : "10008",
							"username" : "贤心",
							"email" : "xianxin@layui.com",
							"sex" : "男",
							"city" : "浙江杭州",
							"sign" : "人生恰似一场修行",
							"experience" : "106",
							"ip" : "192.168.0.8",
							"logins" : "106",
							"joinTime" : "2016-10-14"
						}, {
							"id" : "10008",
							"username" : "贤心",
							"email" : "xianxin@layui.com",
							"sex" : "男",
							"city" : "浙江杭州",
							"sign" : "人生恰似一场修行",
							"experience" : "106",
							"ip" : "192.168.0.8",
							"logins" : "106",
							"joinTime" : "2016-10-14"
						} ],
						//height : 'auto',
						//height : '400',
						height:$(window).height(),
						cols : [ [ //标题栏
						{
							checkbox : true,
							LAY_CHECKED : true
						} //默认全选
						, {
							field : 'id',
							title : 'ID',
							width : 80,
							sort : true
						}, {
							field : 'username',
							title : '用户名',
							width : 120
						}, {
							field : 'email',
							title : '邮箱',
							width : 150
						}, {
							field : 'sign',
							title : '签名',
							width : 150
						}, {
							field : 'sex',
							title : '性别',
							width : 80
						}, {
							field : 'city',
							title : '城市',
							width : 100
						}, {
							field : 'experience',
							title : '积分',
							width : 80,
							sort : true
						} ] ],
						skin : 'row' //表格风格
						,
						
						even : true,
						page : true //是否显示分页
						,
						limits : [ 5, 7, 10,20,100 ],
						limit : 50
					//每页默认显示的数量
					});
					//alert($(window).height())
					//alert($(window).height()-20)
				  }).resize();
			});
		</script>
	</div>
</body>
<style>
	.layui-table-view {
		margin:0px;
	}
</style>
</html>