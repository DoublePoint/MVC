Vue.component(_ConstantComponentMap._AjaxForm, {
	props : [ 'id', 'onrowclick', 'cols', 'colproportion' ],
	template : '<form class="layui-form " :id="id+guid"  action=""><slot ></slot></form>',

	data : function() {
		return {
			guid : $._GenerateUUID()
		}
	},
	beforeMount : function() {
		var domId = this._GetComponentDomId();
		var _Ajaxform = $._GetFromLayuiObjectHashMap(domId);
		var a = 1;
		var b = a;
	},
	mounted : function() {
		this._MapComponent();
		this._RefreshForm();
		
		//初始化各个子标签的事件 例如文本改变时 设置该弹出窗口为未保存
		this._InitChanged();
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
			$._AddToLayuiObjectHashMap(domId, ajaxForm);

		},
		// 添加生命ajaxDataGrid对象脚本
		_MapComponent : function() {
			$._OutputMapCompoment(this);
		},
		_GetComponentDomId : function() {
			var _domId = this.id + this.guid;
			return _domId;
		},
		_InitChanged : function(){
			var domId = this._GetComponentDomId();
			var _Ajaxform = $._GetFromLayuiObjectHashMap(domId);
			_Ajaxform.initChanged();
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
	this.colproportion = "1:3:1:3:1:3:1:3:1:3";
	this.cols = "100";
	this.data={};
	this.formItems = new Array();
	this.formLines = new Array();
	this.isChanged=false;
	this.setCols = function(cols) {
		this.cols = cols;
	}
	this.getCols = function() {
		return this.cols;
	}
	this.getData = function(){
		var obj=this.data;
		if(obj==null)
			obj={};
		if(this.formItems==null) return null;
		for(index in this.formItems){
			var field=this.formItems[index].getField();
			var data=this.formItems[index].getData();
			if(field!=null&&field!="")
				obj[field]=data;
		}
		return obj;
	}
	this.getDom = function() {
		return $("#" + this.domId);
	}
	this.getFieldItem= function(itemId){
		for(index in this.formItems){
			var field=this.formItems[index];
			if( itemId==field.getDomId())
				return field;
		}
	}
	this.setData = function(data) {

	}
	this.setIsChanged = function(aIsChanged){
		this.isChanged=aIsChanged;
	}
	
	this.getFormItems = function(item) {
		return this.formItems;
	}
	this.getIsChanged = function(){
		return this.isChanged;
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
	this.addLine = function() {
		for (index in this.formLines) {
			this.formLines[index].createLine();
		}
	}
	this.refresh = function() {
		var formLines = this.formLines;
		var colproportion = this.colproportion;
		var cols = this.cols;
		// this.getDom().parent().width(this.getDom().parent().width());
		for (index in this.formLines) {
			// var start = cols * 2 * index;
			var start = 0;
			var end = cols * 2;//读取的是一行的colproportion
			var formLineColproportionArr = colproportion.replace("：", ":").split(":").slice(start, end);

			if (formLineColproportionArr == null || formLineColproportionArr.length == 0)
				formLineColproportionArr = [ 1, 1 ];
			else if (formLineColproportionArr.length == 1)
				formLineColproportionArr.push(formLineColproportionArr[0]);
			formLines[index].generateToOneLine(formLineColproportionArr);
		}
	}
	this.resize = function() {
		this.refresh();
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
	this.show = function() {
		this.getDom().css("display", "block");
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
	this.initChanged=function(){
		var obj=this;
		this.getDom().find("input").bind("blur",function(){
			var fieldId=$(this).attr("id");
			var fieldItem=obj.getFieldItem(fieldId);
			if(fieldItem.getData()!=fieldItem.getInputVal())
				$._SetNotSaveIcon();
		});
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
	this.createLine = function() {
		var formItems = this.formItems;
		if (formItems.length > 0)
			formItems[0].addLineStart();
	}
	// 自动将该Line下的所有数据转变成一行 即添加div
	this.generateToOneLine = function(lineColproportion) {
		var formItems = this.formItems;
		if (formItems.length > 0)
			formItems[0].addLineStart();
		if (lineColproportion == null || lineColproportion.length <= 0)
			return;
		var totalWidthPercent = 0;//所有colporprotion比例的总和入1:3:1:3  则为8
		for ( var index in lineColproportion) {
			totalWidthPercent += parseInt(lineColproportion[index]);
		}
		var i = 0;
		var start = 0;
		var end = 0;
		for ( var index in formItems) {
			if ((formItems[index].getVisible() + "").toLowerCase() == "true") {
				var colspan = formItems[index].getColspan();
				start = end;//每个一个字段对应的数组的开始 也就是上一个字段的结束
				end = start + colspan * 2;
				var labelwidthPercent = null;
				var inputwidthPercent = null;
				if (start <= lineColproportion.length - 1) {
					labelwidthPercent = lineColproportion[start] / totalWidthPercent;
				} else
					return;
				var inputPer = 0;
				if (end <= lineColproportion.length) {
					// 例如1:1:2:2 则label:1 input: 1+2+2
					for (var i = start + 1; i < end; i++) {
						inputPer += parseInt(lineColproportion[i]);
					}
					inputwidthPercent = inputPer / totalWidthPercent;
				} else
					return;
				var inputLineWidthPercent=labelwidthPercent+inputwidthPercent;//当前字段占总行的百分比
				//对于同一个字段 将label:input:label:input 组装成label:(input+label+input) 如1:3:1:3-->1:(3+1+3)
				var sliceArr = [ lineColproportion[start], inputPer ];
				formItems[index].setWidthByColproportion(inputLineWidthPercent, sliceArr);
			}
		}
	}

	this.push = function(item) {
		this.formItems.push(item);
	}
}
