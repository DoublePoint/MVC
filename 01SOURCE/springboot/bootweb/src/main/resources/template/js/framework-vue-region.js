(function($) {
	Vue.component(_LL_Constant._ConstantComponentMap._Region, {
		props : [ 'id', 'height', 'width', 'backgroundcolor' ],
		template : '<div class="layui-collapse" lay-filter="test">' + '<div class="layui-colla-item">' + ' <h2 class="layui-colla-title">为什么JS社区大量采用未发布或者未广泛支持的语言特性？</h2>'
				+ ' <div class="layui-colla-content">' + '   <p>的。——来自知乎@贺师俊</p>' + '  </div>' + '</div>' + '<div class="layui-colla-item">'
				+ '  <h2 class="layui-colla-title">贤心是男是女？</h2>' + '  <div class="layui-colla-content">' + '     <p>man！ 所以这个问题不要再出现了。。。</p>' + '   </div>' + ' </div>' + '</div>',
		data : function() {

		},
		created : function() {
		},
		mounted : function() {
			// 监听折叠
			$element.on('collapse(test)', function(data) {
				$layer.msg('展开状态：' + data.show);
			});
		},
		methods : {
			_GetComponentDomId : function() {
				var _domId = this.id + this.guid;
				return _domId;
			},
			_GetComponentDom : function() {
				var domId = this._GetComponentDomId();
				var componentDom = $.getFromLayuiObjectHashMap(domId);
				return componentDom;
			},
			_RegisterComponent : function() {
			},
			_AddDragDom : function() {
			},
			// 添加生命FillLayout对象脚本
			_MapComponent : function() {
			},
			_RegisterResize : function() {
			}
		},
	});

	function LLRegion(domId) {
		this.domId = domId;
		this.getDomId = function() {
			return this.domId;
		}
		this.getDom = function() {
			return $("#" + this.domId);
		}
	}

})(jQuery);
