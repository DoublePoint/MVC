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
		if(this.layOutHeight.toString().indexOf("px")!=-1)
			this.layOutHeight=this.layOutHeight;
		else if(this.layOutHeight.toString().indexOf("%")!=-1){
			this.layOutHeight=this.layOutHeight;
		}
		else if(this.layOutHeight.toString().indexOf("*")!=-1){
			var allChildFixHeight=0;
			for(var i=0;i<children.length;i++){
				if(children[i].id!=id){
					allChildFixHeight+=children[i].scrollHeight;
				}
			}
			this.layOutHeight=(parentheight-allChildFixHeight).toString()+"px";
		}
		
		$("#" + id).width("100%");

	},
	created : function() {
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
