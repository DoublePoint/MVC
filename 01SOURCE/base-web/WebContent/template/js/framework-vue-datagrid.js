var documentWriteHtml = "";
Vue.component(_ConstantComponentMap._AjaxDataGrid, {
	props : [ 'id', 'datasource', 'columns', 'onrowclick', 'onpageclick' ],
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
			ajaxDataGrid.pageId = this.laypage + this.guid;
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
				success : function(ajaxDataWrap) {
					_ajaxdatagrid.setDataWrap(ajaxDataWrap);
				}
			});

			// 定义rowClick
			var onrowclickFunction = this.onrowclick;
			if (onrowclickFunction != null) {
				_ajaxdatagrid.setRowClickFunctionName(onrowclickFunction);
				$table.on('tool(' + this._getAjaxDataGridDomId() + ')', function(obj) {
					if (onrowclickFunction == null)
						return;
					var data = obj.datawrap;
					$._Eval(onrowclickFunction, data);
				});
			}

			var pageclickFunction = this.onpageclick;
			if (pageclickFunction != null) {
				_ajaxdatagrid.setPageClickFunctionName(pageclickFunction);
			}
		}

	},
})

function AjaxDataGrid(domId) {
	this.id = domId;
	this.pageId = 0;
	this.pageHeight = 32;
	this.onRowClickFunctionName = null;
	this.onPageClickFunctionName = null;
	this.cols = [ [ {
		type : 'numbers'
	}, {
		type : 'checkbox'
	} ] ];
	this.datasource = "";
	this.datawrap = new $._AjaxDataWrap();
	this.height = 300;
	this.init = function(msg) {
		this.setData();
	};
	this.setDataSource = function(ds) {
		this.datasource = ds;
	};
	this.getDataWrap = function(isGetData) {
		if (isGetData == null)
			isGetData = true;
		if (!isGetData) {
			var adw = new $._AjaxDataWrap();
			adw.pageInfo = this.datawrap.pageInfo;
			return adw;
		}
		return this.datawrap;
	}
	this.setDataWrap = function(ajaxDataWrap) {
		this.datawrap.parse(ajaxDataWrap);
		this.render();
	};
	this.setPageClickFunctionName = function(funName) {
		this.onPageClickFunctionName = funName;
	};
	this.getPageClickFunctionName = function() {
		return this.onPageClickFunctionName;
	};
	this.setRowClickFunctionName = function(funName) {
		this.onRowClickFunctionName = funName;
	};
	this.getRowClickFunctionName = function() {
		return this.onRowClickFunctionName;
	};
	this.render = function() {
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
		this.height = thisResultHeight - this.pageHeight;
		$._SetLayuiTableData(this);
		this.setPager(this.datawrap.getPageInfo(), this.id);
	};
	this.setPager = function(page, ajaxDataGridId) {
		if (page == null)
			return;
		$laypage.render({
			elem : this.pageId,
			count : page.totalElementCount,
			curr : page.currentPageNum,
			limit : page.pageSize,
			layout : [ 'prev', 'page', 'next', 'skip', 'count', 'limit' ],
			jump : function(obj, first) {
				if (!first) {
					var currentPageNum = obj.curr;
					var pageSize = obj.limit;
					var ajaxDataGrid = $._GetFromLayuiObjectHashMap(ajaxDataGridId);
					ajaxDataGrid.getDataWrap().pageInfo.pageSize = pageSize;
					ajaxDataGrid.getDataWrap().pageInfo.currentPageNum = currentPageNum;
					// console.log("curnum"+curnum);
					// console.log("limitcount"+limitcount);
					// layer.msg(curnum+"-"+limitcount);
					// productsearch(productGroupId, curnum, limitcount);
					// retrieveAjaxDataGrid();
					$._Eval(ajaxDataGrid.getPageClickFunctionName());

				}
			}
		});
	}
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
		this.height = thisResultHeight - this.pageHeight;
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

	this.getCheckedDataList = function() {
		var checkStatus = $table.checkStatus(this.id), checkedData = checkStatus.data;
		return checkedData;
	}
	return this;
}

function AjaxDataGridColumns(field, title, width, sort, fixed, event) {
	this.field = field;
	this.title = title;
	this.event = "CLICK";
	this.templet = null;
	this.width = width == null ? _ConstantAjaxDataGrid._DEFAULT_COLUMN_WIDTH : width;
	this.sort = sort == null ? _ConstantAjaxDataGrid._DEFAULT_COLUMN_SORT : sort;
	this.fixed = fixed == null ? _ConstantAjaxDataGrid._DEFAULT_COLUMN_FIXED : fixed;

	this.setTemplet = function(tem) {
		this.templet = tem;
	}
	return this;
}
