Vue.component(
				'll-datagrid',
				{
					props : [ 'id', 'datasource', 'cols' ],
					// template : '<table id="tableid"
					// v-on:click="incrementCounter"><tr><td>{{cdmc}}</td></tr></table>',
					template : '<span  id="tableid"  v-on:click="incrementCounter">{{cdmc}}</span>',
					data : function() {
						var dataList;
						return {
							cdbs : "111111111111",
							cdmc : "菜单管理111111",
							sjcdbs : "1",
							cdcj : 1,
							cdpx : 1
						}
					},
					methods : {
						incrementCounter : function() {
							var cd = {};
							$.ajax({
								url : $$pageContextPath + this.datasource,
								type : "POST",
								contentType : 'application/json;charset=UTF-8',
								dataType : "json",
								data : JSON.stringify(cd),
								async : false,
								success : function(data) {
									$table.render({
										elem : '#tableid',
										data : data,
										// height : 'auto',
										height : '400',
										// height :
										// $("#demo").parent().height(),
										// height : $(window).height() - 40,
										// height :
										// $(window).height()-$("#demo").parent().find("layui-btn-group").height(),
										 cols :datagird22.todo ,
// cols : this.cols,
										skin : 'row' // 表格风格
										,

										even : true,
										page : true // 是否显示分页
										,
										limits : [ 5, 7, 10, 20, 100 ],
										limit : 50
									// 每页默认显示的数量
									});
								},
								error : function() {
									alert("error");
								}
							});
							this.cdmc = this.cdmc + "123";
							this.$emit('increment')
						}
					},
				})
var columns=[ [ // 标题栏
				 {
					 checkbox : true,
					 LAY_CHECKED : false
					 } // 默认全选
					 , {
					 field : 'cdbs',
					 title : '菜单标识',
					 width : 180,
					 sort : true
					 }, {
					 field : 'cdmc',
					 title : '菜单名称',
					 width : 180
					 }, {
					 field : 'cdpx',
					 title : '菜单排序',
					 width : 150
					 }, {
					 field : 'cdlj',
					 title : '签名',
					 width : 150
					 } ] ];
var datagird22;
$(document).ready(function() {
	datagird22 = new Vue({
		el : "form",
		data : {
			total:0,
			todo : columns
		},
		methods : {
			incrementTotal : function() {
				this.total += 1
			}
		}
	})
	if (init != null)
		init();
});
