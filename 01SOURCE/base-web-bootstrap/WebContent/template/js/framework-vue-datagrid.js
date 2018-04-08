Vue.component(_ConstantComponentMap._AjaxDataGrid, {
	props : [ 'id', 'datasource', 'columns', 'onrowclick', 'onpageclick','ondblclick' ],
	template : '<div style="height:100%;"><table  :id="id+guid" ><thead><tr><slot></slot></tr></thead></table><div :id="laypage+guid"></div></div>',

	data : function() {
		var dataList;
		return {
			guid : $._GenerateUUID(),
			laypage : "laypageid"
		}
	},
	mounted : function() {
		this._InitAjaxDataGridData();
		this._MapComponent();

	},
	created : function() {
		this._RegisterComponent();
	},
	methods : {
		_RegisterComponent : function() {
			var domId = this._GetComponentDomId();
			var ajaxDataGrid = new AjaxDataGrid(domId);
			ajaxDataGrid.pageId = this.laypage + this.guid;
			for ( var attrName in ajaxDataGrid) {
			if (this[attrName] != null)
				ajaxDataGrid[attrName] = this[attrName];
			}
			$._AddToLayuiObjectHashMap(domId, ajaxDataGrid);
			ajaxDataGrid.initEvent();

			// 注册该对象ID 以便在浏览器大小改变时重新计算其大小
			$._RegisterResizeModel(ajaxDataGrid);
			
			// 注册该对象 以便在页面加载结束后绑定事件
//			$._RegisterComponentCompleteListenerModel(ajaxDataGrid);
		},
		// 添加生命ajaxDataGrid对象脚本
		_MapComponent : function() {
			$._OutputMapCompoment(this);
		},
		_GetComponentDomId : function() {
			var _domId = this.id + this.guid;
			return _domId;
		},
		_InitAjaxDataGridData : function() {
			var cd = {};
			var domId = this._GetComponentDomId();
			var _Ajaxdatagrid = $._GetFromLayuiObjectHashMap(domId);
			$.ajax({
				url : $$pageContextPath + this.datasource,
				type : "POST",
				contentType : 'application/json;charset=UTF-8',
				dataType : "json",
				data : JSON.stringify(cd),
				async : false,
				success : function(ajaxDataWrap) {
					_Ajaxdatagrid.setDataWrap(ajaxDataWrap);
				}
			});

			var pageclickFunction = this.onpageclick;
			if (pageclickFunction != null) {
				_Ajaxdatagrid.setPageClickFunctionName(pageclickFunction);
			}
		}

	},
})

function AjaxDataGrid(domId) {
	this.domId = domId;
	this.pageId = 0;
	this.pageHeight = 32;
	this.ondblclick=null;
	this.onrowclick = null;
	this.onpageclick = null;
	this.cols = [];
	this.datasource = "";
	this.datawrap = $._CreateAjaxDataWrap();
	this.height = 300;
	
	this.addCol = function(col) {
		this.cols.push(col);
	}
	this.bindListener= function(){
		this.initEvent();
	}
	this.getCheckedDataList = function() {
		var checkStatus = $table.checkStatus(this.domId), checkedData = checkStatus.data;
		return checkedData;
	}
	this.getCols = function(){
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
	this.getDomId = function(){
		return this.domId;
	}
	this.getDom = function(){
		return $("#"+this.domId);
	}
	this.getOndblclick = function(){
		return this.ondblclick;
	}
	this.getPageClick = function() {
		return this.onpageclick;
	};
	this.getRow = function(rowIndex){
		return this.datawrap.getRow(rowIndex);
	};
	this.getRowClick = function() {
		return this.onrowclick;
	};
	
	this.init = function(msg) {
		this.setData();
	};
	this.initEvent = function(){
	}
	this.render = function() {
		var allChildFixHeight = 0;
		var brother = this.getDom().closest(".lllayout").children();
		var parentId =  this.getDom().closest(".layoutarea").attr("id");
		for (var i = 0; i < brother.length; i++) {
			if (brother[i].id != parentId) {
				allChildFixHeight += brother[i].offsetHeight;
			}
		}
		var thisResultHeight = this.getDom().closest(".lllayout").height() - allChildFixHeight;
		if (thisResultHeight <= _ConstantAjaxDataGrid._DEFAULT_MIN_HEIGHT)
			thisResultHeight = _ConstantAjaxDataGrid._DEFAULT_MIN_HEIGHT;
		this.height = thisResultHeight - this.pageHeight;
		this.setLayuiTableData(this);
		this.setPager(this.datawrap.getPageInfo(), this.id);
	};
	this.resize = function() {
		var allChildFixHeight = 0;
		var brother = this.getDom().closest(".lllayout").children();
		var parentId =  this.getDom().closest(".layoutarea").attr("id");
		for (var i = 0; i < brother.length; i++) {
			if (brother[i].id != parentId) {
				allChildFixHeight += brother[i].offsetHeight;
			}
		}
		var thisResultHeight = this.getDom().closest(".lllayout").height() - allChildFixHeight;
		if (thisResultHeight <= _ConstantAjaxDataGrid._DEFAULT_MIN_HEIGHT)
			thisResultHeight = _ConstantAjaxDataGrid._DEFAULT_MIN_HEIGHT;
		this.height = thisResultHeight - this.pageHeight;
		this.setLayuiTableData();
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
		var ajaxgrid=this;
		var id = ajaxgrid.domId;
		var ajaxDataWrap = ajaxgrid.datawrap;
		var datasource = ajaxgrid.datasource;
		var cols = ajaxgrid.cols;
		var height = ajaxgrid.height;
		if(ajaxDataWrap.dataList.length<=0){
			ajaxgrid.showEmpty();
		}
	   var $table=$("#"+id);
		$table.bootstrapTable({
			height : height,
			data: $._Clone(ajaxDataWrap.dataList),
			onClickRow:function(row, $element, field){
				var arr=new Array();
				arr.push(row)
				arr.push($element);
				arr.push(field);
				$._Eval(ajaxgrid.getRowClick(),arr);
			}
		});
		$table.bootstrapTable('resetView',{
	        height: height,
	    });
		$table.bootstrapTable('load', $._Clone(ajaxDataWrap.dataList)); 
		return null;
	};
	this.setOndblclick = function(aOnDblclick){
		this.ondblclick=aOnDblclick;
	}
	this.setPageClickFunctionName = function(funName) {
		this.onPageClickFunctionName = funName;
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
					$._Eval(ajaxDataGrid.getPageClickFunctionName());
				}
			}
		});
	}
	this.setRowClickFunctionName = function(funName) {
		this.onRowClickFunctionName = funName;
	};
	
	this.showEmpty = function(){
		//var cols=this.getCols();
		//var object={};
		//object[this.cols[0][2].field]="未查询到任何数据";
		//this.datawrap.dataList[0]=object;
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
	this.templet = null;
	this.width = width == null ? _ConstantAjaxDataGrid._DEFAULT_COLUMN_WIDTH : width;
	this.sort = sort == null ? _ConstantAjaxDataGrid._DEFAULT_COLUMN_SORT : sort;
	this.fixed = fixed == null ? _ConstantAjaxDataGrid._DEFAULT_COLUMN_FIXED : fixed;

	this.setTemplet = function(tem) {
		this.templet = tem;
	}
	return this;
}
