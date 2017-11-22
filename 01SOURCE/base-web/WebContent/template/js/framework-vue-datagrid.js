var documentWriteHtml = "";
Vue.component('ll-datagrid', {
	props : [ 'id', 'datasource', 'columns' ],
	template : '<table  :id="id+guid" v-on:click="incrementCounter"></table>',
	data : function() {
		var dataList;
		return {
			guid : Date.now()
		}
	},
	mounted : function() {
		var cd = {};
//		var cols = this.columns;
		var cols = [[]];
		var domId = this.id + this.guid;
		var $script=$('<script type="text/javascript"></script>');
		$script.append('var '+this.id+'=new AjaxDataGrid("'+ domId + '");');
		$script.append(this.id+'.datasource="'+this.datasource+'";');
//		documentWriteHtml = '<script type="text/javascript">var ' + this.id + '=new AjaxDataGrid("' + domId + '");</script>';
		documentWriteHtml=$script.prop("outerHTML");
		$.ajax({
			url : $$pageContextPath + this.datasource,
			type : "POST",
			contentType : 'application/json;charset=UTF-8',
			dataType : "json",
			data : JSON.stringify(cd),
			async : false,
			success : function(data) {
				setAjaxData(domId, data, cols);
			},
			error : function() {
				alert("error");
			}
		});
	},
	methods : {
		incrementCounter : function() {
		}
	},
})
var columnsVar2 = [ [ // 标题栏
{
	checkbox : true,
	LAY_CHECKED : false
} // 默认全选
, {
	field : 'cdbs',
	title : '菜单标识',
	width : 180,
	sort : true
}, {
	field : 'cdmc',
	title : '菜单名称',
	width : 180
}, {
	field : 'cdpx',
	title : '菜单排序',
	width : 150
}, {
	field : 'cdlj',
	title : '签名',
	width : 150
} ] ];
var $lform;
$(document).ready(function() {
	$lform = new Vue({
		el : "form",
		data : {
			total : 0,
			columns : columnsVar2
		},
		methods : {
			incrementTotal : function() {
				this.total += 1
			}
		}
	})
	if (documentWriteHtml != "")
		$("body").append(documentWriteHtml);
	if (init != null)
		init();
});

var AjaxDataGrid = function(domId) {
	this.id = domId;
	this.cols = [[]];
	this.datasource="";
}
AjaxDataGrid.prototype = {
	constructor : AjaxDataGrid,
	init : function(msg) {
		this.setData();
	},
	setData : function(data) {
		setAjaxData(this.id, data, this.cols);
	},
	setCols:function(cols){
		this.cols=cols;
	}
};

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
