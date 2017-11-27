var documentWriteHtml = "";
Vue.component(ConstantComponentMap._LayOutFieldH, {
	props : [ 'id', 'height', 'width', 'backgroundcolor' ],
	template : '<div  :id="id+guid" :style="\'width:\'+layOutWidth+\';height:\'+layOutHeight+\';background-color:\'+backgroundcolor+\';\'"><slot></slot></div>',

	data : function() {
		return {
			guid : $._GenerateUUID(),
			layOutHeight : this.height,
			layOutWidth : this.width
		}
	},
	mounted : function() {
		this._addDefineObjectScript();
		
		var id = this._getDomId();
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
					allChildFixHeight += children[i].scrollHeight;
				}
			}
			this.layOutHeight = (parentheight - allChildFixHeight).toString() + "px";
		}

		$("#" + id).width("100%");

	},
	created : function() {
		this._addFillAreaToMap();

	},
	methods : {
		incrementCounter : function() {
		},
		_getDomId : function() {
			var _domId = this.id + this.guid;
			return _domId;
		},
		_addFillAreaToMap : function() {
			var domId = this._getDomId();
			var _FillArea = new FillArea(domId);
			$._AddToLayuiObjectHashMap(domId, _FillArea);
			
			// 注册该对象ID 以便在浏览器大小改变时重新计算其大小
			if (this.layOutHeight.toString().indexOf("*") != -1) {
				$._RegisterResizeModel(_FillArea);
			}
		},
		// 添加生命FillArea对象脚本
		_addDefineObjectScript : function() {
			var domId = this._getDomId();
			var $script = $('<script type="text/javascript"></script>');
			$script.append('var ' + this.id + '=$._GetFromLayuiObjectHashMap("' + domId + '");');
			documentWriteHtml = $script.prop("outerHTML");
			$("body").append(documentWriteHtml);
		}

	},
})

function FillArea(id) {
	this.id = id;
	this.resize = function() {
		var parentWidth = $("#" + this.id).parent().width();
		var parentheight = $("#" + this.id).parent().height();
		var children = $("#" + this.id).parent().children();
		if (children.length <= 0)
			return;
		var allChildFixHeight = 0;
		for (var i = 0; i < children.length; i++) {
			if (children[i].id != this.id) {
				allChildFixHeight += children[i].scrollHeight;
			}
		}
//		this.layOutHeight = (parentheight - allChildFixHeight).toString() + "px";
		var thisRuleHright=parentheight - allChildFixHeight;
		if(thisRuleHright<ConstantLayoutArea.DEFAULT_MIN_HEIGHT)
			thisRuleHright=ConstantLayoutArea.DEFAULT_MIN_HEIGHT;
		$("#" + this.id).height(thisRuleHright);
		$("#" + id).width("100%");
	}
}
