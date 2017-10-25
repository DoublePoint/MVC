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
		// $("#"+this.id).empty();
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
			$("#" + this.id).append(this.menuList[i].getHtml());
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
				this.menuList.push(menuLi);
			}
		}
	}
}

MenuLi.prototype = {
	getHtmlAsMenu : function() {
		return '<li class="' + this.cssClass + '"><a href="javascript:;">'
				+ this.cdmc + '<span class="layui-nav-more"></span></a>'
				+ getHtmlAsMenuItem() + '</li>';
	},
	getHtmlAsMenuItem : function() {
		if (childrenMenuList.length <= 0) {
			return "";
		}
		var retrunhtml = "";
		returnhtml = returnhtml + '<dl class="layui-nav-child">';
		for (var i = 0; i < this.childrenMenuList.lenth; i++) {
			returnhtml = returnhtml + '<dd><a href="' + this.link + '">'
					+ this.cdmc + '</a></dd>';
		}
		returnhtml = returnhtml + '</dl>';
	}

}

/**/