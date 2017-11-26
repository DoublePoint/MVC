var documentWriteHtml = "";
Vue.component(ConstantComponentMap._LayOutFieldH, {
	props : [ 'id', 'height', 'width', 'backgroundcolor' ],
	template : '<div  :id="id+guid" :style="\'width:\'+layOutWidth+\';height:\'+layOutHeight+\';background-color:\'+backgroundcolor+\';\'"><slot></slot></div>',

	data : function() {
		return {
			guid : $._GenerateUUID(),
			layOutHeight: this.height,
			layOutWidth : this.width
		}
	},
	mounted : function() {
		var id = this._getDomId();
		var parentWidth = $("#" + id).parent().width();
		var parentheight = $("#" + id).parent().height();
		var children = $("#" + id).parent().children();
		if (children.length <= 0)
			return;
		this.layOutHeight=100/ (children.length)+"%";
		this.layOutWidth='100%';
//		var id = this._getAjaxDataGridDomId();
//		var parentWidth = $("#" + id).parent().width();
//		var parentheight = $("#" + id).parent().height();

//		$("#" + id).width(parentWidth);
//

	},
	created : function() {
//		var id = this._getAjaxDataGridDomId();
//		var parentWidth = $("#" + id).parent().width();
//		var parentheight = $("#" + id).parent().height();
//		
//		this.height=parentheight;
//		this.width=parentWidth;
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
