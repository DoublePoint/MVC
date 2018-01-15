Vue.component(_ConstantComponentMap._ToolBar, {
	props : [ 'id', 'datasource', 'columns', 'onmenuclick' ],
	template : '<div class="layui-form-item" style="text-align:center;padding-top:0px;">'
	+ '<slot></slot>'
	+ '</div>',
	data : function() {
		var labelclientStyleBuffer = $._CreateStringBuffer();
		for (clientStyleName in this._ClientStyleArr) {
			var stylekey = _ClientStyleArr[clientStyleName];
			if (this[stylekey] != null) {
				var labelalignbuffer = $._CreateStyleBuffer(_ClientStyleMap[stylekey], this[stylekey]);
				labelclientStyleBuffer.append(labelalignbuffer.toString());
			}
		}
		return {
			guid : $._GenerateUUID(),
			clientStyle : labelclientStyleBuffer.toString()
		}
	},
});
