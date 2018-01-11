Vue.component(_ConstantComponentMap._LayOut, {
	props : [ 'id', 'height', 'width', 'backgroundcolor' ],
	template : '<div :id="id+guid" class="lllayout "  :style="clientStyle"><slot></slot></div>',
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
		
		var widthBuffer=$._CreateStringBuffer("width:")
		return {
			guid : $._GenerateUUID(),
			clientStyle:clientStyleBuffer.toString(),
			layOutHeight: varlayOutHeight,
			layOutWidth : '100%'
		}
	},
	created : function() {
		this._RegisterComponent();
	},
	mounted:function(){
		this._MapComponent();
	},
	methods : {
		_GetComponentDomId : function() {
			var _domId = this.id + this.guid;
			return _domId;
		},
		_RegisterComponent : function() {
			var domId = this._GetComponentDomId();
			var _FillLayout = new FillLayout(domId);
			$._AddToLayuiObjectHashMap(domId, _FillLayout);
		},
		// 添加生命FillLayout对象脚本
		_MapComponent : function() {
			$._OutputMapCompoment(this);
//			var documentWriteHtml = "";
//			var domId = this._GetComponentDomId();
//			var $script = $('<script type="text/javascript"></script>');
//			$script.append('var ' + this.id + '=$._GetFromLayuiObjectHashMap("' + domId + '");');
//			documentWriteHtml = $script.prop("outerHTML");
//			$("body").append(documentWriteHtml);
		}
	},
})


function FillLayout(id){
	this.id=id;
	this.resize=function(){
		
	}
}