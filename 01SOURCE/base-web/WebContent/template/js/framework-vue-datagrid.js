var documentWriteHtml = "";
Vue.component('ll-ajaxdatagrid', {
	props : [ 'id', 'datasource', 'columns' ],
	template : '<table  :id="id+guid" v-on:click="incrementCounter"><slot></slot></table>',

	data : function() {
		var dataList;
		return {
			guid : Date.now()
		}
	},
	created : function() {
		var cd = {};
		var cols = [ [] ];
		var domId = this.id + this.guid;

		var $script = $('<script type="text/javascript"></script>');
		$script.append('var ' + this.id + '=$.getAjaxDataGrid("' + domId + '");');
		$script.append(this.id + '.datasource="' + this.datasource + '";');
		documentWriteHtml = $script.prop("outerHTML");
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

		var ajaxDataGrid = new AjaxDataGrid(domId);
		$.addAjaxDataGrid(domId, ajaxDataGrid);
	},
	methods : {
		incrementCounter : function() {
		}
	},
})
