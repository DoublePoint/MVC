var documentWriteHtml = "";
Vue.component(ConstantComponentMap._LayOutFieldV, {
	props : [ 'id', 'height', 'width', 'backgroundcolor' ],
	template : '<div :id="id+guid"  :style="\'width:\'+width+\'px;height:\'+height+\'px;background-color:\'+backgroundcolor+\';display:inline-block; \'"><slot></slot></div>',

	data : function() {
		return {
			guid : $._GenerateUUID()
		}
	},
	mounted : function() {
		var id = this._getAjaxDataGridDomId();
		var parentWidth = $("#" + id).parent().width();
		var parentheight = $("#" + id).parent().height();

		$("#" + id).height(parentheight);

		var children = $("#" + id).parent().children();
		if (children.length <= 0)
			return;
		$("#" + id).width(parentWidth / (children.length));
	},
	created : function() {
	},
	methods : {
		incrementCounter : function() {
		},
		_getAjaxDataGridDomId : function() {
			var _domId = this.id + this.guid;
			return _domId;
		}

	},
})
