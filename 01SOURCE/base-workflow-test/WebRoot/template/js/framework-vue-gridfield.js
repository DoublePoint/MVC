(function($) {
	_LL_Model.gridFieldComponent(_LL_Constant._ConstantComponentMap._GridField)

	_LL_Model.GridField = function(domId) {
		_LL_Model.GridFieldBase.call(this);
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
			};
			return field;
		}
	};
	// 创建一个没有实例方法的类
	var Super = function() {
	};
	Super.prototype = _LL_Model.GridFieldBase.prototype;
	// 将实例作为子类的原型
	_LL_Model.GridField.prototype = new Super();
	_LL_Model.GridField.prototype.constructor = _LL_Model.GridField; // 需要修复下构造函数
})(jQuery);