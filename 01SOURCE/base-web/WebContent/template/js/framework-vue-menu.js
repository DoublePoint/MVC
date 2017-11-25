var documentWriteHtml = "";
Vue.component(ConstantComponentMap._AjaxMenu, {
	props : [ 'id', 'datasource', 'columns' ],
	template : ' <ul :id="id+guid" class="navMenu"></ul>',

	data : function() {
		return {
			guid : $._GenerateUUID()
		}
	},
	mounted : function() {
		this._initAjaxMenuData();
		this._addDefineAjaxMenuObjectScript();
	},
	created : function() {
		this._addAjaxMenuToMap();
	},
	methods : {
		incrementCounter : function() {
		},
		_addAjaxMenuToMap : function() {
			var domId = this._getAjaxMenuDomId();
			var _AjaxMenu = new AjaxMenu(domId);
			$._AddToLayuiObjectHashMap(domId, _AjaxMenu);
		},
		// 添加生命AjaxMenu对象脚本
		_addDefineAjaxMenuObjectScript : function() {
			var domId = this._getAjaxMenuDomId();
			var $script = $('<script type="text/javascript"></script>');
			$script.append('var ' + this.id + '=$._GetFromLayuiObjectHashMap("' + domId + '");');
			$script.append(this.id + '.datasource="' + this.datasource + '";');
			documentWriteHtml = $script.prop("outerHTML");
			$("body").append(documentWriteHtml);
		},
		_getAjaxMenuDomId : function() {
			var _domId = this.id + this.guid;
			return _domId;
		},
		_initAjaxMenuData : function() {
			var cd = {};
			var domId = this._getAjaxMenuDomId();
			$.ajax({
				// /template/xt/cdDataList
				url : $$pageContextPath + this.datasource,
				type : "POST",
				contentType : 'application/json;charset=UTF-8',
				dataType : "json",
				data : JSON.stringify(cd),
				async : false,
				success : function(data) {
					var _AjaxMenu = $._GetFromLayuiObjectHashMap(domId);
					_AjaxMenu.setData(data);
					// $._SetLayuiTableData(domId, data, cols);
					$('.navMenu li a').on('click', function() {
						var parent = $(this).parent().parent();// 获取当前页签的父级的父级
						var labeul = $(this).parent("li").find(">ul")
						if ($(this).parent().hasClass('open') == false) {
							// 展开未展开
							parent.find('ul').slideUp(300);
							parent.find("li").removeClass("open")
							parent.find('li a').removeClass("active").find(".arrow").removeClass("open")
							$(this).parent("li").addClass("open").find(labeul).slideDown(300);
							$(this).addClass("active").find(".arrow").addClass("open")
						} else {
							$(this).parent("li").removeClass("open").find(labeul).slideUp(300);
							if ($(this).parent().find("ul").length > 0) {
								$(this).removeClass("active").find(".arrow").removeClass("open")
							} else {
								$(this).addClass("active")
							}
						}

					});
				},
				error : function() {
					alert("error");
				}
			});
		}

	},
})
