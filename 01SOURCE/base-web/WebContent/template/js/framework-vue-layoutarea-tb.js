Vue.component(_ConstantComponentMap._FillAreaTB, {
	props : [ 'id', 'height',  'backgroundcolor' ],
	template : '<div  :id="id+guid" class="layoutarea" :style="clientStyle"><slot></slot></div>',

	data : function() {
		var varlayOutHeight=this.height;
		if(varlayOutHeight==null)
			varlayOutHeight='100%';
		var clientStyleBuffer=$._CreateStringBuffer();
		var heightBuffer=$._CreateStyleBuffer("height",varlayOutHeight);
		clientStyleBuffer.append(heightBuffer.toString());
		var widthBuffer=$._CreateStyleBuffer("width",'100%');
		clientStyleBuffer.append(widthBuffer.toString());
		if(this.backgroundcolor!=null){
			var bgBuffer=$._CreateStyleBuffer("background-color",this.backgroundcolor);
			clientStyleBuffer.append(bgBuffer.toString());
		}
		
		return {
			guid : $._GenerateUUID(),
			clientStyle:clientStyleBuffer.toString(),
			layOutHeight: varlayOutHeight,
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
		
		/*var id = this._GetComponentDomId();
		var parentWidth = $("#" + id).parent().width();
		var parentheight = $("#" + id).parent().height();
		var children = $("#" + id).parent().children();
		if (children.length <= 0)
			return;
		if (this.layOutHeight.toString().indexOf("px") != -1)
			this.layOutHeight = this.layOutHeight;
		else if (this.layOutHeight.toString().indexOf("%") != -1) {
			this.layOutHeight = this.layOutHeight;
		} else if (this.layOutHeight.toString().indexOf("*") != -1) {
			var allChildFixHeight = 0;
			for (var i = 0; i < children.length; i++) {
				if (children[i].id != id) {
					allChildFixHeight += children[i].offsetHeight;
				}
			}
			this.layOutHeight = (parentheight - allChildFixHeight).toString() + "px";
		}
		$("#" + id).width("100%");*/
	},
	methods : {
		_GetComponentDomId : function() {
			var _domId = this.id + this.guid;
			return _domId;
		},
		_GetLayoutAreaX :function(){
			var domId = this._GetComponentDomId();
			var aLayoutArea = $._GetFromLayuiObjectHashMap(domId);
			return aLayoutArea;
		},
		_RegisterComponent : function() {
			var domId = this._GetComponentDomId();
			var _FillArea = new FillAreaTB(domId);
			$._AddToLayuiObjectHashMap(domId, _FillArea);
			
			// 注册该对象ID 以便在浏览器大小改变时重新计算其大小
			if (this.layOutHeight.toString().indexOf("*") != -1) {
				_FillArea.setIsResize(true);
			}
		},
		// 将本标签作为ajaxform的一个属性
		_AddToParent : function() {
			var _FillArea = this._GetLayoutAreaX();
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

function FillAreaTB(domId) {
	this.domId = domId;
	this.height = 0;
	this.isResize=false;
	
	this.getDomId=function(){
		return this.domId;
	}
	this.getDom = function() {
		return $("#" + this.domId);
	}
	this.getBrother=function(){
		return this.getDom().parent().children();
	}
	this.getLayout=function(){
		return this.getDom().parent();
	}
	this.getLayoutWidth=function(){
		return this.getDom().parent().width();
	}
	this.getLayoutHeight=function(){
		return this.getDom().parent().height();
	}
	this.getIsResize=function(){
		return this.isResize;
	}
	
	this.setFillAreaHeight=function(height){
		this.getDom().height(height);
	}
	this.setFillAreaWidth=function(width){
		this.getDom().width(width);
	}
	this.setIsResize=function(aIsResize){
		this.isResize=aIsResize;
	}
	this.resize = function() {
		var parentWidth = this.getLayoutWidth();
		var parentheight = this.getLayoutHeight();
		var children = this.getBrother();
		if (children.length <= 0)
			return;
		var allChildFixHeight = 0;
		for (var i = 0; i < children.length; i++) {
			if (children[i].id != this.domId) {
				allChildFixHeight += children[i].offsetHeight;
			}
		}
		var thisRuleHright=parentheight - allChildFixHeight;
		if(thisRuleHright<_ConstantLayoutArea._DEFAULT_MIN_HEIGHT)
			thisRuleHright=_ConstantLayoutArea._DEFAULT_MIN_HEIGHT;
		
		this.setFillAreaHeight(thisRuleHright);
		this.setFillAreaWidth("100%");
	}
}
