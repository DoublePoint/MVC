var documentWriteHtml = "";
Vue.component(_ConstantComponentMap._AjaxDataGrid, {
	props : [ 'id', 'datasource', 'columns', 'onrowclick' ],
	template : '<div><table  :lay-filter="id+guid"  :id="id+guid" v-on:click="incrementCounter"><slot></slot></table><div :id="laypage+guid"></div></div>',

	data : function() {
		var dataList;
		return {
			guid : $._GenerateUUID(),
			laypage : "laypageid"
		}
	},
	mounted : function() {
		this._initAjaxDataGridData();
		this._addDefineAjaxDataGridObjectScript();

	},
	created : function() {
		this._addAjaxDataGridToMap();
	},
	methods : {
		incrementCounter : function() {
		},
		_addAjaxDataGridToMap : function() {
			var domId = this._getAjaxDataGridDomId();
			var ajaxDataGrid = new AjaxDataGrid(domId);
			$._AddToLayuiObjectHashMap(domId, ajaxDataGrid);

			// 注册该对象ID 以便在浏览器大小改变时重新计算其大小
			$._RegisterResizeModel(ajaxDataGrid);
		},
		// 添加生命ajaxDataGrid对象脚本
		_addDefineAjaxDataGridObjectScript : function() {
			var domId = this._getAjaxDataGridDomId();
			var $script = $('<script type="text/javascript"></script>');
			$script.append('var ' + this.id + '=$._GetFromLayuiObjectHashMap("' + domId + '");');
			$script.append(this.id + '.datasource="' + this.datasource + '";');
			documentWriteHtml = $script.prop("outerHTML");
			$("body").append(documentWriteHtml);
		},
		_getAjaxDataGridDomId : function() {
			var _domId = this.id + this.guid;
			return _domId;
		},
		_initAjaxDataGridData : function() {
			var cd = {};
			var domId = this._getAjaxDataGridDomId();
			var _ajaxdatagrid = $._GetFromLayuiObjectHashMap(domId);
			$.ajax({
				url : $$pageContextPath + this.datasource,
				type : "POST",
				contentType : 'application/json;charset=UTF-8',
				dataType : "json",
				data : JSON.stringify(cd),
				async : false,
				success : function(data) {
					_ajaxdatagrid.setData(data);
				},
				error : function() {
					alert("error");
				}
			});

			// 定义rowClick
			var str = this.onrowclick
			$table.on('tool(' + this._getAjaxDataGridDomId() + ')', function(obj) {
				if (str == null)
					return;
				var data = obj.data;
				$._Eval(str, data);
			});

			$laypage.render({
				elem : this.laypage+this.guid,
				count : 1000,
				curr : 2,
				limit : 100,
				layout : [ 'prev', 'page', 'next', 'skip', 'count', 'limit' ],
				jump : function(obj, first) {
					if (!first) {
						curnum = obj.curr;
						limitcount = obj.limit;
						// console.log("curnum"+curnum);
						// console.log("limitcount"+limitcount);
						// layer.msg(curnum+"-"+limitcount);
						productsearch(productGroupId, curnum, limitcount);
					}
				}
			});
		}

	},
})

function AjaxDataGrid(domId) {
	this.id = domId;
	this.pageHeight=32;
	this.cols = [ [ {
		type : 'numbers'
	}, {
		type : 'checkbox'
	} ] ];
	this.datasource = "";
	this.data = null;
	this.height = 300;
	this.init = function(msg) {
		this.setData();
	};
	this.setDataSource = function(ds) {
		this.datasource = ds;
	}
	this.setData = function(data) {
		this.data = data;
		var parentHeight = $("#" + this.id).parent().height();
		var allChildFixHeight = 0;
		var brother = $("#" + this.id).parent().parent().children();
		var parentId = $("#" + this.id).parent()[0].id;
		for (var i = 0; i < brother.length; i++) {
			if (brother[i].id != parentId) {
				allChildFixHeight += brother[i].scrollHeight;
			}
		}
		var thisResultHeight = $("#" + this.id).parent().parent().height() - allChildFixHeight;
		this.height = thisResultHeight-this.pageHeight;
		$._SetLayuiTableData(this);
	};
	this.resize = function() {
		var parentHeight = $("#" + this.id).parent().height();
		var allChildFixHeight = 0;
		var brother = $("#" + this.id).parent().parent().children();
		var parentId = $("#" + this.id).parent()[0].id;
		for (var i = 0; i < brother.length; i++) {
			if (brother[i].id != parentId) {
				allChildFixHeight += brother[i].scrollHeight;
			}
		}
		var thisResultHeight = $("#" + this.id).parent().parent().height() - allChildFixHeight;
		if (thisResultHeight <= _ConstantAjaxDataGrid._DEFAULT_MIN_HEIGHT)
			thisResultHeight = _ConstantAjaxDataGrid._DEFAULT_MIN_HEIGHT;
		this.height = thisResultHeight-this.pageHeight;
		$._SetLayuiTableData(this);
	}
	this.setCols = function(cols) {
		this.cols = cols;
	};
	this.addCol = function(col) {
		this.cols[0].push(col);
	}
	this.test = function() {
		alert("测试成功");
	}
	return this;
}

function AjaxDataGridColumns(field, title, width, sort, fixed, event) {
	this.field = field;
	this.title = title;
	this.event = "CLICK";
	this.width = width == null ? _ConstantAjaxDataGrid._DEFAULT_COLUMN_WIDTH : width;
	this.sort = sort == null ? _ConstantAjaxDataGrid._DEFAULT_COLUMN_SORT : sort;
	this.fixed = fixed == null ? _ConstantAjaxDataGrid._DEFAULT_COLUMN_FIXED : fixed;

	return this;
}
