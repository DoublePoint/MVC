var DoublePoint = {};// 全局对象
(function($) {
	var _LayuiObjectHashMap;
	$.extend({
		_AddToLayuiObjectHashMap : function(id, obj) {
			if (_LayuiObjectHashMap == null)
				_LayuiObjectHashMap = new HashTable();
			if (!_LayuiObjectHashMap.containsKey(id)) {
				_LayuiObjectHashMap.add(id, obj);
			}
		},
		_Eval:function(fuc){
			eval(fuc);
		},
		_GenerateUUID:function () {
			var d = new Date().getTime();
			var uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
			  var r = (d + Math.random()*16)%16 | 0;
			  d = Math.floor(d/16);
			  return (c=='x' ? r : (r&0x3|0x8)).toString(16);
			});
			return uuid;
		},
		_GetFromLayuiObjectHashMap : function(id) {
			return _LayuiObjectHashMap == null ? null : _LayuiObjectHashMap.getValue(id);
		},
		_SetLayuiTableData : function(id, data, cols) {
			var ss=$table.render({
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
			return ss;
		}
	});

})(jQuery)