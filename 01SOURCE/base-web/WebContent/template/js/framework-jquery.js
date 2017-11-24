var DoublePoint = {};// 全局对象
(function($) {
	var _ajaxDataGridHashTab;
	$.extend({
		addAjaxDataGrid : function(id, ajaxDataGridObject) {
			if (_ajaxDataGridHashTab == null)
				_ajaxDataGridHashTab = new HashTable();
			if (!_ajaxDataGridHashTab.containsKey(id)) {
				_ajaxDataGridHashTab.add(id, ajaxDataGridObject);
			}
		},
		getAjaxDataGrid : function(id) {
			return _ajaxDataGridHashTab == null ? null : _ajaxDataGridHashTab.getValue(id);
		},
		setLayuiTableData : function(id, data, cols) {
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
	});

})(jQuery)