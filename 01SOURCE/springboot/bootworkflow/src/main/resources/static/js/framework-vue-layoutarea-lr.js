(function($) {
	Vue.component(_LL_Constant._ConstantComponentMap._FillAreaLR, {
		props : [ 'id', 'width', 'backgroundcolor', 'dragenable',"showborder" ],
		template : '<div :id="id+guid" class="ll-fill-area-lr"  :style="clientStyle"><slot></slot>' + '</div>',

		data : function() {
			var varlayOutWidth = this.width;
			if (varlayOutWidth == null || varlayOutWidth == "")
				varlayOutWidth = '100%';
			var clientStyleBuffer = $.createStringBuffer();
			var widthBuffer = $.createStyleBuffer("width", varlayOutWidth);
			clientStyleBuffer.append(widthBuffer.toString());
			var heightBuffer = $.createStyleBuffer("height", '100%');
			clientStyleBuffer.append(heightBuffer.toString());
			if (this.backgroundcolor != null) {
				var bgBuffer = $.createStyleBuffer("background-color", this.backgroundcolor);
				clientStyleBuffer.append(bgBuffer.toString());
			}

			return {
				guid : $.generateUUID(),
				clientStyle : clientStyleBuffer.toString(),
				layOutWidth : varlayOutWidth
			}
		},
		created : function() {
			this._RegisterComponent();
		},
		beforeMount : function() {
			// 添加到父dom中
			this._AddToParent();
		},
		mounted : function() {
			this._MapComponent();

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
				var fillArea = new _LL_Model.FillAreaLR(domId);
				$.addToLayuiObjectHashMap(domId, fillArea);

				for ( var attrName in fillArea) {
					if (this[attrName] != null)
						fillArea[attrName] = this[attrName];
				}
				// 注册该对象ID 以便在浏览器大小改变时重新计算其大小
				if (this.layOutWidth.toString().indexOf("*") != -1) {
					fillArea.setIsResize(true);
				}
			},
			// 将本标签作为ajaxform的一个属性
			_AddToParent : function() {
				if (this.$parent == null)
					return;
				var _FillArea = this._GetComponentDom();
				var layoutDomId = this.$parent._GetComponentDomId();
				var layout = $.getFromLayuiObjectHashMap(layoutDomId);
				layout.addLayoutAreaItem(_FillArea);
			},
			// 添加生命FillArea对象脚本
			_MapComponent : function() {
				$.outputMapCompoment(this);
			}
		},
	})

	_LL_Model.FillAreaLR = function(domId) {
		this.domId = domId;
		this.height = 0;
		this.width = null;// width属性 初始值 即40px 50% *
		this.currentWidth = 0;// 实际的width 全是以px结束
		this.isResize = true;
		this.dragenable = false;
		this.dragDomExtendId = "drag";

		this.getDomId = function() {
			return this.domId;
		}
		this.getDom = function() {
			return $("#" + this.domId);
		}
		this.getAllPreBrotherWidth = function() {
			var allPreBrother = this.getDom().prevAll();
			var allPreBrotherWidth = 0;
			for (index in allPreBrother) {
				allPreBrotherWidth += allPreBrother.width();
			}
			return allPreBrotherWidth;
		}
		this.getDragDomExtendId = function() {
			return this.dragDomExtendId;
		}
		this.getParent = function() {
			return this.getDom().parent();
		}
		this.getPreBrother = function() {
			return this.getDom().prev();
		}
		this.getNextBrother = function() {
			return this.getDom().next();
		}
		this.getLayout = function() {
			return this.getDom().parent();
		}
		this.getLayoutWidth = function() {
			return this.getDom().parent().width();
		}
		this.getLayoutHeight = function() {
			return this.getDom().parent().height();
		}
		this.getBrothers = function() {
			return this.getDom().parent().children();
		}
		this.getIsResize = function() {
			return this.isResize;
		}
		this.setFillAreaHeight = function(height) {
			this.getDom().height(height);
		}
		this.setFillAreaWidth = function(width) {
			this.getDom().width(width);
		}
		this.setIsResize = function(aIsResize) {
			this.isResize = aIsResize;
		}
		this.show = function() {
			this.getDom().show();
		}
		this.hide = function() {
			this.getDom().hide();
		}
		/* 添加拖动按钮 */
		this.addDragDom = function() {
//			var left = this.getDom().width() + this.getDom().position().left;
//			var dragId = this.domId + this.getDragDomExtendId();
//			var dragStyleStringBuffer = $.createStringBuffer("left", left);
//			var parentHeight = this.getParent().height();
//			dragStyleStringBuffer.append("height:" + parentHeight + "px;");
//			this.getDom().after(
//					'<div id="' + dragId + '" style="' + dragStyleStringBuffer.toString()
//							+ '"  class="draggable ll-fill-area-left-right-center" ><div class="ll-drag-to-left"></div>');
//			if (this.dragenable) {
//				$("#" + dragId).draggable({
//					axis : "x",
//					cursor : "w-resize",
//					helper : "clone",
//					containment : "parent",
//					stop : function(event, ui) {
//						var dragId = ui.helper.context.id;
//						var drag = new _LL_Model.LayoutDrag(dragId);
//						drag.resize(ui);
//					}
//				});
//			}
		}
		this.resize = function() {
			this.hide();
			var parentWidth = this.getParent().width();
			var parentHeight = this.getParent().height();
			var varWidth = 0;
			if (this.width == null)
				varWidth = _LL_Constant._ConstantLayoutArea._DEFAULT_MIN_WIDTH_LEFT;
			else if (this.width.toString().indexOf("px") != -1)
				varWidth = parseInt(this.width.replace("px", ""));
			else if (this.width.toString().indexOf("%") != -1) {
				var widthPercent = this.width.replace("%", "");
				varWidth = parentWidth * (widthPercent / 100);
				// varWidth=this.width;
			} else if (this.width.toString().indexOf("*") != -1) {
				var allChildFixWidth = 0;
				var children = this.getBrothers();
				for (var i = 0; i < children.length; i++) {
					if (children[i].id != this.domId) {
						allChildFixWidth += children[i].offsetWidth;
					}
				}
				varWidth = parentWidth - allChildFixWidth;
			} else {
				varWidth = this.width;
			}
			this.setFillAreaWidth(varWidth);
			this.setFillAreaHeight(parentHeight);
			var preBrother = this.getPreBrother();
			var left = 0;
			// 判断是否是第一个子节点
			if (preBrother.attr("id") != null) {
				preBrotherWidth = preBrother.width();
				preBrotherLeft = preBrother.position().left;
				left = preBrotherWidth + preBrotherLeft;
			}
			this.getDom().css("left", left);
			this.show();
			var nextBrother = this.getNextBrother();
			nextBrother.css("left", left + varWidth);
			this.show();
		}
	};

	_LL_Model.LayoutDrag = function(domId) {
		this.width = 2;
		this.domId = domId;
		this.height = '100%';
		this.currentWidth = 0;
		this.isResize = true;
		this.getWidth = function() {
			return this.width;
		}
		this.setWidth = function(aWidth) {
			this.width = aWidth;
		}
		this.getDomId = function() {
			return this.domId
		}
		this.getDom = function() {
			return $("#" + this.getDomId());
		}
		this.setDomId = function(aDomId) {
			this.domId = aDomId;
		}
		this.getCurrentWidth = function() {
			return this.currentWidth;
		}
		this.setCurrentWidth = function(aCurrentWidth) {
			this.currentWidth = aCurrentWidth;
		}
		this.getHeight = function() {
			return this.height;
		}
		this.setHeight = function(aHeight) {
			this.height = aHeight;
		}
		this.getIsResize = function() {
			return this.isResize;
		}
		this.setIsResize = function(aIsResize) {
			this.isResize = aIsResize;
		}
		this.resize = function(ui) {
			var dragCurrentLeft = ui.offset.left;
			this.move(dragCurrentLeft);
		}
		this.getPreDrag = function() {
			return this.getDom().prevAll(".draggable");
		}
		this.move = function(dragCurrentLeft) {
			var dragId = this.domId;
			var beforeDragLeft = $("#" + dragId).position().left;
			var preLayoutArea = $("#" + dragId).prev();
			var preLayoutAreaLeft = preLayoutArea.position().left;
			var preLayoutWidth = dragCurrentLeft - preLayoutAreaLeft;
			preLayoutArea.css("width", preLayoutWidth);// 前一个layoutarea的宽度等于
														// 后一个drag的左-前一个的left

			$("#" + dragId).css("left", dragCurrentLeft);

			var nextLayoutArea = $("#" + dragId).next();
			var nextLayoutBeforeWidth = nextLayoutArea.width();
			var nextLayoutCurrentWidth = beforeDragLeft - dragCurrentLeft + nextLayoutBeforeWidth;
			var nextLayoutCurrentLeft = dragCurrentLeft + $("#" + dragId).width();

			nextLayoutArea.css("width", nextLayoutCurrentWidth);
			nextLayoutArea.css("left", nextLayoutCurrentLeft);
		}
		this.moveLeft = function() {
			var preDrag = this.getPreDrag();
			if (preDrag.attr("id") == null)
				this.move(0);
			else {
				this.move(preDrag.position().left);
			}
		}
		this.moveRight = function() {
			var dragId = this.domId;
			var parentWidth = $("#" + dragId).parent().width();
			var dragLeft = parentWidth - $("#" + dragId).width();
			this.move(dragLeft);
		}
	};

})(jQuery);
