var gridProps=["classes"
                ,"sortClass"
                ,"height"
                ,"undefinedText"
                ,"striped"
                ,"sortName"
                ,"sortOrder"
                ,"sortStable"
                ,"iconsPrefix"
                ,"icons"
                ,"columns"
                ,"data"
                ,"ajax"
                ,"method"
                ,"url"
                ,"cache"
                ,"contentType"
                ,"dataType"
                ,"ajaxOptions"
                ,"queryParams"
                ,"queryParamsType"
                ,"responseHandler"
                ,"pagination"
                ,"paginationLoop"
                ,"onlyInfoPagination"
                ,"sidePagination"
                ,"pageNumber"
                ,"pageSize"
                ,"pageList"
                ,"selectItemName"
                ,"smartDisplay"
                ,"escape"
                ,"search"
                ,"searchOnEnterKey"
                ,"strictSearch"
                ,"searchText"
                ,"searchTimeOut"
                ,"trimOnSearch"
                ,"showHeader"
                ,"showFooter"
                ,"showColumns"
                ,"showRefresh"
                ,"showToggle"
                ,"showPaginationSwitch"
                ,"showFullscreen"
                ,"minimumCountColumns"
                ,"idField"
                ,"uniqueId"
                ,"cardView"
                ,"detailView"
                ,"detailFormatter"
                ,"searchAlign"
                ,"buttonsAlign"
                ,"toolbarAlign"
                ,"paginationVAlign"
                ,"paginationHAlign"
                ,"paginationDetailHAlign"
                ,"paginationPreText"
                ,"paginationNextText"
                ,"clickToSelect"
                ,"ignoreClickToSelectOn"
                ,"singleSelect"
                ,"toolbar"
                ,"buttonsToolbar"
                ,"checkboxHeader"
                ,"maintainSelected"
                ,"sortable"
                ,"silentSort"
                ,"rowStyle"
                ,"rowAttributes"
                ,"customSearch"
                ,"customSort"
                //事件
                ,"onAll"
                ,"onClickRow"
                ,"onDblClickRow"
                ,"onClickCell"
                ,"onDblClickCell"
                ,"onSort"
                ,"oncheck"
                ,"onUncheck"
                ,"onCheckAll"
                ,"onUncheckAll"
                ,"onCheckSome"
                ,"onUncheckSome"
                ,"onLoadSuccess"
                ,"onLoadError"
                ,"onColumnSwitch"
                ,"onColumnSearch"
                ,"onPageChange"
                ,"onSearch"
                ,"onToggle"
                ,"onPreBody"
                ,"onPostBody"
                ,"onPostHeader"
                ,"onExpandRow"
                ,"onCollapseRow"
                ,"onRefreshOptions"
                ,"onRefresh"
                ,"onScrollBody"
                //私有的
                ,"id"
                ,"datasource"
                ,"columns",
                "onrowclick"];
Vue.component(_ConstantComponentMap._AjaxDataGrid, {
	props : gridProps,
	template : '<div style="height:100%;"><table  :id="gridId" data-checkbox="true"><thead><tr><slot></slot></tr></thead></table><div :id="pagerId"></div></div>',

	data : function() {
		var gridId=this.id+$._GenerateUUID();
		var pagerId=this.id+"laypageid";
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
		//注册到系统map
		this._RegisterComponent();
		//// 注册该对象ID 以便在浏览器大小改变时重新计算其大小
		this._RegisterResizeMap();
	},
	methods : {
		_GetComponentDomId : function() {
			return this.gridId;
		},
		_GetComponentDom : function(){
			var grid = $._GetFromLayuiObjectHashMap(this._GetComponentDomId());
			return grid;
		},
		_RegisterComponent : function() {
			var domId = this._GetComponentDomId();
			var ajaxDataGrid = new AjaxDataGrid(domId);
			for ( var attrName in ajaxDataGrid) {
				if (this[attrName] != null)
					ajaxDataGrid[attrName] = this[attrName];
			}
			$._AddToLayuiObjectHashMap(domId, ajaxDataGrid);
		},
		_RegisterResizeMap: function(){
			$._RegisterResizeModel(this._GetComponentDom());
		},
		// 添加声明ajaxDataGrid对象脚本
		_MapComponent : function() {
			$._OutputMapCompoment(this);
		},
		_InitAjaxDataGridData : function() {
			this._GetComponentDom().init();
		}

	},
})

function AjaxDataGrid(domId) {
	this.domId = domId;
	this.pagerId = null;
	this.pageHeight = 32;
	this.ondblclick = null;
	this.onrowclick = null;
	this.onpageclick = null;
	this.cols = [];
	this.datasource = "";
	this.datawrap = $._CreateAjaxDataWrap();
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
	this.idField;
	this.uniqueId;
	this.cardView;
	this.detailView;
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
	this.onClickRow;
	this.onDblClickRow;
	this.onClickCell;
	this.onDblClickCell;
	this.onSort;
	this.oncheck=null;
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
	this.onExpandRow;
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
	this.getCheckedDataList = function() {
		var $table = $("#" + this.domId);
		return $table.bootstrapTable('getSelections');
	}
	this.getCols = function() {
		return this.cols;
	}
	this.getDataWrap = function(isGetData) {
		if (isGetData == null)
			isGetData = true;
		if (!isGetData) {
			var adw = new $._CreateAjaxDataWrap();
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
	this.getOndblclick = function() {
		return this.ondblclick;
	}
	this.getPageClick = function() {
		return this.onpageclick;
	};
	this.getRow = function(rowIndex) {
		return this.datawrap.getRow(rowIndex);
	};
	this.getRowClick = function() {
		return this.onrowclick;
	};

	this.init = function() {
		this.initData();
		this.initEvent();
	};
	this.initData = function(){
		var data={};
		var grid=this;
		$.ajax({
			url : $$pageContextPath + this.datasource,
			type : "POST",
			contentType : 'application/json;charset=UTF-8',
			dataType : "json",
			data : JSON.stringify(data),
			async : false,
			success : function(ajaxDataWrap) {
				grid.setDataWrap(ajaxDataWrap);
			},
			error:function(){
				grid.setLayuiTableDataNull();
			}
		});

		
	};
	this.initEvent = function() {
		//分页点击事件
		var pageclickFunction = this.onpageclick;
		if (pageclickFunction != null) {
			_Ajaxdatagrid.setPageClickFunctionName(pageclickFunction);
		}
	};
	this.render = function() {

		// 高度设置为获取父元素的高度
		var thisResultHeight = this.getDom().closest(".layoutarea").height();
		if (thisResultHeight <= _ConstantAjaxDataGrid._DEFAULT_MIN_HEIGHT)
			thisResultHeight = _ConstantAjaxDataGrid._DEFAULT_MIN_HEIGHT;
		this.height = thisResultHeight - this.pageHeight;
		this.setLayuiTableData(this);
		this.setPager(this.datawrap.getPageInfo(), this.id);
	};
	this.resize = function() {
		// 高度设置为获取父元素的高度
		var thisResultHeight = this.getDom().closest(".layoutarea").height();
		if (thisResultHeight <= _ConstantAjaxDataGrid._DEFAULT_MIN_HEIGHT)
			thisResultHeight = _ConstantAjaxDataGrid._DEFAULT_MIN_HEIGHT;
		this.height = thisResultHeight - this.pageHeight;
		var height = this.height;
		this.getDom().bootstrapTable('resetView', {
			height : height
		});
	}

	this.setCols = function(cols) {
		this.cols = cols;
	};
	this.setDataSource = function(ds) {
		this.datasource = ds;
	};
	this.setDataWrap = function(ajaxDataWrap) {
		this.datawrap.parse(ajaxDataWrap);
		this.render();
	};
	this.setLayuiTableData = function() {
		var ajaxgrid = this;
		var id = ajaxgrid.domId;
		var ajaxDataWrap = ajaxgrid.datawrap;
		var datasource = ajaxgrid.datasource;
		var cols = ajaxgrid.cols;
		var height = ajaxgrid.height;
		var $table = $("#" + id);
		$table.bootstrapTable({
			height : height,
			data : $._Clone(ajaxDataWrap.dataList),
			onCheck:function(row){
				$._Eval(ajaxgrid.oncheck,row);
			},
			onClickRow : function(row, $element, field) {
				var arr = new Array();
				arr.push(row)
				arr.push($element);
				arr.push(field);
				$._Eval(ajaxgrid.getRowClick(), arr);
			}
		});
		return null;
	};
	this.setLayuiTableDataNull = function (){
		var ajaxgrid = this;
		var id = ajaxgrid.domId;
		var $table = $("#" + id);
		$table.bootstrapTable({
			height : this.height
		});
	}
	this.setOndblclick = function(aOnDblclick) {
		this.ondblclick = aOnDblclick;
	}
	this.setPageClickFunctionName = function(funName) {
		this.onPageClickFunctionName = funName;
	};
	this.setPager = function(page, ajaxDataGridId) {
		if (page == null)
			return;
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
					var ajaxDataGrid = $._GetFromLayuiObjectHashMap(ajaxDataGridId);
					ajaxDataGrid.getDataWrap().pageInfo.pageSize = pageSize;
					ajaxDataGrid.getDataWrap().pageInfo.currentPageNum = currentPageNum;
					$._Eval(ajaxDataGrid.getPageClickFunctionName());
				}
			}
		});
	}
	this.setRowClickFunctionName = function(funName) {
		this.onRowClickFunctionName = funName;
	};
	
	/*bootstrap*/
	this.addRecords = function(rows){
		if(rows==null||rows.length==0)
			return;
		for(var i in rows)
			this.getDom().bootstrapTable('append', rows[i]);
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

	/* bootstrap */
	this.radio;
	this.checkbox;
	this.field;
	this.title;
	this.titleTooltip;
	this.class;
	this.rowspan;
	this.colspan;
	this.align;
	this.halign;
	this.falign;
	this.valign;
	this.width;
	this.sortable;
	this.order;
	this.visible;
	this.cardVisible;
	this.switchable;
	this.clickToSelect;
	this.formatter;
	this.footerFormatter;
	this.events;
	this.sorter;
	this.sortName;
	this.cellStyle;
	this.searchable;
	this.searchFormatter;
	this.escape;
	this.showSelectTitle;
	
	
	this.setTemplet = function(tem) {
		this.templet = tem;
	}
	return this;
}
