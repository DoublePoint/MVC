Vue.component('ll:datagrid', {
	props: ['id','datasource'],
	template : '<table id="{{id}}"></table>',
	data : function() {
		var returndata=null;
		$.ajax({
			url : datasource,
			type : "POST",
			contentType : 'application/json;charset=UTF-8',
			dataType : "json",
			data : JSON.stringify(cd),
			async : false,
			success : function(data) {
				tableLayui.render({
					elem : '#demo',
					data : data,
					// height : 'auto',
					// height : '400',
					// height : $("#demo").parent().height(),
					height : $(window).height() - 40,
					id : "demo",
					// height :
					// $(window).height()-$("#demo").parent().find("layui-btn-group").height(),
					cols : [ [ // 标题栏
					{
						checkbox : true,
						LAY_CHECKED : false
					} // 默认全选
					, {
						field : 'cdbs',
						title : '菜单标识',
						width : 230,
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
					} ] ],
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
		return returndata;
	}
})

new Vue({
  data: {
    a: 1
  },
  created: function () {
    // `this` 指向 vm 实例
    console.log('a is: ' + this.a)
  }
})