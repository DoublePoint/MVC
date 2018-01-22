Vue.component(_ConstantComponentMap._FillLayOut, {
	props : [ 'id', 'height', 'width', 'backgroundcolor' ],
	template : '<ul class="layui-tab-title">'+ '<slot></slot>' +'</ul>',
	data : function() {
		
//		var varlayOutHeight=this.height;
//		if(varlayOutHeight==null)
//			varlayOutHeight='100%';
//		
//		var clientStyleBuffer=$._CreateStringBuffer();
//		
//		var heightBuffer=$._CreateStyleBuffer("height",varlayOutHeight);
//		clientStyleBuffer.append(heightBuffer.toString());
//		var widthBuffer=$._CreateStyleBuffer("width",'100%');
//		clientStyleBuffer.append(widthBuffer.toString());
//		if(this.backgroundcolor!=null){
//			var bgBuffer=$._CreateStyleBuffer("background-color",this.backgroundcolor);
//			clientStyleBuffer.append(bgBuffer.toString());
//		}
//		
//		var widthBuffer=$._CreateStringBuffer("width:")
//		return {
//			guid : $._GenerateUUID(),
//			clientStyle:clientStyleBuffer.toString(),
//			layOutHeight: varlayOutHeight,
//			layOutWidth : '100%'
//		}
	},
	created : function() {},
	mounted:function(){},
	methods : {
		_GetComponentDomId : function() {
			var _domId = this.id + this.guid;
			return _domId;
		},
		_GetComponentDom :function(){
			var domId = this._GetComponentDomId();
			var componentDom = $._GetFromLayuiObjectHashMap(domId);
			return componentDom;
		},
		_RegisterComponent : function() {
		},
		_AddDragDom : function(){
		},
		// 添加生命FillLayout对象脚本
		_MapComponent : function() {
		},
		_RegisterResize :function(){
		}
	},
})


function TablPanel(domId){
	this.domId=domId;
	this.getDomId=function(){
		return this.domId;
	}
	this.getDom = function() {
		return $("#" + this.domId);
	}
}