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
	$(window).resize(function() {
		var explorerHeight = $(this).height()
		var $content = $('#layui-tab-content');
		var trueHeight = explorerHeight - 145
		$content.height(trueHeight);
		$("#testSpan").text($("#testSpan").text() + explorerHeight + " ");

		var registeredModelList = $._GetRegisteredResizeModel();
		if (registeredModelList != null) {
			for (var i = 0; i < registeredModelList.length; i++) {
				var domObj = registeredModelList[i];
				domObj.resize();
			}
		}

	}).resize();

	// 当参数为N时才不执行，否则执行
	if (!($._GetRequestParam(ConstantPageDefaultParam._IS_DO_INIT_FUNTION) == ConstantState._YES_NO_STATE_N)) {
		init();
	}

});
function init() {
	alert("init")
}