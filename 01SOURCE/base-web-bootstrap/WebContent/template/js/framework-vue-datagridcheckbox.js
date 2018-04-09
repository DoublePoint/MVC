Vue.component(_ConstantComponentMap._GridCheck, {
	props : [ 'field', 'title', 'width', 'sort', 'fixed', 'onclick', 'template' ],
	template : '<th data-field="state" data-checkbox="true"></th>',
	data : function() {
		return {
			guid : $._GenerateUUID(),
			baseId : "ajaxdatagridrow",
		}
	},
	mounted : function() {
		// 添加本空间所属的ajaxdatagrid的列定义
	},
	methods : {
	},
})
