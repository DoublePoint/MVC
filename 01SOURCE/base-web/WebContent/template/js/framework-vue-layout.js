var documentWriteHtml = "";
Vue.component(_ConstantComponentMap._LayOut, {
	props : [ 'id', 'height', 'width', 'backgroundcolor' ],
	template : '<div :id="id+guid" class="lllayout "  :style="\'width:\'+layOutWidth+\';height:\'+layOutHeight+\';background-color:\'+backgroundcolor+\';\'"><slot></slot></div>',
	data : function() {
		var varlayOutHeight=this.height;
		if(varlayOutHeight==null)
			varlayOutHeight='100%';
		return {
			guid : $._GenerateUUID(),
			layOutHeight: varlayOutHeight,
			layOutWidth : '100%'
		}
	},
	created : function() {
		this._addFillLayoutToMap();
	},
	mounted:function(){
		this._addDefineFillLayoutObjectScript();
	},
	methods : {
		incrementCounter : function() {
		},
		_getDomId : function() {
			var _domId = this.id + this.guid;
			return _domId;
		},
		_addFillLayoutToMap : function() {
			var domId = this._getDomId();
			var _FillLayout = new FillLayout(domId);
			$._AddToLayuiObjectHashMap(domId, _FillLayout);
		},
		// 添加生命FillLayout对象脚本
		_addDefineFillLayoutObjectScript : function() {
			var domId = this._getDomId();
			var $script = $('<script type="text/javascript"></script>');
			$script.append('var ' + this.id + '=$._GetFromLayuiObjectHashMap("' + domId + '");');
			documentWriteHtml = $script.prop("outerHTML");
			$("body").append(documentWriteHtml);
		}
	},
})


function FillLayout(id){
	this.id=id;
	this.resize=function(){
		
	}
}