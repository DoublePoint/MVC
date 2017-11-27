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

	// iframe自适应
	$(window).on('resize', function() {
		var $content = $('.admin-nav-card .layui-tab-content');
		$content.height($(this).height() - 145);
		$content.find('iframe').each(function() {
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
		});

		var registeredModelList = $._GetRegisteredResizeModel();
		if (registeredModelList != null) {
			for (var i = 0; i < registeredModelList.length; i++) {
				var domObj=registeredModelList[i];
				domObj.resize();
			}
		}
		if(window.windowResize){
			windowResize();
		}
	}).resize();

	// if (documentWriteHtml != "")
	// $("body").append(documentWriteHtml);

	if (init != null)
		init();
});
