var Menu = function(config) {
	this.id=config.id;
	this.menuList=config.menuList;
	return this;
}

Menu.prototype = {
	constructor:DoublePoint.Menu,	
	
	
	setData : function(dataList) {
		if(dataList==null)
			return;
//		$("#"+this.id).empty();
		this.menuList=new Array();
		for(var i=0;i<dataList.length;i++){
			var data=dataList[i];
			if(data!=null){
				var config={};
				config.cdmc=data.cdmc;
				var menuLi=new MenuLi(config);
				this.menuList.push(menuLi);
			}
		}
		
		for(var i=0;i<this.menuList.length;i++){
			$("#"+this.id).append(this.menuList[i].getHtml());
			//$("#"+this.id).append("111111111111111111111111111");
		}
	}
}

var MenuLi=function(config){
	
	if(config==null){
		this.cssClass="layui-nav-item layui-nav-itemed";
		return;
	}
	
	//css class
	if(config.cssclass==null){
		this.cssClass="layui-nav-item";
	}
	else 
		this.cssClass=config.cssClass;
	
	//超链接
	if(config.link==null){
		this.link="#";
	}
	else 
		this.link=config.link;
	
	//是否有
	if(config.cdmc==null){
		this.cdmc="空";
	}
	else 
		this.cdmc=config.cdmc;
}

MenuLi.prototype = {
		getHtml:function(){
			return '<li class="'+this.cssClass+'"><a href="javascript:;">'+this.cdmc+'<span class="layui-nav-more"></span></a>'+'<dl class="layui-nav-child">'+
			'<dd><a href="javascript:;">移动模块</a></dd><dd><a href="javascript:;">后台模版</a></dd><dd><a href="javascript:;">电商平台</a></dd></dl></li>';
		}
}


/**/