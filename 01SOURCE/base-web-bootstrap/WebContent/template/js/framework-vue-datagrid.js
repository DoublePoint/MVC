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
	this.idField="rowId";
	this.uniqueId="rowId";
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
		this.initStyle();
		this.initData();
		this.initEvent();
	};
	this.initAjaxJsonData=function(ajaxDataWrap){
		this.datawrap.parse(ajaxDataWrap);
		this.render();
	}
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
				grid.initAjaxJsonData(ajaxDataWrap);
			},
			error:function(){
				grid.setLayuiTableDataNull();
			}
		});

		this.initBootstrapSetting();
	};
	this.initEvent = function() {
		//分页点击事件
		var pageclickFunction = this.onpageclick;
		if (pageclickFunction != null) {
			_Ajaxdatagrid.setPageClickFunctionName(pageclickFunction);
		}
	};
	this.initStyle=function(){
		// 高度设置为获取父元素的高度
		var brotherHeight=0;
		try{
			brotherHeight=this.getDom().closest(".ll-fill-area-tb").children('.panel-heading').get(0).offsetHeight;
		}
		catch(e){
			brotherHeight=0;
		}
		var thisResultHeight = this.getDom().closest(".ll-fill-area-tb").get(0).offsetHeight-brotherHeight;
		if (thisResultHeight <= _ConstantAjaxDataGrid._DEFAULT_MIN_HEIGHT)
			thisResultHeight = _ConstantAjaxDataGrid._DEFAULT_MIN_HEIGHT;
		this.height = thisResultHeight - this.pageHeight;
	};
	this.render = function() {
		this.initBootstrapSetting(this);
		this.setPager(this.datawrap.getPageInfo(), this.id);
	};
	this.resize = function() {
		this.initStyle();
		// 高度设置为获取父元素的高度
//		var thisResultHeight = this.getDom().closest(".ll-fill-area-tb").get(0).offsetHeight-this.getDom().closest(".ll-fill-area-tb").children(':first').get(0).offsetHeight;
//		if (thisResultHeight <= _ConstantAjaxDataGrid._DEFAULT_MIN_HEIGHT)
//			thisResultHeight = _ConstantAjaxDataGrid._DEFAULT_MIN_HEIGHT;
//		this.height = thisResultHeight - this.pageHeight;
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
		$("#" + this.domId).bootstrapTable('load', $._Clone(ajaxDataWrap.dataList)); 
		
	};
	this.initBootstrapSetting = function() {
		var ajaxgrid = this;
		var id = ajaxgrid.domId;
		var ajaxDataWrap = ajaxgrid.datawrap;
		var datasource = ajaxgrid.datasource;
		var cols = ajaxgrid.cols;
		var height = ajaxgrid.height;
		var $table = $("#" + id);
		$table.bootstrapTable({
			buttonsAlign:'right',//按钮对齐方式
			//url : $$pageContextPath + ajaxgrid.datasource,
			data : $._Clone(ajaxDataWrap.dataList),
			dataField: "dataList",//这是返回的json数组的key.默认好像是"rows".这里只有前后端约定好就行
			height : height,
			idField : "rowId",
			//pagination: true,
			//pageSize: 1,                       //每页的记录行数（*）  
           // pageList: [1,20, 50, 100],            //可供选择的每页的行数（*）  
//            queryParams:function(params){
//            	var ajaxDataWrap=new AjaxDataWrap
//            },
//            responseHandler:function(result){
//            	ajaxgrid.datawrap.parse(ajaxDataWrap);
//            	var code = result.code;//在此做了错误代码的判断
//        	    if(code != 200){
//        	        alert("错误代码" + errcode);
//        	        return;
//        	    }
//        	    //如果没有错误则返回数据，渲染表格
//        	    return {
//        	        total : result.pageInfo.totalElementCount, //总页数,前面的key必须为"total"
//        	        dataList : result.dataList //行数据，前面的key要与之前设置的dataField的值一致.
//        	    };
//            },//请求数据成功后，渲染表格前的方法
			showRefresh: true,
			sidePagination:"server",
			striped: true,    
			toolbar: '#toolbar',//指定工具栏
			toolbarAlign:'right',//工具栏对齐方式
			uniqueId : "rowId",
			
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
	},
	this.getCheckedDataList = function() {
		var $table = $("#" + this.domId);
		return $table.bootstrapTable('getSelections');
	},
	this.removeChecked = function(){
		var checkDataList=this.getCheckedDataList();
		if(checkDataList==null||checkDataList.length<=0)
			return;
		var arr=new Array();
		for(var i in checkDataList){
			
			arr.push(checkDataList[i].rowId);
			//this.getDom().bootstrapTable('removeByUniqueId', checkDataList[i].rowId);
		}
		this.getDom().bootstrapTable('remove', "rowId",arr);
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
