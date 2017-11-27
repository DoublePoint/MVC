var documentWriteHtml = "";
Vue.component(ConstantComponentMap._AjaxDataGrid, {
	props : [ 'id', 'datasource', 'columns','onrowclick' ],
	template : '<table  :lay-filter="id+guid"  :id="id+guid" v-on:click="incrementCounter"><slot></slot></table>',

	data : function() {
		var dataList;
		return {
			guid : $._GenerateUUID()
		}
	},
	mounted:function(){
		this._initAjaxDataGridData();
		this._addDefineAjaxDataGridObjectScript();
		
	},
	created : function() {
		this._addAjaxDataGridToMap();
	},
	methods : {
		incrementCounter : function() {
		},
		_addAjaxDataGridToMap:function(){
			var domId=this._getAjaxDataGridDomId();
			var ajaxDataGrid = new AjaxDataGrid(domId);
			$._AddToLayuiObjectHashMap(domId, ajaxDataGrid);
			
			//注册该对象ID 以便在浏览器大小改变时重新计算其大小
			$._RegisterResizeModel(ajaxDataGrid);
		},
		//添加生命ajaxDataGrid对象脚本
		_addDefineAjaxDataGridObjectScript:function(){
			var domId=this._getAjaxDataGridDomId();
			var $script = $('<script type="text/javascript"></script>');
			$script.append('var ' + this.id + '=$._GetFromLayuiObjectHashMap("' + domId + '");');
			$script.append(this.id + '.datasource="' + this.datasource + '";');
			documentWriteHtml = $script.prop("outerHTML");
			$("body").append(documentWriteHtml);
		},
		_getAjaxDataGridDomId:function(){
			var _domId = this.id + this.guid;
			return _domId;
		},
		_initAjaxDataGridData:function(){
			var cd = {};
			var domId=this._getAjaxDataGridDomId();
			$.ajax({
				url : $$pageContextPath + this.datasource,
				type : "POST",
				contentType : 'application/json;charset=UTF-8',
				dataType : "json",
				data : JSON.stringify(cd),
				async : false,
				success : function(data) {
					var _ajaxdatagrid=$._GetFromLayuiObjectHashMap(domId);
					_ajaxdatagrid.setData(data);
//					$._SetLayuiTableData(domId, data, cols);
				},
				error : function() {
					alert("error");
				}
			});
			var str=this.onrowclick
			$table.on('tool('+this._getAjaxDataGridDomId()+')', function(obj){
				if(str==null)
					return;
			    var data = obj.data;
			    $._Eval(str);
			 });
		}
		
	},
})


function AjaxDataGrid(domId) {
	this.id = domId;
	this.cols = [ [] ];
	this.datasource = "";
	this.data=null;
	this.init = function(msg) {
		this.setData();
	};
	this.setData = function(data) {
		this.data=data;
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
	this.resize = function(){
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
		if(thisResultHeight<=ConstantAjaxDataGrid.DEFAULT_MIN_HEIGHT)
			thisResultHeight=ConstantAjaxDataGrid.DEFAULT_MIN_HEIGHT;
		$._SetLayuiTableData(this.id, this.data, this.cols,parentHeight);
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
