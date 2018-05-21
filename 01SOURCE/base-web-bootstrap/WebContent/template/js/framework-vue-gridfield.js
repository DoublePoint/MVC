(function($) {
	_LLGridFieldComponent(_ConstantComponentMap._GridField)
})(jQuery);

function GridField(domId) {
	GridFieldBase.call(this);
	this.domId = domId;

	// 构造使用于bootstrap的field
	this.getBoostrapField = function() {
		var field = {};

		for ( var i in this) {
			if (i != "getBoostrapField" && i != "domId") {
				if (this[i]) {
					field[i] = this[i];
				}
			}
		}

		field.editable = {
			type : 'text',
			showbuttons : false,
			disabled : this.readonly == "false" ? false : true,
			emptytext : "&nbsp;&nbsp;",
			mode : "inline",
			onblur : "submit",
			validate : function(value) {
				if ($.trim(value) == '') {
					return '姓名不能为空!';
				}
			}
		};
		return field;
	}
}
(function() {
	// 创建一个没有实例方法的类
	var Super = function() {
	};
	Super.prototype = GridFieldBase.prototype;
	// 将实例作为子类的原型
	GridField.prototype = new Super();
	GridField.prototype.constructor = GridField; // 需要修复下构造函数
})();