var bodyHeight;
layui.use([ 'element', 'layer' ], function() {
	var element = layui.element; // 导航的hover效果、二级菜单等功能，需要依赖element模块
	var layer = layui.layer;
	// 监听导航点击
	element.on('nav(demo)', function(elem) {
		layer.msg(elem.text());
		// 新增一个Tab项
		element.tabAdd('admin-tab', {
			title : elem.text(), // 用于演示
			content : '<iframe src="ajaxdatagrid.jsp"></iframe>',
			id : elem.text()
		// 实际使用一般是规定好的id，这里以时间戳模拟下
		});
		 //切换到指定Tab项
	    element.tabChange('admin-tab', elem.text()); //切换到：用户管理
	});
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
	contentType:'application/json;charset=UTF-8',
	async : false,
	success : function(data) {
		menu.setData(data);
	},
	error : function() {
		alert("error");
	}
});
