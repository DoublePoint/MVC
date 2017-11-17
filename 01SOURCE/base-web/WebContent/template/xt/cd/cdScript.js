function showAddDialog(){
	layui.use([ 'element', 'layer' ], function() {
		var element = layui.element; // 导航的hover效果、二级菜单等功能，需要依赖element模块
//		var layer = layui.layer;
		parent.layer.open({
			  type: 2,
			  title: "添加菜单",
			  area: ['630px', '360px'],
			  shade: 0.8,
			  closeBtn: 1,
			  shadeClose: true,
			  maxmin:true,
			  content: $$pageContextPath+'/template/xt/cdDialog'
			});
	});
}