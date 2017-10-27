var bodyHeight;
layui.use([ 'element', 'layer' ], function() {
	var element = layui.element; // 导航的hover效果、二级菜单等功能，需要依赖element模块
	var layer = layui.layer;
	// 监听导航点击
	// element.on('nav(demo)', function(elem){
	//    
	// });
	$('.admin-side-toggle').on('click', function() {
		var sideWidth = $('#admin-side').width();
		if (sideWidth === 200) {
			$('#admin-body').animate({
				left : '0'
			}); // admin-footer
			$('#admin-footer').animate({
				left : '0'
			});
			$('#admin-side').animate({
				width : '0'
			});
		} else {
			$('#admin-body').animate({
				left : '200px'
			});
			$('#admin-footer').animate({
				left : '200px'
			});
			$('#admin-side').animate({
				width : '200px'
			});
		}
	});
	// iframe自适应
	$(window).on('resize', function() {
		var $content = $('.admin-nav-card .layui-tab-content');
		$content.height($(this).height() - 142);
		$content.find('iframe').each(function() {
			bodyHeight = $content.height();
			$(this).height($content.height());
		});
	}).resize();
});

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
		menu.setData(data);
		
	},
	error : function() {
		alert("error");
	}
});
