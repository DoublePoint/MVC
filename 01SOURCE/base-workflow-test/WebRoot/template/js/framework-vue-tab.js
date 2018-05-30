(function($) {
	Vue.component(_LL_Constant._ConstantComponentMap._Tab, {
		props : [ 'id', 'height', 'width', 'backgroundcolor', 'title', 'active' ],
		template : '<div :class="clientClassBuffer" :style="clientStyle" :id="id+guid" :title="aTitle">' + '<slot></slot>' + '</div>',
		data : function() {
			var aTitle = "";
			if (this.title != null)
				aTitle = this.title;
			var clientClassBuffer = this._InitClientClassBuffer();
			var clientStyleBuffer = this._InitClientStyleBuffer();
			return {
				aTitle : aTitle,
				guid : $.generateUUID(),
				clientClassBuffer : clientClassBuffer.toString(),
				clientStyle : clientStyleBuffer.toString()
			}
		},
		created : function() {// 注册到系统map
			this._RegisterComponent();
		},
		mounted : function() {
			this._MapComponent();
			// 将formfield添加到form中
			this._AddToTabPanel();
		},
		beforeMount : function() {

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
				var tab = new Tab(domId);
				for ( var attrName in tab) {
					if (this[attrName] != null)
						tab[attrName] = this[attrName];
				}
				$.addToLayuiObjectHashMap(domId, tab);
			},
			_AddDragDom : function() {
			},
			// 添加生命FillLayout对象脚本
			_MapComponent : function() {
				$.outputMapCompoment(this);
			},
			_RegisterResize : function() {
			},
			_AddToTabPanel : function() {
				var parentDomId = this.$parent._GetComponentDomId();
				var tablePanel = $.getFromLayuiObjectHashMap(parentDomId);
				tablePanel.addTab(this._GetComponentDom());
			},
			_InitClientClassBuffer : function() {
				var buf = $.createStringBuffer();
				buf.append(" tab-pane fade in ");
				if (this.active == "true") {
					buf.append(" active ");
				}
				return buf;
			},
			_InitClientStyleBuffer : function() {
				var buf = $.createStringBuffer();
				buf.append(" height:100%;");
				return buf;
			}
		},
	})

	function Tab(domId) {
		this.domId = domId;
		this.title = "";
		this.active = "";
		this.appendCode = function(code) {
			this.getDom().empty();

			var $pre = $('<pre style="height:100%;border-top:0px;" ></pre>');
			$pre.append(code);
			this.getDom().append($pre);
		}
		this.getActive = function() {
			return this.active;
		}
		this.getDomId = function() {
			return this.domId;
		}
		this.getDom = function() {
			return $("#" + this.domId);
		}
		this.setActive = function(aActive) {
			this.active = aActive;
		}
		this.getTitle = function() {
			return this.title;
		}
		this.setTitle = function(aTitle) {
			this.title = aTitle;
		}

	}
})(jQuery);