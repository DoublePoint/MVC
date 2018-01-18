function _PageInfo() {
	this.currentPageNum = 1;
	this.currentPageCount = 0;
	this.totalElementCount = 0;
	this.totalPageCount = 1;
	this.pageSize = 100;
	this.sort = null;
	this.parse = function(jsonObjectPageInfo) {
		if (jsonObjectPageInfo == null)
			return;
		this.currentPageNum = jsonObjectPageInfo.currentPageNum;
		this.currentPageCount = jsonObjectPageInfo.currentPageCount;
		this.totalElementCount = jsonObjectPageInfo.totalElementCount;
		this.totalPageCount = jsonObjectPageInfo.totalPageCount;
		this.pageSize = jsonObjectPageInfo.pageSize;
		this.sort = jsonObjectPageInfo.sort;
	};
	this.getCurrentPageNum = function() {
		return this.currentPageNum;
	};
	this.setCurrentPageNum = function(aCurrentPageNum) {
		this.currentPageNum = aCurrentPageNum;
	};
	this.getCurrentPageCount = function() {
		return this.currentPageCount;
	};
	this.setCurrentPageCount = function(aCurrentPageCount) {
		this.currentPageCount = aCurrentPageCount;
	};
	this.getTotalElementCount = function() {
		return this.totalElementCount;
	};
	this.setTotalElementCount = function(aTotalElementCount) {
		this.totalElementCount = aTotalElementCount;
	};
	this.getTotalPageCount = function() {
		return this.totalPageCount;
	};
	this.setTotalPageCount = function(aTotalPageCount) {
		this.totalPageCount = aTotalPageCount;
	};
	this.getPageSize = function() {
		return this.pageSize;
	};
	this.setPageSize = function(aPageSize) {
		this.pageSize = aPageSize;
	};
	this.clear = function() {
		this.currentPageNum = 1;
		this.currentPageCount = 0;
		this.totalElementCount = 0;
		this.totalPageCount = 1;
		this.pageSize = _ConstantAjaxDataGrid._DEFAULT_PAGE_SIZE;
		this.sort = null;
	}
	return this;
};


function _JspParams() {
	this._ParentDialogDiv=null;
	this._YesFunctionName = null;
	this._CancelFunctionName = null;
	this.YesFunction = null;
	this.CancelFunction = null;
	this._TitleValue=null;
	this.setYesFunctionName = function(funcName) {
		this._YesFunctionName = funcName;
	};
	this.setCancelFunctionName = function(cancName) {
		this._CancelFunctionName = cancName;
	}
	this.setParentDialogDiv = function(aParentDialogDiv){
		this._ParentDialogDiv=aParentDialogDiv;
	}
	this.addNotSaveIcon = function(){
		var titleObj=this._ParentDialogDiv.children(".layui-layer-title"); 
		this._TitleValue=titleObj.text();
		if(titleObj.children("span").length<=0){
			var $span = $("<span> 未保存</span>");
			$span.attr("class", "layui-badge");
			titleObj.append($span);
		}
	},
	this.removeNotSaveIcon = function(){
		var titleObj=this._ParentDialogDiv.children(".layui-layer-title"); 
		titleObj.children("span").remove();
	}
}

function _AjaxDataWrap(name) {
	// this.name = name;
	this.code = "";
	this.msg = "";
	this.dataList = [];
	this.pageInfo = $._CreatePageInfo();
	this.parse = function(jsonObjectDataWrap) {
		if (jsonObjectDataWrap == null)
			return;
		this.dataList = jsonObjectDataWrap.dataList;
		this.pageInfo.parse(jsonObjectDataWrap.pageInfo);
	};
	this.setDataList = function(dataList) {
		this.dataList = dataList;
	};
	this.getDataList = function() {
		return this.dataList;
	};
	this.getRow = function(index){
		if(index==null)
			return null;
		if(this.dataList.length-1>=index)
			return this.dataList[index];
	}
	this.getPageInfo = function() {
		return this.pageInfo;
	}
	this.clearPageInfo = function() {
		this.pageInfo = null;
	}
	return this;
}