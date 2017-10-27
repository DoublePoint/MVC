var Menu = function(config) {
	this.id = config.id;
	this.menuList = config.menuList;
	return this;
}

Menu.prototype = {
	constructor : DoublePoint.Menu,

	setData : function(dataList) {
		if (dataList == null)
			return;
		$("#"+this.id).empty();
		this.menuList = new Array();
		for (var i = 0; i < dataList.length; i++) {
			var data = dataList[i];
			if (data != null) {
				var config = {};
				config.cdmc = data.cdmc;
				config.childrenMenuList = data.childrenMenuList;
				var menuLi = new MenuLi(config);
				this.menuList.push(menuLi);
			}
		}

		for (var i = 0; i < this.menuList.length; i++) {
			$("#" + this.id).append(this.menuList[i].getHtmlAsMenu());
		}
	}
}

var MenuLi = function(config) {
	if (config == null) {
		this.cssClass = "layui-nav-item layui-nav-itemed";
		return;
	}

	// css class
	if (config.cssclass == null) {
		this.cssClass = "layui-nav-item";
	} else
		this.cssClass = config.cssClass;

	// 超链接
	if (config.link == null) {
		this.link = "javascript:;";
	} else
		this.link = config.link;

	// 是否有
	if (config.cdmc == null) {
		this.cdmc = "空";
	} else
		this.cdmc = config.cdmc;

	if (config.childrenMenuList == null) {
		this.childrenMenuList = new Array();
	} else {
		var childrenMenuList = config.childrenMenuList;
		for (var i = 0; i < config.childrenMenuList.length; i++) {
			var data = childrenMenuList[i];
			if (data != null) {
				var config = {};
				config.cdmc = data.cdmc;
				config.childrenMenuList = data.childrenMenuList;
				var menuLi = new MenuLi(config);
				this.childrenMenuList=new Array();
				this.childrenMenuList.push(menuLi);
			}
		}
	}
}

MenuLi.prototype = {
	getHtmlAsMenu : function() {
		var $li=$("<li></li>");
		var $a=$("<a></a>");
		var $span=$("<span></span>");
		$span.attr("class","layui-nav-more");
		$a.append(this.cdmc);
		$a.append($span);
		$li.attr("class",this.cssClass);
		$li.append($a);
		return $li.prop("outerHTML");
	},
	getHtmlAsMenuItem : function() {
		if (childrenMenuList.length <= 0) {
			return "";
		}
		
		$dl=$("<dl></dl>");
		$dl.attr("class","layui-nav-child");
		for (var i = 0; i < this.childrenMenuList.lenth; i++) {
			$a=$("<a></a>");
			$a.attr("href",this.link);
			var $dd=$("<dd></dd>")
			$dd.append($a);
			$dl.append($dd);
		}
		
		return $dl.prop("outerHTML");
	}

}

/**/