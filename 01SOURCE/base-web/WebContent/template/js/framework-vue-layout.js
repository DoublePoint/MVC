var documentWriteHtml = "";
Vue.component(ConstantComponentMap._LayOut, {
	props : [ 'id', 'height', 'width', 'backgroundcolor' ],
	template : '<div :id="id+guid" class="lllayout" :style="\'width:\'+layOutWidth+\';height:\'+layOutHeight+\';background-color:\'+backgroundcolor+\';\'"><slot></slot></div>',
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
	
	},
	mounted:function(){
	},
	methods : {
		incrementCounter : function() {
		},
		_getDomId : function() {
			var _domId = this.id + this.guid;
			return _domId;
		}

	},
})
