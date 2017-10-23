var bodyHeight;
layui.use(['element','layer'], function(){
  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
  var layer	=layui.layer;
  //监听导航点击
//  element.on('nav(demo)', function(elem){
//    
//  });
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
  //iframe自适应
  $(window).on('resize', function () {
      var $content = $('.admin-nav-card .layui-tab-content');
      $content.height($(this).height() - 142);
      $content.find('iframe').each(function () {
    	  bodyHeight=$content.height();
    	  alert(bodyHeight);
          $(this).height($content.height());
      });
  }).resize();
  
  
  var dataList=[];
  
  var data1={
		  cdmc:"权限管理",
		  link:"www.baidu.com"
  }
  var data2={
		  cdmc:"菜单管理",
		  link:"www.baidu.com"
  }
  var data3={
		  cdmc:"角色管理",
		  link:"www.baidu.com"
  }
  dataList.push(data1);
  dataList.push(data2);
  dataList.push(data3);
  menu.setData(dataList);
});



