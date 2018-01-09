Vue.component(_ConstantComponentMap._AjaxForm, {
	props : [ 'id', 'onrowclick', 'cols', 'colproportion' ],
	template : '<form class="layui-form " :id="id+guid" action=""><slot></slot></form>',

	data : function() {
		return {
			guid : $._GenerateUUID()
		}
	},
	mounted : function() {
		this._MapComponent();
		this._RefreshForm();
		// 调整完成之后显示
		// this._Show();
	},
	created : function() {
		this._RegisterComponent();
	},
	methods : {
		_RegisterComponent : function() {
			var domId = this._GetComponentDomId();
			var ajaxForm = new AjaxForm(domId);
			for ( var attrName in ajaxForm) {
				if (this[attrName] != null)
					ajaxForm[attrName] = this[attrName];
			}
			// ajaxForm.cols = this.cols;
			$._AddToLayuiObjectHashMap(domId, ajaxForm);

		},
		// 添加生命ajaxDataGrid对象脚本
		_MapComponent : function() {
			var documentWriteHtml = "";
			var domId = this._GetComponentDomId();
			var $script = $('<script type="text/javascript"></script>');
			$script.append('var ' + this.id + '=$._GetFromLayuiObjectHashMap("' + domId + '");');
			documentWriteHtml = $script.prop("outerHTML");
			$("body").append(documentWriteHtml);
		},
		_GetComponentDomId : function() {
			var _domId = this.id + this.guid;
			return _domId;
		},
		_RefreshForm : function() {
			var domId = this._GetComponentDomId();
			var _Ajaxform = $._GetFromLayuiObjectHashMap(domId);
			_Ajaxform.refresh();
		},
		_Show : function() {
			var domId = this._GetComponentDomId();
			var _Ajaxform = $._GetFromLayuiObjectHashMap(domId);
			_Ajaxform.show();
		}
	},
})

function AjaxForm(domId) {
	this.domId = domId;
	this.colproportion = "";
	this.cols = "100";

	this.formItems = new Array();
	this.formLines = new Array();
	this.setCols = function(cols) {
		this.cols = cols;
	}
	this.getCols = function() {
		return this.cols;
	}
	this.getDom = function() {
		return $("#" + this.domId);
	}
	this.setData = function(data) {

	}

	this.getFormItems = function(item) {
		return this.formItems;
	}
	/**
	 * 设置字段值
	 */
	this.setFieldValue = function(name, value) {
		var items = this.formItems;
		for (var i = 0; i < items.length; i++) {
			if (items[i].field == name) {
				items[i].setData(value);
				return;
			}
		}
	}
	this.addFormItem = function(item) {
		var isNextLine = false;
		var formLinesLength = this.formLines.length;
		var formLine;
		if (formLinesLength <= 0) {
			formLine = new AjaxFormLine();
			this.formLines.push(formLine);
		} else
			formLine = this.formLines[formLinesLength - 1];
		// 获取当前行的所有元素所占列数 一个字段算一列
		var totalColspan = formLine.getTotalColspan();
		var colspan = item.getColspan();

		if (totalColspan + colspan > this.cols) {
			isNextLine = true;
		}

		if (isNextLine) {
			formLine = new AjaxFormLine();
			formLine.push(item);
			this.formLines.push(formLine);
		} else {
			formLine.push(item);
		}
		this.formItems.push(item);
	}
	this.refresh = function() {
		var formLines = this.formLines;
		var colproportion = this.colproportion;
		var cols = this.cols;
		var parentWidth = this.getDom().width();
//		this.getDom().parent().width(this.getDom().parent().width());
		for (index in this.formLines) {
			var start = cols * 2 * index;
			var end = start + cols * 2;
			formLines[index].generateToOneLine(colproportion.replace("：", ":").split(":").slice(start, end), parentWidth);
		}
		this.show();
	}
	this.show = function() {
		this.getDom().show();
	}
	this.showField = function(name) {
		var items = this.formItems;
		for (var i = 0; i < items.length; i++) {
			if (items[i].field == name) {
				items[i].show();
				return;
			}
		}
	}
	this.hideField = function(name, isLeaveLocation) {
		var items = this.formItems;
		for (var i = 0; i < items.length; i++) {
			if (items[i].field == name) {
				items[i].hide(isLeaveLocation);
				return;
			}
		}
	}
	return this;
}
function AjaxFormLine() {
	this.rowIndex = 0;
	this.formItems = new Array();

	this.getTotalColspan = function() {
		var totalColspan = 0;
		var formItems = this.formItems;
		for (index in formItems) {
			// 显示为true的才计算
			if ((formItems[index].getVisible() + "").toLowerCase() == "true") {
				totalColspan += parseInt(formItems[index].getColspan());
			}
		}
		return totalColspan;
	}
	// 自动将该Line下的所有数据转变成一行 即添加div
	this.generateToOneLine = function(lineColproportion, parentWidth) {
		parentWidth = parentWidth - 17;// 预留出滚动条的误差
		parentWidth = Math.floor(parentWidth * 100) / 100
		var formItems = this.formItems;
		if (formItems.length > 0)
			formItems[0].addLineStart();
		if (lineColproportion == null || lineColproportion.length <= 0)
			return;
		var totalWidthPercent = 0;
		for ( var index in lineColproportion) {
			totalWidthPercent += parseInt(lineColproportion[index]);
		}
		var i = 0;
		var start = 0;
		var end = 0;
		for ( var index in formItems) {
			if ((formItems[index].getVisible() + "").toLowerCase() == "true") {
				var colspan = formItems[index].getColspan();
				start = end;
				end = start + colspan * 2;
				var labelwidth = null;
				var inputwidth = null;
				if (start <= lineColproportion.length - 1) {
					labelwidth = lineColproportion[start] / totalWidthPercent;
				} else
					return;
				var inputPer=0;
				if (end <= lineColproportion.length) {
					//例如1:1:2:2  则label:1 input: 1+2+2
					for(var i=start+1;i<end;i++){
						inputPer+=parseInt(lineColproportion[i]);
					}
					inputwidth = inputPer / totalWidthPercent;
				} else
					return;
				var inputLineWidth = labelwidth * parentWidth + inputwidth * parentWidth;
				var sliceArr=[lineColproportion[start],inputPer];
				formItems[index].setWidthByColproportion(inputLineWidth, sliceArr);
			}
		}
	}

	this.push = function(item) {
		this.formItems.push(item);
	}
}
