var $lform;
function initReady(){
	/*-----------创建最底层vue对象---------------*/
	_InitBaseVueComponent();

	/*-----------浏览器最小化事件---------------*/
	_InitExplorerResizeListener();

	/*-----------根据参数判断是否执行init方法---------------*/
//	_InvokeTheInitFunction();

	/*-----------添加事件监听---------------*/
	_InitFormFieldListener();
	
	/*-----添加LayoutArea合并监听*/
	_InitLayoutAreaCombineListener();
}
$(document).ready(function() {
	initReady();
});

/*-----------创建最底层vue对象---------------*/
function _InitBaseVueComponent() {
	$lform = new Vue({
		el : "form",
		methods : {
			incrementTotal : function() {
				this.total += 1
			}
		},
		mounted:function(){
			var body=$("body");
			body.show();
		}
	});
}
/*-----------浏览器最小化事件---------------*/
function _InitExplorerResizeListener() {
	$(window).on("resize",function() {
		// 设置iframe的高度
		var explorerHeight = $(this).height()
		var $content = $('#layui-tab-content');
		var $iframe = $('#layui-tab-content iframe');
		var trueHeight = explorerHeight - 145
		if(trueHeight<=300)
			trueHeight=300;
		$content.height(trueHeight);
		$iframe.height(trueHeight);
		// $("#testSpan").text($("#testSpan").text() + explorerHeight + " ");

		// 设置各个vue组件的高度 datagrid layout 
		resizeAllVueModel();

	}).resize();
}

/*-----------添加FormField事件监听---------------*/
function _InitFormFieldListener() {
	
}
function _InitLayoutAreaCombineListener(){
	 $(".ll-fill-area-left-right-center .ll-drag-to-left").click(function(){
		 var dragId=$(this).parent(".ll-fill-area-left-right-center").attr("id");
		 var parentId=$(this).parent().attr("id");
		 var drag=new _LL_Model.LayoutDrag(dragId);
		 drag.moveLeft();
	 })
	 $(".ll-fill-area-left-right-center .ll-drag-to-right").click(function(){
		 var dragId=$(this).parent(".ll-fill-area-left-right-center").attr("id");
		 var parentId=$(this).parent().attr("id");
		 var drag=new _LL_Model.LayoutDrag(dragId);
		 drag.moveRight();
	 })
}
//定义页面的默认Init方法
function init(){
	
}
var _DialogIndexMap=new $._HashTable();;
function addLayerDialogMap(index,dialogParam){
	_DialogIndexMap.add(index,dialogParam);
}
//如果该页面是弹窗 那么在弹窗执行完成success 以及 执行完用户自定义的init方法之前就会执行该方法
function initBeforeJspInit(){
	// 设置各个vue组件的高度 datagrid layout 
	var registeredModelList = $.getRegisteredDialogSuccessModel();
	for(index in registeredModelList){
		registeredModelList[index].doInDialogSuccess();
	}
}

function resizeAllVueModel(){
	var registeredModelList = $.getRegisteredResizeModel();
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
}