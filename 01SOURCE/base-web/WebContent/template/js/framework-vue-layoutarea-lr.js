Vue.component(_ConstantComponentMap._FillAreaLR, {
	props : [ 'id', 'width', 'backgroundcolor' ],
	template : '<div :id="id+guid" class="ll-fill-area-lr" style="display:none;"><slot></slot>' + '</div>',

	data : function() {
		var varlayOutWidth = this.width;
		if (varlayOutWidth == null)
			varlayOutWidth = '100%';
		var clientStyleBuffer = $._CreateStringBuffer();
		var widthBuffer = $._CreateStyleBuffer("width", varlayOutWidth);
		clientStyleBuffer.append(widthBuffer.toString());
		var heightBuffer = $._CreateStyleBuffer("height", '100%');
		clientStyleBuffer.append(heightBuffer.toString());
		if (this.backgroundcolor != null) {
			var bgBuffer = $._CreateStyleBuffer("background-color", this.backgroundcolor);
			clientStyleBuffer.append(bgBuffer.toString());
		}

		return {
			guid : $._GenerateUUID(),
			clientStyle : clientStyleBuffer.toString(),
			layOutWidth : varlayOutWidth,
			layareacenter : "center"
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
			var componentDom = $._GetFromLayuiObjectHashMap(domId);
			return componentDom;
		},
		_RegisterComponent : function() {
			var domId = this._GetComponentDomId();
			var fillArea = new FillAreaLR(domId);
			$._AddToLayuiObjectHashMap(domId, fillArea);

			for ( var attrName in fillArea) {
				if (this[attrName] != null)
					fillArea[attrName] = this[attrName];
			}
		},
		// 将本标签作为ajaxform的一个属性
		_AddToParent : function() {
			if (this.$parent == null)
				return;
			var _FillArea = this._GetComponentDom();
			var layoutDomId = this.$parent._GetComponentDomId();
			var layout = $._GetFromLayuiObjectHashMap(layoutDomId);
			layout.addLayoutAreaItem(_FillArea);
		},
		// 添加生命FillArea对象脚本
		_MapComponent : function() {
			$._OutputMapCompoment(this);
		}
	},
})

function FillAreaLR(domId) {
	this.domId = domId;
	this.height = 0;
	this.width = null;
	this.isResize = true;
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
	this.show=function(){
		this.getDom().show();
	}
//	this.addDrag = function() {
//		$("#" + dragId + "").draggable({
//			axis : "x",
//			helper : "clone",
//			containment : "parent",
//			stop : function(event, ui) {
//				var dragLeft = ui.offset.left;
//				var dragId = ui.helper.context.id;
//				var preBrotherId = $("#" + dragId).prev().attr("id");
//				var layoutarea = $._GetFromLayuiObjectHashMap(preBrotherId);
//				layoutarea.resize();
//			}
//		});
//	}
	/* 添加拖动按钮 */
	this.addDragDom = function() {
		var left = this.getDom().width() + this.getDom().position().left;
		var dragId = this.domId + this.getDragDomExtendId();
		var dragStyleStringBuffer = $._CreateStringBuffer("left", left);
		this.getDom().after('<div id="' + dragId + '" style="' + dragStyleStringBuffer.toString() + '"  class="draggable ll-fill-area-left-right-center" ></div>');
	}
	this.resize = function() {
		var parentWidth = this.getParent().width();
		//		var parentWidth = this.getParent().offsetWidth;
		var varWidth = 0;
		if (this.width == null)
			varWidth = _ConstantLayoutArea._DEFAULT_MIN_WIDTH_LEFT;
		else if (this.width.toString().indexOf("px") != -1)
			varWidth = this.width.replace("px", "");
		else if (this.width.toString().indexOf("%") != -1) {
			var widthPercent = this.width.replace("%", "");
			varWidth = parentWidth * (widthPercent / 100);
		} else if (this.width.toString().indexOf("*") != -1) {
			var allChildFixWidth = 0;
			var children = this.getBrothers();
			for (var i = 0; i < children.length; i++) {
				if (children[i].id != this.id) {
					allChildFixWidth += children[i].offsetWidth;
				}
			}
			varWidth = parentWidth - allChildFixWidth;
		} else {
			var allChildFixWidth = 0;
			var children = this.getBrothers();
			for (var i = 0; i < children.length; i++) {
				if (children[i].id != this.id) {
					allChildFixWidth += children[i].offsetWidth;
				}
			}
			varWidth = parentWidth - allChildFixWidth;
		}
		this.setFillAreaWidth(varWidth);
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
		var nextBrother=this.getNextBrother();
		nextBrother.css("left", left+varWidth);
		
	}
}
