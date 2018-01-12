Vue.component(_ConstantComponentMap._FillAreaLR, {
	props : [ 'id', 'width', 'backgroundcolor' ],
	template : 
		'<div :id="id+guid" class="ll-fill-area-lr"><slot></slot>' 
		+ '</div>',

	data : function() {
		var varlayOutWidth = this.Width;
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
			layareacenter:"center"
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
		this._InitLayoutArea();
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
		_GetLayoutAreaX : function() {
			var domId = this._GetComponentDomId();
			var aLayoutArea = $._GetFromLayuiObjectHashMap(domId);
			return aLayoutArea;
		},
		_InitLayoutArea : function() {
			var layoutAreaDom=this._GetComponentDom();
			layoutAreaDom.resize();
		},
		_RegisterComponent : function() {
			var domId = this._GetComponentDomId();
			var fillArea = new FillAreaTB(domId);
			$._AddToLayuiObjectHashMap(domId, fillArea);

			for ( var attrName in fillArea) {
				if (this[attrName] != null)
					fillArea[attrName] = this[attrName];
			}
//			// 注册该对象ID 以便在浏览器大小改变时重新计算其大小
//			if (this.layOutHeight.toString().indexOf("*") != -1) {
//				fillArea.setIsResize(true);
//			}
		},
		// 将本标签作为ajaxform的一个属性
		_AddToParent : function() {
			var _FillArea = this._GetLayoutAreaX();
			var layoutDomId = this.$parent._GetComponentDomId();
			var layout = $._GetFromLayuiObjectHashMap(layoutDomId);
			layout.addLayoutAreaItem(_FillArea);
			_FillArea.addDragDom();
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
	this.isResize=true;
	this.getDomId = function() {
		return this.domId;
	}
	this.getDom = function() {
		return $("#" + this.domId);
	}
	this.getAllPreBrotherWidth=function(){
		var allPreBrother=this.getDom().prevAll(); 
		var allPreBrotherWidth=0;
		for(index in allPreBrother){
			allPreBrotherWidth+=allPreBrother.width();
		}
		return allPreBrotherWidth;
	}
	this.getParent=function(){
		return this.getDom().parent();
	}
	this.getNextBrother=function(){
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
	this.getBrother = function() {
		return this.getDom().parent().children();
	}
	this.getIsResize=function(){
		return this.isResize;
	}
	this.setFillAreaHeight = function(height) {
		this.getDom().height(height);
	}
	this.setFillAreaWidth = function(width) {
		this.getDom().width(width);
	}
	this.setIsResize=function(aIsResize){
		this.isResize=aIsResize;
	}
	/*添加拖动按钮*/
	this.addDragDom = function(){
		var dragId=this.domId+"layareacenter";
		var layarea=this;
		this.getDom().after('<div id="'+dragId+'"  class="draggable ll-fill-area-left-right-center" ></div>');
		$("#"+dragId+"").draggable({
			axis : "x",
			helper : "clone",
			containment : "parent",
			stop : function(event, ui) {
				var dragLeft = ui.offset.left;
				var dragId=ui.helper.context.id;
				var preBrotherId=$("#"+dragId).prev().attr("id");
				var layoutarea = $._GetFromLayuiObjectHashMap(preBrotherId);
				layarea.resize();
//				
////				ui.helper.context.id
//				var allPreBrother=$("#"+dragId+"").prevAll(); 
//				var allPreBrotherWidth=0;
//				for(index in allPreBrother){
//					allPreBrotherWidth+=allPreBrother.width();
//				}
//				
//				var parentWidth = $("#"+dragId+"").parent().width();
//				var centerWidth = $("#"+dragId+"").width();
//				/* var left = $("#center_div").position().left; */
//				var left = ui.offset.left;
//				var right = parentWidth - allPreBrotherWidth - centerWidth;
//
//				$("#left_div").width(left);
//				$("#right_div").width(right);
//
//				$("#right_div").offset({
//					left : left + centerWidth
//				});
//				$("#center_div").offset({
//					left : left
//				});
			}
		});
	}
	this.resize = function() {
		var allPreBrotherWidth=this.getAllPreBrotherWidth();
//		var children = this.getBrother();
		var nextBrother=this.getNextBrother();
		var nextBrotherLeft=nextBrother.position().left;
		this.setFillAreaWidth(nextBrotherLeft-allPreBrotherWidth);
		this.getDom().css("left",0);
	}
//	this.resize = function() {
//		var parentWidth = this.getLayoutWidth();
//		var parentheight = this.getLayoutHeight();
//		var children = this.getBrother();
//		if (children.length <= 0)
//			return;
//		var allChildFixHeight = 0;
//		for (var i = 0; i < children.length; i++) {
//			if (children[i].id != this.domId) {
//				allChildFixHeight += children[i].offsetHeight;
//			}
//		}
//		var thisRuleHright = parentheight - allChildFixHeight;
//		if (thisRuleHright < _ConstantLayoutArea._DEFAULT_MIN_HEIGHT)
//			thisRuleHright = _ConstantLayoutArea._DEFAULT_MIN_HEIGHT;
//
//		this.setFillAreaHeight(thisRuleHright);
//		this.setFillAreaWidth("100%");
//	}
}
