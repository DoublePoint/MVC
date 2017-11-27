function HashTable() {
	var size = 0;
	var entry = new Object();
	this.add = function(key, value) {
		if (!this.containsKey(key)) {
			size++;
		}
		entry[key] = value;
	}
	this.getValue = function(key) {
		return this.containsKey(key) ? entry[key] : null;
	}
	this.remove = function(key) {
		if (this.containsKey(key) && (delete entry[key])) {
			size--;
		}
	}
	this.containsKey = function(key) {
		return (key in entry);
	}
	this.containsValue = function(value) {
		for ( var prop in entry) {
			if (entry[prop] == value) {
				return true;
			}
		}
		return false;
	}
	this.getValues = function() {
		var values = new Array();
		for ( var prop in entry) {
			values.push(entry[prop]);
		}
		return values;
	}
	this.getKeys = function() {
		var keys = new Array();
		for ( var prop in entry) {
			keys.push(prop);
		}
		return keys;
	}
	this.getSize = function() {
		return size;
	}
	this.clear = function() {
		size = 0;
		entry = new Object();
	}

	return this;
}

function AjaxDataGrid(domId) {
	this.id = domId;
	this.cols = [ [] ];
	this.datasource = "";

	this.init = function(msg) {
		this.setData();
	};
	this.setData = function(data) {
		var parentHeight=$("#"+this.id).parent().height();
		var allChildFixHeight=0;
		var brother=$("#"+this.id).parent().parent().children();
		var parentId=$("#"+this.id).parent()[0].id;
		for(var i=0;i<brother.length;i++){
			if(brother[i].id!=parentId){
				allChildFixHeight+=brother[i].scrollHeight;
			}
		}
		var thisResultHeight=$("#"+this.id).parent().parent().height()-allChildFixHeight;
		$._SetLayuiTableData(this.id, data, this.cols,thisResultHeight);
	};
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
function AjaxTree(domId) {
	this.id = domId;
	this.treeObject=null;
	this.getTreeObject=function(){
		if(this.treeObject==null)
			treeObject=$.fn.zTree.getZTreeObj(this.id);
		return treeObject;
	}
	this.getSelectedNodes=function(){
		return this.getTreeObject().getSelectedNodes();
	}
	return this;
}
function AjaxDataGridColumns(field, title, width, sort, fixed, event) {
	this.field = field;
	this.title = title;
	this.event = "CLICK";
	this.width = width == null ? ConstantAjaxDataGrid.DEFAULT_COLUMN_WIDTH : width;
	this.sort = sort == null ? ConstantAjaxDataGrid.DEFAULT_COLUMN_SORT : sort;
	this.fixed = fixed == null ? ConstantAjaxDataGrid.DEFAULT_COLUMN_FIXED : fixed;

	return this;
}
function AjaxMenu(id) {
	this.id = id;
//	this.cdmc = config.cdmc;
//	this.cdbs = config.cdbs;
//	this.cdlj = config.cdlj;
//	this.childrenMenuList = config.childrenMenuList;
	this.setData = function(data) {
		$("#"+id).empty();
		$("#"+id).append(this.getHtml(data));
		
	};

	this.getChildrenMenuHtml = function(menu) {
		var $li = $("<li></li>");
		if (menu.childrenCDList == null || menu.childrenCDList.length <= 0) {
			var $a = $("<a></a>");
			$a.attr("class", "afinve");
			$a.attr("onclick", "javascript:return false;");
			if (menu.cdlj == null || menu.cdlj == "")
				$a.attr("menuhref", "#");
			else
				$a.attr("menuhref", menu.cdlj);
			if (menu.cdtb != null && menu.cdtb != "") {
				var $i = $("<i></i>");
				$i.attr("class", "");
				$a.append($i);
			}
			var $spanCdmc = $("<span></span>");
			if (menu.cdmc != null && menu.cdmc != "") {
				$spanCdmc.append(menu.cdmc);
				if (menu.cdcj == "1") {
					$spanCdmc.attr("class", "nav-text");
				}
			}
			$a.append($spanCdmc);
			$li.append($a);
		} else {
			var $a = $("<a></a>");
			$a.attr("class", "afinve");
			if (menu.cdlj == null || menu.cdlj == "")
				$a.attr("menuhref", "#");
			else
				$a.attr("menuhref", menu.cdlj);
			if (menu.cdtb != null && menu.cdtb != "") {
				var $i = $("<i></i>");
				$i.attr("class", "");
				$a.append($i);
			}
			var $spanCdmc = $("<span></span>");
			if (menu.cdmc != null && menu.cdmc != "") {
				$spanCdmc.append(menu.cdmc);
				if (menu.cdcj == "1") {
					$spanCdmc.attr("class", "nav-text");
				}
			}
			$a.append($spanCdmc);
			var $spanIcon = $("<span></span>");
			$spanIcon.attr("class", "arrow");
			$a.append($spanIcon);
			$li.append($a);

			var $ul = $("<ul></ul>");
			$ul.attr("class", "sub-menu");
			for (var i = 0; i < menu.childrenCDList.length; i++) {
				$ul.append(this.getChildrenMenuHtml(menu.childrenCDList[i]));
			}
			$li.append($ul);
		}
		return $li.prop("outerHTML");
	};

	this.getHtml = function(data) {
		if (data == null || data.length <= 0)
			return;

		var str = "";
		for (var i = 0; i < data.length; i++) {
			str = str + this.getChildrenMenuHtml(data[i]);
		}
		return str;
	}
	return this;
}
