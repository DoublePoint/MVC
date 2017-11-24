var DoublePoint = {};// 全局对象
(function($) {
	var ajaxDataGridHashTab;
	$.extend({
		getAjaxDataGrid : function(id) {
			return ajaxDataGridHashTab==null?null:ajaxDataGridHashTab.getValue(id);
		}
	});
	
	$.extend({
		addAjaxDataGrid : function(id,ajaxDataGridObject) {
			if(ajaxDataGridHashTab==null)
				ajaxDataGridHashTab=new HashTable();
			if(!ajaxDataGridHashTab.containsKey(id)){
				ajaxDataGridHashTab.add(id,ajaxDataGridObject);
			}
		}
	});
	
})(jQuery)