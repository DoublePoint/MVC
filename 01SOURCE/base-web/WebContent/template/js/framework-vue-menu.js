var existTabsNameArray = new Array();
Vue.component(_ConstantComponentMap._AjaxMenu, {
	props : [ 'id', 'datasource', 'columns', 'onmenuclick' ],
	template : ' <ul :id="id+guid" lay-filter="side" class="navMenu"></ul>',

	data : function() {
		return {
			guid : $._GenerateUUID()
		}
	},
	mounted : function() {
		this._InitAjaxMenuData();
		this._MapComponent();
		this._InitMenuClick();
		this._TabDeleteClick();
	},
	created : function() {
		this._RegisterComponent();
	},
	methods : {
		incrementCounter : function() {
		},
		_RegisterComponent : function() {
			var domId = this._GetComponentDomId();
			var _AjaxMenu = new AjaxMenu(domId);
			$._AddToLayuiObjectHashMap(domId, _AjaxMenu);
		},
		// 添加生命AjaxMenu对象脚本
		_MapComponent : function() {
			$._OutputMapCompoment(this);
		},
		_GetComponentDomId : function() {
			var _domId = this.id + this.guid;
			return _domId;
		},
		_InitMenuClick : function() {
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
					parent.prev("a").removeClass("active")
				} else {
					$(this).parent("li").removeClass("open").find(labeul).slideUp(300);
					if ($(this).parent().find("ul").length > 0) {
						$(this).removeClass("active").find(".arrow").removeClass("open")
					} else {
						$(this).addClass("active")
					}
				}

				var href = $(this).attr("menuhref");
				if (href == null || href == "" || href == "#" || href == "0") {
					return;
				}
				var textarr = $("#admin-body").find(".layui-tab-title").find("li").text();
				if (textarr.indexOf($(this).text()) == -1) {
					// 新增一个Tab项
					$element.tabAdd('admin-tab', {
						title : $(this).text(),
						content : '<iframe src="' + $$pageContextPath + href + '"></iframe>',
						id : $(this).text()
					});
					existTabsNameArray.push($(this).text());
				}
				// 切换到指定Tab项
				$element.tabChange('admin-tab', $(this).text());
			});
		},
		_InitAjaxMenuData : function() {
			var cd = {};
			var domId = this._GetComponentDomId();
			$.ajax({
				url : $$pageContextPath + this.datasource,
				type : "POST",
				contentType : 'application/json;charset=UTF-8',
				dataType : "json",
				data : JSON.stringify(cd),
				async : false,
				success : function(data) {
					var _AjaxMenu = $._GetFromLayuiObjectHashMap(domId);
					_AjaxMenu.setData(data);
				}
			});
		},
		_TabDeleteClick : function() {

		}

	},
})

function AjaxMenu(domId) {
	this.domId = domId;
	// this.cdmc = config.cdmc;
	// this.cdbs = config.cdbs;
	// this.cdlj = config.cdlj;
	// this.childrenMenuList = config.childrenMenuList;
	this.setData = function(data) {
		$("#" + domId).empty();
		$("#" + domId).append(this.getHtml(data));

	};

	this.getChildrenMenuHtml = function(menu) {
		var $li = $("<li></li>");
		if (menu.childrenMenuList == null || menu.childrenMenuList.length <= 0) {
			var $a = $("<a></a>");
			$a.attr("class", "afinve");
			$a.attr("onclick", "javascript:return false;");
			if (menu.cdlj == null || menu.cdlj == "")
				$a.attr("menuhref", "#");
			else
				$a.attr("menuhref", menu.cdlj);
			if (menu.cdtb != null && menu.cdtb != "") {
				var $i = $("<i>"+menu.cdtb+"</i>");
				$i.attr("class", "layui-icon");
				$a.append($i);
			}
			else{
				var $i = $("<i>&nbsp;&nbsp;&nbsp;</i>");
				$i.attr("class", "layui-icon");
				$a.append($i);
			}
			var $spanCdmc = $("<span></span>");
			if (menu.cdmc != null && menu.cdmc != "") {
				$spanCdmc.append(menu.cdmc);
				if (menu.cdcj == "1") {
					$spanCdmc.attr("class", "nav-text");
				}
			}
			$a.append($spanCdmc);
			$li.append($a);
		} else {
			var $a = $("<a></a>");
			$a.attr("class", "afinve");
			if (menu.cdlj == null || menu.cdlj == "")
				$a.attr("menuhref", "#");
			else
				$a.attr("menuhref", menu.cdlj);
			if (menu.cdtb != null && menu.cdtb != "") {
				var $i = $("<i>"+menu.cdtb+"</i>");
				$i.attr("class", "layui-icon");
				$a.append($i);
			}
			else{
				var $i = $("<i>&nbsp;&nbsp;&nbsp;</i>");
				$i.attr("class", "layui-icon");
				$a.append($i);
			}
			var $spanCdmc = $("<span></span>");
			if (menu.cdmc != null && menu.cdmc != "") {
				$spanCdmc.append(menu.cdmc);
				if (menu.cdcj == "1") {
					$spanCdmc.attr("class", "nav-text");
				}
			}
			$a.append($spanCdmc);
			var $spanIcon = $("<span></span>");
			$spanIcon.attr("class", "arrow");
			$a.append($spanIcon);
			$li.append($a);

			var $ul = $("<ul></ul>");
			$ul.attr("class", "sub-menu");
			for (var i = 0; i < menu.childrenMenuList.length; i++) {
				$ul.append(this.getChildrenMenuHtml(menu.childrenMenuList[i]));
			}
			$li.append($ul);
		}
		return $li.prop("outerHTML");
	};

	this.getHtml = function(data) {
		if (data == null || data.length <= 0)
			return;

		var str = "";
		for (var i = 0; i < data.length; i++) {
			str = str + this.getChildrenMenuHtml(data[i]);
		}
		return str;
	}
	return this;
}