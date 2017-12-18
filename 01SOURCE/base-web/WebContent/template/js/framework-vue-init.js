var $lform;
var treeselect = null;
$(document).ready(function() {
	// layui.extend({
	// treeselect :
	// $$pageContextPath+'/template/js/layui-extend/layui-tree-select' //
	// {/}的意思即代表采用自有路径，即不跟随
	// })
	// var data={ //节点
	// name: '父节点1'
	// ,children: [{
	// name: '子节点11'
	// },{
	// name: '子节点12'
	// }]
	// };
	// layui.use([ 'treeselect' ], function() {
	// treeselect = layui.treeselect
	// layui.treeselect({
	// elem: "#treeselecttest",
	// data: data,//可以是treedata，也可以是 获取treedata的URL地址
	// method: "GET"
	// });
	//	});

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

	// 一些事件监听
	$element.on('tab(demo)', function(data) {
		console.log(data);
	});
});
function init() {
	alert("init")
}