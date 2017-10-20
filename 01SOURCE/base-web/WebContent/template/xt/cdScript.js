layui.use(['element','layer','jquery'], function(){
  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
  var layer	=layui.layer;
  var $=layui.jquery;
  //监听导航点击
  element.on('nav(demo)', function(elem){
    
  });
  $('.admin-side-toggle').on('click', function () {
	    var sideWidth = $('#admin-side').width();
	    if (sideWidth === 200) {
	        $('#admin-body').animate({
	            left: '0'
	        }); //admin-footer
	        $('#admin-footer').animate({
	            left: '0'
	        });
	        $('#admin-side').animate({
	            width: '0'
	        });
	    } else {
	        $('#admin-body').animate({
	            left: '200px'
	        });
	        $('#admin-footer').animate({
	            left: '200px'
	        });
	        $('#admin-side').animate({
	            width: '200px'
	        });
	    }
	});
});

