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
				config.cdlj=data.cdlj;
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
	if (config.cdlj == null) {
		this.cdlj = "javascript:;";
	} else
		this.cdlj = config.cdlj;

	// 是否有
	if (config.cdmc == null) {
		this.cdmc = "空";
	} else
		this.cdmc = config.cdmc;

	if (config.childrenMenuList == null) {
		this.childrenMenuList = new Array();
	} else {
		var childrenMenuList = config.childrenMenuList;
		this.childrenMenuList=new Array();
		for (var i = 0; i < config.childrenMenuList.length; i++) {
			var data = childrenMenuList[i];
			if (data != null) {
				var config2 = {};
				config2.cdmc = data.cdmc;
				config2.childrenMenuList = data.childrenMenuList;
				var menuLi = new MenuLi(config2);
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
		$a.attr("href",this.cdlj);
		$a.append($span);
		$li.attr("class",this.cssClass);
		$li.append($a);
		$li.append(this.getHtmlAsMenuItem());
		return $li.prop("outerHTML");
	},
	getHtmlAsMenuItem : function() {
		if (this.childrenMenuList.length <= 0) {
			return "";
		}
		
		$dl=$("<dl style='padding-left:10px;'></dl>");
		$dl.attr("class","layui-nav-child");
		for (var i = 0; i < this.childrenMenuList.length; i++) {
			$a=$("<a></a>");
			$a.attr("href",this.childrenMenuList[i].link);
			$a.append(this.childrenMenuList[i].cdmc);
			var $dd=$("<dd></dd>")
			$dd.append($a);
			$dl.append($dd);
			
		}
		
		return $dl.prop("outerHTML");
	}

}

/**/