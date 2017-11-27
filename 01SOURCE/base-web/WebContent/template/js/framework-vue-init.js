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
		$content.height($(this).height() - 142);
		$content.find('iframe').each(function() {
			bodyHeight = $content.height();
			$(this).height($content.height());
			$(this).contents().find("form").height($content.height());
		});

		var registeredModelList = $._GetRegisteredResizeModel();
		if (registeredModelList != null) {
			for (var i = 0; i < registeredModelList.length; i++) {
				var domObj=registeredModelList[i];
				domObj.resize();
			}
		}
	}).resize();

	// if (documentWriteHtml != "")
	// $("body").append(documentWriteHtml);

	if (init != null)
		init();
});
