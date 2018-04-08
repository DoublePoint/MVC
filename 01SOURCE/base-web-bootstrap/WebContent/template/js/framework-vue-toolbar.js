function componentToolBar(){
	// 创建style映射

	var _ClientStyleMap = {};
	var _ClientStyleArr;
	var _ClientPropsArr = [];// 私有attr
	var _ClientPropsArrAll;

	// 获取私有Style的对应的属性名称
	// 获取私有Style的对应的属性名称[key]:style样式名称[value] 例如 labelalign:text-align
	_ClientStyleArr = [ "align" ];
	_ClientStyleMap["align"] = "text-align";
	_ClientPropsArrAll = _ClientStyleArr.concat(_ClientStyleArr, _FormFieldCommonInheritParams);
	Vue.component(_ConstantComponentMap._ToolBar, {
		props : [ 'id', 'datasource', 'columns', 'onmenuclick' ],
		template : '<div :style="clientStyle" >' + '<slot></slot>' + '</div>',
		data : function() {
			var labelclientStyleBuffer = $._CreateStringBuffer();
			for (clientStyleName in this._ClientStyleArr) {
				var stylekey = _ClientStyleArr[clientStyleName];
				if (this[stylekey] != null) {
					var labelalignbuffer = $._CreateStyleBuffer(_ClientStyleMap[stylekey], this[stylekey]);
					labelclientStyleBuffer.append(labelalignbuffer.toString());
				}
			}
			//labelclientStyleBuffer.append("line-height:").append();
			return {
				guid : $._GenerateUUID(),
				clientStyle : labelclientStyleBuffer.toString()
			}
		},
	});

}
componentToolBar();