(function($) {
	Vue.component(_LL_Constant._ConstantComponentMap._Card, {
		props : [ 'title', 'value', 'url', 'backgroundcolor', 'type' ],
		template : '<div :class="clientClass">' + //
		'<div class="inner">' + //
		'<h3 v-html="value"></h3>' + //
		'<p v-html="title"></p>' + //
		'</div>' + //
		'<div class="icon">' + //
		'  <i class="ion ion-list-ul"></i>' + //
		' </div>' + //
		' <a :href="url" class="small-box-footer">更多信息 <i class="fa fa-arrow-circle-right"></i></a>' + //
		' </div>',
		data : function() {
			var clientClass = "small-box ";
			if (this.type == "info") {
				clientClass += " bg-info";
			} else if (this.type == "success") {
				clientClass += " bg-success";
			} else if (this.type == "warning") {
				clientClass += " bg-warning";
			} else {
				clientClass += " bg-danger";
			}
			return {
				clientClass:clientClass
			}
		},
		created : function() {
		},
		mounted : function() {
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
				var domId = this._GetComponentDomId();
				var _FillLayout = new _LL_Model.FillLayout(domId);
				$.addToLayuiObjectHashMap(domId, _FillLayout);
			},
			_AddDragDom : function() {
				var dom = this._GetComponentDom();
				dom.addDrag();
			},
			// 添加生命FillLayout对象脚本
			_MapComponent : function() {
				$.outputMapCompoment(this);
			},
			_RegisterResize : function() {
				$.registerResizeModel(this._GetComponentDom());
			}
		},
	})

})(jQuery);