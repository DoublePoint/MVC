var $lform;
var treeselect = null;
$(document).ready(function() {
	/*-----------创建最底层vue对象---------------*/
	_InitBaseVueComponent();

	/*-----------浏览器最小化事件---------------*/
	_InitExplorerResizeListener();

	/*-----------根据参数判断是否执行init方法---------------*/
	_InvokeTheInitFunction();

	/*-----------添加事件监听---------------*/
	_InitFormFieldListener();
});

/*-----------创建最底层vue对象---------------*/
function _InitBaseVueComponent() {
	$lform = new Vue({
		el : "form",
		methods : {
			incrementTotal : function() {
				this.total += 1
			}
		}
	});
}
/*-----------浏览器最小化事件---------------*/
function _InitExplorerResizeListener() {
	$(window).resize(function() {
		// 设置iframe的高度
		var explorerHeight = $(this).height()
		var $content = $('#layui-tab-content');
		var trueHeight = explorerHeight - 145
		$content.height(trueHeight);

		// $("#testSpan").text($("#testSpan").text() + explorerHeight + " ");

		// 设置各个vue组件的高度
		var registeredModelList = $._GetRegisteredResizeModel();
		if (registeredModelList != null) {
			for (var i = 0; i < registeredModelList.length; i++) {
				var domObj = registeredModelList[i];
				domObj.resize();
			}
		}
		try {
			if (windowResize)
				windowResize();
		} catch (e) {

		}

	}).resize();
}
/*-----------根据参数判断是否执行init方法---------------*/
function _InvokeTheInitFunction() {
	// 当参数为N时才不执行，否则执行
	if (!($._GetRequestParam(_ConstantPageDefaultParam._IS_DO_INIT_FUNTION) == ConstantState._YES_NO_STATE_N)) {
		init();
	}
}
/*-----------添加FormField事件监听---------------*/
function _InitFormFieldListener() {
	$form.verify({
		title : function(value, dom) {
			var domid = dom.id;
			if (domid != null) {
				var formfield = $._GetFromLayuiObjectHashMap(domid);
				if (formfield == null)
					return;
				var validtype = formfield.validtype;
				if (validtype == null)
					validtype = "";
				switch (validtype) {
				case "int":
					if (!$._IsInt(value)) {
						return formfield.errmsg;
					}
					break;
				default:
					if (formfield.maxlen != null) {
						if (value.length > formfield.maxlen) {
							return formfield.errmsg;
						}
					}
					return;
				}
			}
		}
	});
}