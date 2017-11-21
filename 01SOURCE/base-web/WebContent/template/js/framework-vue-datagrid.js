var documentWriteHtml="";
Vue.component('ll-datagrid', {
	props : [ 'id', 'datasource', 'columns' ],
	// template : '<table id="tableid"
	// v-on:click="incrementCounter"><tr><td>{{cdmc}}</td></tr></table>',
	template : '<span  :id="id+guid"  v-on:click="incrementCounter">{{cdmc}}</span>',
	data : function() {
		var dataList;
		return {
			cdbs : "111111111111",
			cdmc : "菜单管理111111",
			sjcdbs : "1",
			cdcj : 1,
			cdpx : 1,
			guid : Date.now()
		}
	},
	mounted : function() {
		var cd = {};
		var cols = this.columns;
		var domId = this.id + this.guid;
		documentWriteHtml='<script type="text/javascript">var '+this.id+'=new AjaxDataGrid("'+domId+'");</script>';
		
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
		// this.cdmc = this.cdmc + "123";
		// this.$emit('increment');
	},
	methods : {
		incrementCounter : function() {
		}
	},
})
var columnsVar = [ [ // 标题栏
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
			columns : columnsVar
		},
		methods : {
			incrementTotal : function() {
				this.total += 1
			}
		}
	})
	if(documentWriteHtml!="")
		$("body").append(documentWriteHtml);
	if (init != null)
		init();
});

function setAjaxData(id, data, cols) {
	
}

var AjaxDataGrid = function(domId) {
	this.id=domId;
}
AjaxDataGrid.prototype = {
	constructor : AjaxDataGrid,
	init : function(msg) {
		this.setData();
	},
	setData:function(data,cols){
		setAjaxData(this.id,data,cols);
	}
};

function setAjaxData(id,data,cols){
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