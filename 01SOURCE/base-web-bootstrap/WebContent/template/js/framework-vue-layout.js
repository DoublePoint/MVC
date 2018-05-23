Vue.component(_LL_Constant._ConstantComponentMap._FillLayOut, {
	props : [ 'id', 'height', 'width', 'backgroundcolor' ],
	template : '<div :id="id+guid" class="lllayout"  :style="clientStyle" ><slot></slot></div>',
	data : function() {
		
		var varlayOutHeight=this.height;
		if(varlayOutHeight==null)
			varlayOutHeight='100%';
		
		var clientStyleBuffer=$.createStringBuffer();
		
		var heightBuffer=$.createStyleBuffer("height",varlayOutHeight);
		clientStyleBuffer.append(heightBuffer.toString());
		var widthBuffer=$.createStyleBuffer("width",'100%');
		clientStyleBuffer.append(widthBuffer.toString());
		clientStyleBuffer.append("position:relative;");
		if(this.backgroundcolor!=null){
			var bgBuffer=$.createStyleBuffer("background-color",this.backgroundcolor);
			clientStyleBuffer.append(bgBuffer.toString());
		}
		
		var widthBuffer=$.createStringBuffer("width:")
		return {
			guid : $.generateUUID(),
			clientStyle:clientStyleBuffer.toString(),
			layOutHeight: varlayOutHeight,
			layOutWidth : '100%'
		}
	},
	created : function() {
		this._RegisterComponent();
		this._RegisterResize();
	},
	mounted:function(){
		this._MapComponent();
		//水平栅栏时用
		this._AddDragDom();
	},
	methods : {
		_GetComponentDomId : function() {
			var _domId = this.id + this.guid;
			return _domId;
		},
		_GetComponentDom :function(){
			var domId = this._GetComponentDomId();
			var componentDom = $.getFromLayuiObjectHashMap(domId);
			return componentDom;
		},
		_RegisterComponent : function() {
			var domId = this._GetComponentDomId();
			var _FillLayout = new FillLayout(domId);
			$.addToLayuiObjectHashMap(domId, _FillLayout);
		},
		_AddDragDom : function(){
			var dom=this._GetComponentDom();
			dom.addDrag();
		},
		// 添加生命FillLayout对象脚本
		_MapComponent : function() {
			$.outputMapCompoment(this);
		},
		_RegisterResize :function(){
			$.registerResizeModel(this._GetComponentDom());
		}
	},
})


function FillLayout(domId){
	this.domId=domId;
	this.getDomId=function(){
		return this.domId;
	}
	this.getDom = function() {
		return $("#" + this.domId);
	}
	this.layoutAreaItems = new Array();
	
	this.addLayoutAreaItem = function(item) {
		this.layoutAreaItems.push(item);
	}
	this.addDrag=function(){
		var layoutAreaItems=this.layoutAreaItems;
		for(var index in layoutAreaItems){
			if(index<layoutAreaItems.length-1){
				if(layoutAreaItems[index].addDragDom!=null)
					layoutAreaItems[index].addDragDom();
			}
		}
	}
	this.resize=function(){
		for(index in this.layoutAreaItems){
			if(this.layoutAreaItems[index].getIsResize())
				this.layoutAreaItems[index].resize();
		}
	}
}