function showAddDialog() {
	layui.use([ 'element', 'layer' ], function() {
		var element = layui.element; // 导航的hover效果、二级菜单等功能，需要依赖element模块
		// var layer = layui.layer;
		parent.layer.open({
			type : 2,
			title : "添加菜单",
			area : [ '630px', '360px' ],
			shade : 0.4,
			closeBtn : 1,
			shadeClose : true,
			maxmin : true,
			content : $$pageContextPath + '/template/xt/cdDialog'
		});
		
		layer.open({
	        type: 2 //此处以iframe举例
	        ,title: '当你选择该窗体时，即会在最顶端'
	        ,area: ['390px', '260px']
	        ,shade: 0
	        ,maxmin: true
	        ,offset: [ //为了演示，随机坐标
	          Math.random()*($(window).height()-300)
	          ,Math.random()*($(window).width()-390)
	        ] 
	        ,content: 'http://layer.layui.com/test/settop.html'
	        ,btn: ['继续弹出', '全部关闭'] //只是为了演示
	        ,yes: function(){
	          $(that).click(); 
	        }
	        ,btn2: function(){
	          layer.closeAll();
	        }
	        
	        ,zIndex: layer.zIndex //重点1
	        ,success: function(layero){
	          layer.setTop(layero); //重点2
	        }
	      });
	});
	
	
}

var tabldHeight;
var tableLayui;
layui.use([ 'table', 'jquery' ], function() {
	tableLayui = layui.table;
	$ = layui.jquery;
	$(window).on('resize', function() {
		setData();
	}).resize();
	
});

function setData(){
	$.ajax({
		url : $$pageContextPath + "/template/xt/cdDataList",
		type : "POST",
		dataType : "json",
		data : {
			"a" : 1,
			"b" : 2,
			"c" : 3
		},
		async : false,
		success : function(data) {
			tableLayui.render({
				elem : '#demo',
				data :  data,
				// height : 'auto',
				// height : '400',
				//height : $("#demo").parent().height(),
				height : $(window).height()-40,
				//height : $(window).height()-$("#demo").parent().find("layui-btn-group").height(),
				cols : [ [ // 标题栏
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
	
	
}