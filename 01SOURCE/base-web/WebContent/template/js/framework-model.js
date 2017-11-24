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
	this.cols = [[]];
	this.datasource = "";

	this.init = function(msg) {
		this.setData();
	};
	this.setData = function(data) {
		setAjaxData(this.id, data, this.cols);
	};
	this.setCols = function(cols) {
		this.cols = cols;
	};
	this.addCol = function (col){
		this.cols[0].push(col);
	}
	this.test=function(){
		alert("测试成功");
	}
	return	this;
}
function AjaxDataGridColumns(field,title,width,sort,fixed){
	this.field = field;
	this.title = title;
	this.width = width==null?AjaxDataGridConstant.DEFAULT_COLUMN_WIDTH:width;
	this.sort  = sort==null?AjaxDataGridConstant.DEFAULT_COLUMN_SORT:sort;
	this.fixed = fixed==null?AjaxDataGridConstant.DEFAULT_COLUMN_FIXED:fixed;
	
	return this;
}

function setAjaxData(id, data, cols) {
	$table.render({
		elem : '#' + id + '',
		data : data,
		height : '400',
		cols : cols,
		skin : 'row', // 表格风格
		even : true,
		page : true, // 是否显示分页
		limits : [ 5, 7, 10, 20, 100 ],
		limit : 50
	// 每页默认显示的数量
	});
}