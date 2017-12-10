var $lform;
$(document).ready(function() {
	$lform = new Vue({
		el : "form",
		methods : {
			incrementTotal : function() {
				this.total += 1
			}
		}
	});
	$(window).resize(function(){
//		resizeTimer=null;
		var explorerHeight=$(this).height()
//		resizeTimer=setTimeout(function(){
			var $content = $('#layui-tab-content');
			var trueHeight=explorerHeight - 145
			$content.height(trueHeight);
			$("#testSpan").text($("#testSpan").text()+explorerHeight+" ");
//			alert(explorerHeight)
//        }, 100)
		
//		console.log($(this).heigtht());
//		$content.find('iframe').each(function() {0
//			$(this).contents().find("body").scrollLeft(10);// 控制滚动条下移10px
//			if ($(this).contents().find("body").scrollLeft() > 0) {
//				bodyHeight = $content.height()-17;
//			} else {
//				bodyHeight = $content.height();
//			}  
//			    
//			
//			$(this).height(bodyHeight);
//			$(this).contents().find("form").height(bodyHeight);
//		});

		var registeredModelList = $._GetRegisteredResizeModel();
		if (registeredModelList != null) {
			for (var i = 0; i < registeredModelList.length; i++) {
				var domObj=registeredModelList[i];
				domObj.resize();
			}
		}
//		if(window.windowResize){
//			windowResize();
//		}
	
	}).resize();
	// iframe自适应
//	$(window).on('resize', function() {
//		var explorerHeight=$(this).height()
//		setTimeout(function(){
//			var $content = $('.admin-nav-card .layui-tab-content');
//			$content.height(explorerHeight - 145);
//			alert(explorerHeight)
//        }, 1000)
//		
////		console.log($(this).heigtht());
////		$content.find('iframe').each(function() {0
////			$(this).contents().find("body").scrollLeft(10);// 控制滚动条下移10px
////			if ($(this).contents().find("body").scrollLeft() > 0) {
////				bodyHeight = $content.height()-17;
////			} else {
////				bodyHeight = $content.height();
////			}  
////			    
////			
////			$(this).height(bodyHeight);
////			$(this).contents().find("form").height(bodyHeight);
////		});
//
//		var registeredModelList = $._GetRegisteredResizeModel();
//		if (registeredModelList != null) {
//			for (var i = 0; i < registeredModelList.length; i++) {
//				var domObj=registeredModelList[i];
//				domObj.resize();
//			}
//		}
////		if(window.windowResize){
////			windowResize();
////		}
//	}).resize();

	if (init != null)
		init();
});
