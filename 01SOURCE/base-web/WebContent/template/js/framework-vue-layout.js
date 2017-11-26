var documentWriteHtml = "";
Vue.component(ConstantComponentMap._LayOut, {
	props : [ 'id', 'height', 'width', 'backgroundcolor' ],
	template : '<div :id="id+guid" :style="\'width:\'+layOutWidth+\'px;height:\'+layOutHeight+\'px;background-color:\'+backgroundcolor+\';\'"><slot></slot></div>',

	data : function() {
		return {
			guid : $._GenerateUUID(),
			layOutHeight: this.height,
			layOutWidth : this.width
		}
	},
	created : function() {
	
	},
	mounted:function(){
		var id = this._getDomId();
		var parent = $("#" + id).parent();
		var parentWidth = $("#" + id).parent().width();
		var parentheight = $("#" + id).parent().height();

		this.layOutHeight = parentheight;
		this.layOutWidth = parentWidth;
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
