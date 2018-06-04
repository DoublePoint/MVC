var _LL_Model = new function() {
	this._PageInfo = function() {
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
			this.pageSize = _LL_Constant._ConstantAjaxDataGrid._DEFAULT_PAGE_SIZE;
			this.sort = null;
		}
		return this;
	};

	this._DialogParams = function() {
		this._ParentDialogDiv = null;
		this._DialogYesFunctionName = null;
		this._DialogCancelFunctionName = null;
		this._DialogYesFunction = null;
		this._CancelFunction = null;
		this._TitleValue = null;
		this.setDialogYesFunctionName = function(funcName) {
			this._DialogYesFunctionName = funcName;
		};
		this.setDialogCancelFunctionName = function(cancName) {
			this._DialogCancelFunctionName = cancName;
		}
		this.setParentDialogDiv = function(aParentDialogDiv) {
			this._ParentDialogDiv = aParentDialogDiv;
		}
		this.addNotSaveIcon = function() {
			var titleObj = this._ParentDialogDiv.children(".layui-layer-title");
			this._TitleValue = titleObj.text();
			if (titleObj.children("span").length <= 0) {
				var $span = $("<span> 未保存</span>");
				$span.attr("class", "layui-badge");
				titleObj.append($span);
			}
		}, this.removeNotSaveIcon = function() {
			var titleObj = this._ParentDialogDiv.children(".layui-layer-title");
			titleObj.children("span").remove();
		}
		return this;
	};

	this._AjaxDataWrap = function(name) {
		// this.name = name;
		this.code = "";
		this.msg = "";
		this.dataList = [];
		this.data=null;
		this.pageInfo = $.createPageInfo();
		this.parse = function(jsonObjectDataWrap) {
			if (jsonObjectDataWrap == null)
				return;
			this.dataList = jsonObjectDataWrap.dataList;
			this.pageInfo.parse(jsonObjectDataWrap.pageInfo);
		};
		this.setDataList = function(dataList) {
			this.dataList = dataList;
		};
		this.setData = function(data){
			this.data=data;
		};
		this.getData = function(){
			return this.data;
		}
		this.getDataList = function() {
			return this.dataList;
		};
		this.getRow = function(index) {
			if (index == null)
				return null; 
			if (this.dataList.length - 1 >= index)
				return this.dataList[index];
		}
		this.getPageInfo = function() {
			return this.pageInfo;
		}
		this.clearPageInfo = function() {
			this.pageInfo = null;
		}
		return this;
	};

	this.RegisterModel = function() {
		this._ResizeModel = new Array();
		// 弹出窗口弹出后 $(document).ready之后 用户自定义init之前
		this._DialogSuccessModel = new Array();
		// 事件注册Model
		this._ComponentCompleteListenerModel = new Array();
		return this;
	};

	this.AjaxResponse = function(response) {
		if (response) {
			for ( var attrName in response.parameterMap) {
				this[attrName] = (response.parameterMap)[attrName];
			}
		}
		
		this.get = function(field) {
			return this[field];
		}
	
		return this;
	}
	
}
