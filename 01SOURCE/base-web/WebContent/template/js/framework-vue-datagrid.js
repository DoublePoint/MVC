Vue.component(_ConstantComponentMap._AjaxDataGrid, {
	props : [ 'id', 'datasource', 'columns', 'onrowclick', 'onpageclick','ondblclick' ],
	template : '<div><table  :lay-filter="id+guid"  :id="id+guid" ><slot></slot></table><div :id="laypage+guid"></div></div>',

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

			// 定义rowClick
//			var onrowclickFunction = this.onrowclick;
//			if (onrowclickFunction != null) {
//				_Ajaxdatagrid.setRowClickFunctionName(onrowclickFunction);
//				$table.on('tool(' + this._GetComponentDomId() + ')', function(obj) {
//					if (onrowclickFunction == null)
//						return;
//					var data = obj.datawrap;
//					$._Eval(onrowclickFunction, data);
//				});
//			}
			
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
	this.onRowClickFunctionName = null;
	this.onPageClickFunctionName = null;
	this.cols = [ [ {
		type : 'numbers'
	}, {
		type : 'checkbox'
	} ] ];
	this.datasource = "";
	this.datawrap = $._CreateAjaxDataWrap();
	this.height = 300;
	
	this.addCol = function(col) {
		this.cols[0].push(col);
	}
	this.bindListener= function(){
		this.bindTrDblclick();
	}
	//绑定双击事件
	this.bindTrDblclick=function(){
		var grid=this;
		if(grid.getOndblclick()!=null){
			this.getDom().next().find(".layui-table-body").find("tr").on("dblclick",function(){
				var rowIndex=$(this).index();
				var row=grid.getRow(rowIndex);
				var arr=new Array();
				arr.push(row)
				arr.push(rowIndex);
				$._Eval(grid.getOndblclick(),arr);
			});
		}
	}
	//绑定单机事件
	this.bindTrClick= function(){
		var grid=this;
		if(grid.getOndblclick()!=null){
			this.getDom().next().find(".layui-table-body").find("tr").on("lclick",function(){
				var rowIndex=$(this).index();
				var row=grid.getRow(rowIndex);
				var arr=new Array();
				arr.push(row)
				arr.push(rowIndex);
				$._Eval(grid.getOndblclick(),arr);
			});
		}
	}
	this.getCheckedDataList = function() {
		var checkStatus = $table.checkStatus(this.id), checkedData = checkStatus.data;
		return checkedData;
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
	this.getPageClickFunctionName = function() {
		return this.onPageClickFunctionName;
	};
	this.getRow = function(rowIndex){
		return this.datawrap.getRow(rowIndex);
	};
	this.getRowClickFunctionName = function() {
		return this.onRowClickFunctionName;
	};
	
	this.init = function(msg) {
		this.setData();
	};
	this.render = function() {
		var parentHeight = this.getDom().parent().height();
		var allChildFixHeight = 0;
		var brother = this.getDom().parent().parent().children();
		var parentId = this.getDom().parent()[0].id;
		for (var i = 0; i < brother.length; i++) {
			if (brother[i].id != parentId) {
				allChildFixHeight += brother[i].scrollHeight;
			}
		}
		var thisResultHeight = this.getDom().parent().parent().height() - allChildFixHeight;
		this.height = thisResultHeight - this.pageHeight;
		this.setLayuiTableData(this);
		this.setPager(this.datawrap.getPageInfo(), this.id);
	};
	this.resize = function() {
		var parentHeight = this.getDom().parent().height();
		var allChildFixHeight = 0;
		var brother = this.getDom().parent().parent().children();
		var parentId = this.getDom().parent()[0].id;
		for (var i = 0; i < brother.length; i++) {
			if (brother[i].id != parentId) {
				allChildFixHeight += brother[i].scrollHeight;
			}
		}
		var thisResultHeight = this.getDom().parent().parent().height() - allChildFixHeight;
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
		var ss = $table.render({
			elem : '#' + id + '',
			data : $._Clone(ajaxDataWrap.dataList),
			height : height,
			cols : cols,
			// skin : 'row', // 表格风格
			// even : true,
			page : false, // 是否显示分页
			limits : [ 5, 7, 10, 20, 100 ],
			limit : 50,
			done:function(res,curr,count){
				ajaxgrid.bindListener();
			}
		});
		return ss;
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
