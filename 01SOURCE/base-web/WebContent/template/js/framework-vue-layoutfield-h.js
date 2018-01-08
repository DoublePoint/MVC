var documentWriteHtml = "";
Vue.component(_ConstantComponentMap._LayOutFillArea, {
	props : [ 'id', 'height', 'width', 'backgroundcolor' ],
	template : '<div  :id="id+guid" class="layoutarea" :style="\'width:\'+layOutWidth+\';overflow:auto;height:\'+layOutHeight+\';background-color:\'+backgroundcolor+\';\'"><slot></slot></div>',

	data : function() {
		return {
			guid : $._GenerateUUID(),
			layOutHeight : this.height,
			layOutWidth : this.width
		}
	},
	mounted : function() {
		this._AddDefineObjectScript();
		
		var id = this._GetDomId();
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
//					allChildFixHeight += children[i].scrollHeight;
					allChildFixHeight += children[i].offsetHeight;
				}
			}
			this.layOutHeight = (parentheight - allChildFixHeight).toString() + "px";
		}

		$("#" + id).width("100%");

	},
	created : function() {
		this._AddFillAreaToMap();

	},
	methods : {
		incrementCounter : function() {
		},
		_GetDomId : function() {
			var _domId = this.id + this.guid;
			return _domId;
		},
		_AddFillAreaToMap : function() {
			var domId = this._GetDomId();
			var _FillArea = new FillArea(domId);
			$._AddToLayuiObjectHashMap(domId, _FillArea);
			
			// 注册该对象ID 以便在浏览器大小改变时重新计算其大小
			if (this.layOutHeight.toString().indexOf("*") != -1) {
				$._RegisterResizeModel(_FillArea);
			}
		},
		// 添加生命FillArea对象脚本
		_AddDefineObjectScript : function() {
			var domId = this._GetDomId();
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
//				allChildFixHeight += children[i].scrollHeight;
				allChildFixHeight += children[i].offsetHeight;
			}
		}
//		this.layOutHeight = (parentheight - allChildFixHeight).toString() + "px";
		var thisRuleHright=parentheight - allChildFixHeight;
		if(thisRuleHright<_ConstantLayoutArea._DEFAULT_MIN_HEIGHT)
			thisRuleHright=_ConstantLayoutArea._DEFAULT_MIN_HEIGHT;
		$("#" + this.id).height(thisRuleHright);
		$("#" + id).width("100%");
	}
}
