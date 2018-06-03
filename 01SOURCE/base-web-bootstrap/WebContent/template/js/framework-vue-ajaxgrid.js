var gridProps = [ // 私有的
"id", "datasource", "columns", "onpageclick",
// -----------
"classes", "sortClass", "height", "undefinedText", "striped", "sortName", "sortOrder", "sortStable", "iconsPrefix", "icons", "columns", "data", "ajax", "method", "url", "cache",
		"contentType", "dataType", "ajaxOptions", "queryParams", "queryParamsType", "responseHandler", "pagination", "paginationLoop", "onlyInfoPagination", "sidePagination",
		"pageNumber", "pageSize", "pageList", "selectItemName", "smartDisplay", "escape", "search", "searchOnEnterKey", "strictSearch", "searchText", "searchTimeOut",
		"trimOnSearch", "showHeader", "showFooter", "showColumns", "showRefresh", "showToggle", "showPaginationSwitch", "showFullscreen", "minimumCountColumns", "idField",
		"uniqueId", "cardView", "detailview", "detailFormatter", "searchAlign", "buttonsAlign", "toolbarAlign", "paginationVAlign", "paginationHAlign", "paginationDetailHAlign",
		"paginationPreText", "paginationNextText", "clickToSelect", "ignoreClickToSelectOn", "singleSelect", "toolbar", "buttonsToolbar", "checkboxHeader", "maintainSelected",
		"sortable", "silentSort", "rowStyle", "rowAttributes", "customSearch", "customSort"
		// 事件
		, "onAll", "onclickrow", "ondblclickrow", "onClickCell", "onDblClickCell", "onSort", "oncheck", "onUncheck", "onCheckAll", "onUncheckAll", "onCheckSome", "onUncheckSome",
		"onLoadSuccess", "onLoadError", "onColumnSwitch", "onColumnSearch", "onPageChange", "onSearch", "onToggle", "onPreBody", "onPostBody", "onPostHeader", "onexpandrow",
		"onCollapseRow", "onRefreshOptions", "onRefresh", "onScrollBody" ];
Vue
		.component(
				_LL_Constant._ConstantComponentMap._AjaxGrid,
				{
					props : gridProps,
					template : '<div style="height:100%;" class="table-responsive"><table class="bootstrapTable"  :id="gridId" ><thead><tr><slot></slot></tr></thead></table><div :id="pagerId"></div></div>',

					data : function() {
						var gridId = this.id + $.generateUUID();
						var pagerId = this.id + "laypageid";
						return {
							gridId : gridId,
							pagerId : pagerId
						}
					},
					mounted : function() {
						this._InitAjaxDataGridData();
						this._MapComponent();

					},
					created : function() {
						// 注册到系统map
						this._RegisterComponent();
						// // 注册该对象ID 以便在浏览器大小改变时重新计算其大小
						this._RegisterResizeMap();
					},
					methods : {
						_GetComponentDomId : function() {
							return this.gridId;
						},
						_GetComponentDom : function() {
							var grid = $.getFromLayuiObjectHashMap(this._GetComponentDomId());
							return grid;
						},
						_RegisterComponent : function() {
							var domId = this._GetComponentDomId();
							var ajaxDataGrid = new AjaxGrid(domId);
							for ( var attrName in ajaxDataGrid) {
								if (this[attrName] != null)
									ajaxDataGrid[attrName] = this[attrName];
							}
							$.addToLayuiObjectHashMap(domId, ajaxDataGrid);
						},
						_RegisterResizeMap : function() {
							$.registerResizeModel(this._GetComponentDom());
						},
						// 添加声明ajaxDataGrid对象脚本
						_MapComponent : function() {
							$.outputMapCompoment(this);
						},
						_InitAjaxDataGridData : function() {
							this._GetComponentDom().init();
						}

					},
				})

function AjaxGrid(domId) {
	this.domId = domId;
	this.pagerId = null;
	this.pageHeight = 32;
	this.onpageclick = null;
	this.cols = [ {
		checkbox : true,
		align : 'center'
	} ];
	this.datasource = "";
	this.datawrap = $.createAjaxDataWrap();
	this.height = 300;

	/* bootstrap */
	this.sortClass;
	this.height;
	this.undefinedText;
	this.striped;
	this.sortName;
	this.sortOrder;
	this.sortStable;
	this.iconsPrefix;
	this.icons;
	this.columns;
	this.data;
	this.ajax;
	this.method;
	this.url;
	this.cache;
	this.contentType;
	this.dataType;
	this.ajaxOptions;
	this.queryParams;
	this.queryParamsType;
	this.responseHandler;
	this.pagination;
	this.paginationLoop;
	this.onlyInfoPagination;
	this.sidePagination;
	this.pageNumber;
	this.pageSize;
	this.pageList;
	this.selectItemName;
	this.smartDisplay;
	this.escape;
	this.search;
	this.searchOnEnterKey;
	this.strictSearch;
	this.searchText;
	this.searchTimeOut;
	this.trimOnSearch;
	this.showHeader;
	this.showFooter;
	this.showColumns;
	this.showRefresh;
	this.showToggle;
	this.showPaginationSwitch;
	this.showFullscreen;
	this.minimumCountColumns;
	this.idField = "rowId";
	this.uniqueId = "rowId";
	this.cardView;
	this.detailview = null;
	this.detailFormatter;
	this.searchAlign;
	this.buttonsAlign;
	this.toolbarAlign;
	this.paginationVAlign;
	this.paginationHAlign;
	this.paginationDetailHAlign;
	this.paginationPreText;
	this.paginationNextText;
	this.clickToSelect;
	this.ignoreClickToSelectOn;
	this.singleSelect;
	this.toolbar;
	this.buttonsToolbar;
	this.checkboxHeader;
	this.maintainSelected;
	this.sortable;
	this.silentSort;
	this.rowStyle;
	this.rowAttributes;
	this.customSearch;
	this.customSort;

	/* 事件 */
	this.onAll;
	this.onclickrow = null;
	this.ondblclickrow = null;
	this.onClickCell;
	this.onDblClickCell;
	this.onSort;
	this.oncheck = null;
	this.onUncheck;
	this.onCheckAll;
	this.onUncheckAll;
	this.onCheckSome;
	this.onUncheckSome;
	this.onLoadSuccess;
	this.onLoadError;
	this.onColumnSwitch;
	this.onColumnSearch;
	this.onPageChange;
	this.onSearch;
	this.onToggle;
	this.onPreBody;
	this.onPostBody;
	this.onPostHeader;
	this.onexpandrow;
	this.onCollapseRow;
	this.onRefreshOptions;
	this.onRefresh;
	this.onScrollBody;

	this.addCol = function(col) {
		this.cols.push(col);
	}
	this.bindListener = function() {
		this.initEvent();
	}
	this.getCols = function() {
		return this.cols;
	}
	/* 丢弃formfield中属性为null的数据 因为会影响field的渲染 */
	this.getBootStrapCols = function() {
		var bootstrapColumns = [];
		var cols = this.cols;
		for ( var i in cols) {
			if (cols[i].getBoostrapField)
				bootstrapColumns.push(cols[i].getBoostrapField());
			else
				bootstrapColumns.push(cols[i]);
		}
		return bootstrapColumns;
	}
	this.getDataWrap = function(isGetData) {
		if (isGetData == null)
			isGetData = true;
		if (!isGetData) {
			var adw = $.createAjaxDataWrap();
			adw.pageInfo = this.datawrap.pageInfo;
			return adw;
		}
		return this.datawrap;
	}
	this.getDomId = function() {
		return this.domId;
	}
	this.getDom = function() {
		return $("#" + this.domId);
	}
	this.getOndblclickrow = function() {
		return this.ondblclickrow;
	}
	this.getOnPageClick = function() {
		return this.onpageclick;
	}
	this.getRow = function(rowIndex) {
		return this.datawrap.getRow(rowIndex);
	}
	this.getOnclickrow = function() {
		return this.onclickrow;
	}

	this.init = function() {
		this.initStyle();
		this.initData();
		this.initEvent();
	}
	this.initData = function() {
		if (this.datasource == null || this.datasource == "") {
			this.initBootstrapSetting();
			this.setPagerNull();
			return;
		}
		var grid = this;
		$.ajax({
			url : $$pageContextPath + this.datasource,
			type : "POST",
			contentType : 'application/json;charset=UTF-8',
			dataType : "json",
			data : JSON.stringify({}),
			async : false,
			success : function(ajaxDataWrap) {
				grid.datawrap.parse(ajaxDataWrap);
				grid.initBootstrapSetting(grid);
				grid.setPager(grid.datawrap.getPageInfo());
			},
			error : function() {
				grid.setLayuiTableDataNull();
			}
		});

		this.initBootstrapSetting();
	}
	this.initEvent = function() {

	}
	this.initStyle = function() {
		// 高度设置为获取父元素的高度
		var brotherHeight = 0;
		try {
			brotherHeight = this.getDom().closest(".ll-fill-area-tb,.ll-fill-area-lr").children('.panel-heading').outerHeight(true);
		} catch (e) {
			brotherHeight = 0;
		}
		var parentHeight = this.getDom().closest(".ll-fill-area-tb,.ll-fill-area-lr").get(0).offsetHeight;
		if (parentHeight == 0) {
			parentHeight = this.getDom().closest(".ll-fill-area-tb,.ll-fill-area-lr").height();
		}
		var thisResultHeight = parentHeight - brotherHeight;
		if (thisResultHeight <= _LL_Constant._ConstantAjaxDataGrid._DEFAULT_MIN_HEIGHT)
			thisResultHeight = _LL_Constant._ConstantAjaxDataGrid._DEFAULT_MIN_HEIGHT;
		this.height = thisResultHeight - this.pageHeight;
	}
	this.resize = function() {
		this.initStyle();
		var height = this.height;
		this.getDom().bootstrapTable('resetView', {
			height : height
		});
	}

	this.setCols = function(cols) {
		this.cols = cols;
	}
	this.setDataSource = function(ds) {
		this.datasource = ds;
	}
	this.setDataWrap = function(ajaxDataWrap) {
		if (ajaxDataWrap == null) {
			ajaxDataWrap = $.createAjaxDataWrap();
		}
		try {
			this.datawrap.parse(ajaxDataWrap);
			$("#" + this.domId).bootstrapTable('load', $._Clone(ajaxDataWrap.dataList));
		} catch (e) {
			console.log(e);
		}
		try {
			this.setPager(this.datawrap.getPageInfo());
		} catch (e) {
			console.log(e);
		}
	}
	this.initBootstrapSetting = function() {
		var ajaxgrid = this;
		var id = ajaxgrid.domId;
		var ajaxDataWrap = ajaxgrid.datawrap;
		var datasource = ajaxgrid.datasource;
		var columns = ajaxgrid.getBootStrapCols();
		var height = ajaxgrid.height;
		var $table = $("#" + id);
		$table.bootstrapTable({
			buttonsAlign : 'right',// 按钮对齐方式
			data : $._Clone(ajaxDataWrap.dataList),
			dataField : "dataList",// 这是返回的json数组的key.默认好像是"rows".这里只有前后端约定好就行
			height : height,
			idField : "rowId",
			columns : columns,
			showRefresh : false,
			sidePagination : "client",
			striped : true,
			uniqueId : "rowId",

			onCheck : function(row) {
				$._Eval(ajaxgrid.oncheck, row);
			},
			onClickRow : function(row, $element, field) {
				var arr = new Array();
				arr.push(row)
				arr.push($element);
				arr.push(field);
				$._Eval(ajaxgrid.getOnclickrow(), arr);
			},
			onDblClickRow : function(row, $element, field) {
				var arr = new Array();
				arr.push(row)
				arr.push($element);
				arr.push(field);
				$._Eval(ajaxgrid.getOndblclickrow(), arr);
			},
			onExpandRow : function() {

			},
			onLoadSuccess : function() {
			},
			onLoadError : function() {
			}
		});

		return null;
	}
	this.setLayuiTableDataNull = function() {
		var ajaxgrid = this;
		var id = ajaxgrid.domId;
		var $table = $("#" + id);
		$table.bootstrapTable({
			height : this.height
		});
	}
	this.setOndblClick = function(a) {
		this.ondblclickrow = a;
	}
	this.setPager = function(page) {
		if (page == null)
			return;
		var ajaxDataGrid = this;
		$("#" + this.domId).bootstrapTable('selectPage', page.currentPageNum);
		$laypage.render({
			elem : this.pagerId,
			count : page.totalElementCount,
			curr : page.currentPageNum,
			limit : page.pageSize,
			layout : [ 'prev', 'page', 'next', 'skip', 'count', 'limit' ],
			jump : function(obj, first) {
				if (!first) {
					var currentPageNum = obj.curr;
					var pageSize = obj.limit;
					ajaxDataGrid.getDataWrap().pageInfo.pageSize = pageSize;
					ajaxDataGrid.getDataWrap().pageInfo.currentPageNum = currentPageNum;
					if (ajaxDataGrid.getOnPageClick() != null)
						$._Eval(ajaxDataGrid.getOnPageClick());
				}
			}
		});
	}
	this.setPagerNull = function() {
		var page = {
			totalElementCount : 0,
			currentPageNum : 1,
			pageSize : 20
		}
		this.setPager(page);
	}

	/* bootstrap */
	// append
	this.addRecord = function(data) {
		var $table = $("#" + this.domId);
		var index = 0;
		try {
			index = this.datawrap.dataList.length;
		} catch (e) {
			index = 0;
		}
		$table.bootstrapTable('insertRow', {
			index : index,
			row : data
		});
	}
	this.addRecordBefore = function(data) {
		$table.bootstrapTable('insertRow', {
			index : 0,
			row : data
		});
	}
	this.addRecords = function(rows) {
		if (rows == null || rows.length == 0)
			return;
		for ( var i in rows)
			this.getDom().bootstrapTable('append', rows[i]);
	}
	this.addRecordsBefore = function(rows) {
		if (rows == null || rows.length == 0)
			return;
		for ( var i in rows)
			this.getDom().bootstrapTable('prepend', rows[i]);
	}

	// getData
	this.collectDataWrap = function(type) {
		if (type == "checked") {
			var wrap = $._Clone(this.getDataWrap());
			var dataList = this.getCheckedRecords();
			wrap.dataList = $._Clone(dataList);
			return wrap;
		} else if (type == "all") {
			var wrap = $._Clone(this.getDataWrap());
			var dataList = this.getDom().bootstrapTable('getData');
			;
			wrap.dataList = $._Clone(dataList);
			return wrap;
		} else {
			var wrap = $._Clone(this.getDataWrap());
			return wrap;
		}
	}
	this.checkAll = function() {
		var $table = $("#" + this.domId);
		return $table.bootstrapTable('checkAll');
	}
	this.check = function(index) {
		var $table = $("#" + this.domId);
		return $table.bootstrapTable('check', index);
	}
	this.createRecord = function() {
		var record = {};

		var cols = this.getCols();
		if (cols == null)
			return record;
		for (col in cols) {
			record[cols[col]["field"]] = "";
		}
		return record;
	}
	this.uncheckAll = function() {
		var $table = $("#" + this.domId);
		return $table.bootstrapTable('uncheckAll');
	}
	this.check = function(index) {
		var $table = $("#" + this.domId);
		return $table.bootstrapTable('uncheck', index);
	}
	// getSelections
	this.getCheckedRecords = function() {
		var $table = $("#" + this.domId);
		return $table.bootstrapTable('getSelections');
	}
	// getRowByUniqueId
	this.getRecord = function(rowNum) {
		var $table = $("#" + this.domId);
		return $table.bootstrapTable('getRowByUniqueId', rowNum);
	}
	this.remove = function(rowNum) {
		var $table = $("#" + this.domId);
		return $table.bootstrapTable('removeByUniqueId', rowNum);
	}
	this.removeAll = function() {
		var $table = $("#" + this.domId);
		return $table.bootstrapTable('removeAll');
	}
	this.updateRecord = function(obj, newRecord) {
		if ($.isNumber(obj)) {

		} else if ($.isObject(obj)) {
			obj = obj.rowId;
		}
		var $table = $("#" + this.domId);
		$table.bootstrapTable('updateRow', {
			index : obj,
			row : newRecord
		});
	}
	// removeByUniqueId
	this.removeChecked = function() {
		var checkDataList = this.getCheckedRecords();
		if (checkDataList == null || checkDataList.length <= 0)
			return;
		for ( var i in checkDataList) {
			// arr.push(checkDataList[i].rowId);
			this.getDom().bootstrapTable('removeByUniqueId', checkDataList[i].rowId);
		}
	}
	// load
	this.setData = function(dataList) {
		$("#" + this.domId).bootstrapTable('load', dataList);
	}
	// showAllColumns
	this.showAllColumns = function() {
		$("#" + this.domId).bootstrapTable('showAllColumns');
	}
	this.showColumn = function(field) {
		$("#" + this.domId).bootstrapTable('showColumn', field);
	}
	this.showRow = function(index) {
		var $table = $("#" + this.domId);
		$table.bootstrapTable('showRow', {
			index : index
		});
	}
	this.hideAllColumns = function() {
		$("#" + this.domId).bootstrapTable('hideAllColumns');
	}
	this.hideColumn = function(field) {
		$("#" + this.domId).bootstrapTable('hideColumn', field);
	}
	this.hideRow = function(index) {
		var $table = $("#" + this.domId);
		$table.bootstrapTable('hideRow', {
			index : index
		});
	}
	this.updateCell = function(index, field, value) {
		$("#" + this.domId).bootstrapTable('updateCell', {
			index : index,
			field : field,
			value : value
		});
	}
	return this;
}
