// widget 需要被定位的dom     caller:参照物

  function setMenuPosition(widget, caller,id,direction,parentWidget,menuItemCount,type) { 
		var el = widget;
		el[0].style.position = 'absolute';
		var browserTypes = new BrowserTypes();
		var referrer = caller;
		var  referoffsetLeft=0;
		var  referoffsetTop=0;
		
	    referoffsetLeft=referrer.offset().left;
		referoffsetTop=referrer.offset().top;
		 
		var subdims = {
			refW: el.getTotalWidth(),
			refH: el.getTotalHeight()
		}

		var diffWidth = 0;//记录和父的left差
		if(type == undefined){
			if(direction == "horizontal"){
				diffWidth = parentWidget.getTotalWidth();
				if(parentWidget.parent().parent().parent().attr("direction") == "right"){
					
					if(referoffsetLeft + subdims.refW +  diffWidth > document.body.clientWidth){//右侧显示不开，在菜单的左侧显示
	     				diffWidth = 0 - subdims.refW;
	     				widget.find(".submenu-container").attr("direction","left");
	     				
	     			}
				}else{//上级菜单已经在左侧了，其子菜单也是在左侧显示
					diffWidth = 0 -subdims.refW;
					widget.find(".submenu-container").attr("direction","left");
				}
			}
		}else{
			diffWidth = caller.width();
		}
		
		var dims = {
			
			refX: referoffsetLeft+diffWidth,
			refY: referoffsetTop,
			refW: referrer.getTotalWidth(),
			refH: referrer.getTotalHeight()
		};	
		if(direction == "vertical"){
			dims.refY = dims.refY + parentWidget.getTotalHeight()+5;
		}else{
			dims.refY = dims.refY ;
		}
		
		var xVal, yVal, helper ,helperIframe;
		var  helperleft=0;
     	helperleft=dims.refX;
     	var windowHeight = $(window).height();
     	var subMenuHeight = parseInt($(".submenu-item",$("#haiyi-thecondmenu")).height());
     	var menuHeight = menuItemCount * subMenuHeight ;
     	
     	if((dims.refY + menuHeight) > (windowHeight-30)){//菜单竖直放不下了,为了主题3样式而加
     		dims.refY = dims.refY - menuHeight + 40;
     	}
		$("#positionHelper"+id).css({ display:'block',position: 'absolute', left: helperleft, top: dims.refY, width: subdims.refW  ,zIndex:9999});
		$("#positionHelperIframe"+id).css({ display:'block',background:"transparent",position: 'absolute', left: helperleft, top: dims.refY, height:menuHeight,width: subdims.refW,zIndex:9998 });

	 	xVal = 0; 		
		yVal = dims.refH;
		el.css({ bottom: 'auto', top: 0 });
}

  Haiyisoft.DefaultMenu = Haiyisoft.extend(Haiyisoft.Component,{
  	
  	/********************重写父类的方法*************/
 	constructor: function(config){
         config.menuMap = new Map();
      
         config._subMenuIds = ['haiyi-firstmenu','haiyi-thecondmenu','haiyi-threemenu','haiyi-fourmenu','haiyi-fivemenu','haiyi-sixmenu'];
         config._menuTimeOut = null;
         config.lastOpenFirstChildrenMenu = null;//记录上一次打开的第一级菜单的子菜单
         config.options = {step:7, speed:60, leftAct:"leftAct", leftEnd:"leftEnd", rightAct:"rightAct", rightEnd:"rightEnd"};
         
		 Haiyisoft.DefaultMenu.superclass.constructor.call(this, config);//执行完这个后，就会调用initComponent
		
    },
  	initComponent:function(){
		Haiyisoft.DefaultMenu.superclass.initComponent.call(this);//调用 父的initComponent
		/**配置参数*/
		var goLeftCss = "goLeft", leftEndCss = "leftEnd",goRightCss = "goRight";
         if(!$msie){
         	goLeftCss = "goLeft-chrome";
         	leftEndCss = "leftEnd-chrome";
         	goRightCss = "goRight-chrome";
         }
        var config = this.initialConfig;
        //, divHeight=""; 
        if(config.direction!=""&&config.direction=="v"){//竖向显示
        	config.firstMenuTemplateHtml =
					                   "			 <table id='"+config.menuId+"_table_rollBox' class='first-menu-table' style='line-height:27px;width:150px;' cellspacing='0' cellpadding='0'>"+
					                   "                    <tbody>"+
					                   "                          {firsMenuContentHtml}"+
					                   "                    </tbody>"+
					                   "                  </table>   "		;				
        }else{//横向显示
        	//divHeight= config.firstMenuHeight;
        	config.firstMenuTemplateHtml = " <table cellspacing=0 cellpadding=0 >"+
					                   "	<tbody>"+
					                   "		<tr style='height:100%'>"+
					                   "			<td valign='middle'>"+
					                   "			   <div id='"+config.menuId+"_parent_tagScroll' class='tag' style='height:100%'>"+
					                   "				<div id='"+config.menuId+"_table_tagLeft' class='tablectrl "+goLeftCss+" "+leftEndCss+"' style='height:100%;display:none'>向左</div>"+
					                   "                <div id='"+config.menuId+"_table_tagScroll' class='first-menu-container'>"+
					                   "				 <table id='"+config.menuId+"_table_rollBox' class='first-menu-table' style='width:{tableWidth}px;' cellspacing='0' cellpadding='0'>"+
					                   "                    <tbody>"+
					                   "                          {firsMenuContentHtml}"+
					                   "                    </tbody>"+
					                   "                  </table>   "	+					
					                   "				</div>"+
					                   "				<div id='"+config.menuId+"_table_tagRight' class='tablectrl "+goRightCss+"' style='height:100%;display:none'>向右</div>"+
					                   "            </td>"+
									   "		</tr>"+
									   "	</tbody>"+
									   "  </table>";
        }
         

         config.childrenMenuItemTemplateHtml = "<div style='width:{menuWidth}px' class='submenu-container' direction='right'>"+
         									   "  <table cellspacing=0 cellpadding=0 style='width:100%;'>"+
					    					   "	<tbody>"+
					    					   "	       {menuItemTrHtml}"+
					    					   "    </tbody>"+
					    					   "  </table>"+
					    					   "</div>";

		config.childrenOneMenuTrtemplateHtml = "<tr  code='{code}' id='{code}' level='{level}'  class='submenu-item'>"+
											   " {menuItemTdHtml}"+
											   "</tr>";

		config.childrenOneMenuTdtemplateHtml = "<td class='submenu-item-first-td'>"+
											   "<span class='{submenu-indicate-flag}'></span>"+
											   "</td>"+
											   "<td>" +  
											   "   {everyMenuItemContent}"+
											   "</td>"+
											   "<td class='submenu-arrow-td'>"+
											   "<span class='{submenu-arrow-img}'></span>"+
											   "</td>";
											   
											   
		var me = this;
		
        this._delayTime = 300;
        this._overPreMenu = null,
   		this._currentMenu = null;
   		this._menuSelectItem = [null,null,null,null,null,null];//记录每级菜单 中的哪个菜单项有 鼠标经过的样式
        this._options={step:7, speed:60, leftAct:"leftAct", leftEnd:"leftEnd", rightAct:"rightAct", rightEnd:"rightEnd"};
        this.moveEvent = null;
        this.rightDisabled = 0;
        this.lastFirstMouseMenu = null;//记录上一次鼠标经过的一级菜单的tr
        
		//在这里增加相应的监听事件
		this.on("firstMenuClick",function(target){	
			me.firstMenuClick(target);
		});

		this.on("menuItemClick",function(target){//
			me.menuItemClick(target);
		});
		//
		this.onRender();//调用Component的onRender
	},
	
	render:function(){
		//绘制过程
		this._generateMenuMap();
		//绘制第一层菜单的外围
		var _firstMenuHtml = this._replace(this.initialConfig.firstMenuTemplateHtml, "{firsMenuContentHtml}", this._generateFirstMenuContent());
		_firstMenuHtml = this._replace(_firstMenuHtml,"{tableWidth}",this._getFirstMenuTableWidth());

		$("#"+this.initialConfig.menuId).html(_firstMenuHtml);//把生成的table加到div下
		this._bindFirstMenuEvent();//给第一层菜单绑事件

		this._generateChildrenDiv();//产生子菜单的父div
		var me = this;
		$(document).ready(function(){
         var divMenuId = me.initialConfig.menuId;
         if(me.initialConfig.direction=="h"){
         	me._tabScroll(divMenuId);//该方法是增加左边和右边的小按钮
         }
         
       }) ;

  	   window.onresize = function(){
			 clearInterval(me.moveEvent);
			 me._tabScroll(me.initialConfig.menuId);
		}
	},
	  _tabScroll : function(id){
		function getId (idValue){
			return "string" ==typeof idValue?document.getElementById(idValue):idValue;
		}
	    var me = this ;
	    var oDiv = getId(id + "_table_tagScroll"),//外层div
	        oDiv_ParentDiv = getId(id +"_parent_tagScroll");
		    oTable = getId(id + "_table_rollBox"),//菜单主体的最外层table
		    oCtrlLL = getId(id + "_table_tagLeft"),//向左箭头
		    oCtrlRR = getId(id + "_table_tagRight");//向右箭头
	   
		var oDivWidth = document.body.clientWidth-210;// -210 ，菜单左右的角色桌面等宽度
		oDiv.style.width = oDivWidth+ "px";
		oDiv_ParentDivWidth = parseInt(oDivWidth) + 30;// 加上30，是给左右箭头留出宽度
		
		oDiv_ParentDiv.style.width = oDiv_ParentDivWidth + "px";
		var oTableWidth = oTable.clientWidth;
		if(parseInt(oTableWidth)  > parseInt(oDivWidth)){//左右滚动箭头出现
			$(oCtrlLL).css("display","block");
			$(oCtrlRR).css("display","block");
		}else{
			$(oCtrlLL).css("display","none");
			$(oCtrlRR).css("display","none");
		}
		
		step = Math.abs(this.initialConfig.options.step);
		speed= Math.abs(this.initialConfig.options.speed);
		$(oCtrlLL).unbind("mouseover")
	             .unbind("mousedown")
	             .unbind("mouseout")
	             .unbind("mouseup");
	    $(oCtrlRR).unbind("mouseover")
	             .unbind("mousedown")
	             .unbind("mouseout")
	             .unbind("mouseup");
	      var leftAct = "leftAct",rightAct = "rightAct";       
	     if(!$msie){
         	leftAct = "leftAct-chrome";
         	rightAct = "rightAct-chrome";
         	
         }
              
	    $(oCtrlLL).bind("mouseover",function(){$(oCtrlLL).addClass(""+leftAct+"");})
	             .bind("mousedown",function() {me._goLeft(); })
	             .bind("mouseout",function() { me._stopFun(); $(oCtrlLL).removeClass(""+leftAct+""); })
	             .bind("mouseup", function() { me._stopFun(); $(oCtrlLL).removeClass(""+leftAct+""); });
	
	    $(oCtrlRR).bind("mouseover",function(){$(oCtrlRR).addClass(""+rightAct+"");})
	             .bind("mousedown",function() {me._goRight();  })
	             .bind("mouseout", function() { me._stopFun(); $(oCtrlRR).removeClass(""+rightAct+"");})
	             .bind("mouseup",function() { me._stopFun(); $(oCtrlRR).removeClass(""+rightAct+""); });

	},
	
	_goLeft:function(){
	    var me = this;
		me.moveEvent = window.setInterval(function(){
			me._goLeftScroll();
		}, speed);
	},
	_goRight: function(){
	     var me = this;
		me.moveEvent = window.setInterval(function(){me._goRightScroll();}, speed);
	},
	
	 _goRightScroll:function(){
	 	var leftEnd = "leftEnd", rightEnd = "rightEnd";
	 	if(!$msie){
         	leftEnd = "leftEnd-chrome";
         	rightEnd = "rightEnd-chrome";
         }
         
		var me = this;
		var oDiv = document.getElementById( me.initialConfig.menuId + "_table_tagScroll")
		oDiv.scrollLeft += this.initialConfig.options.step; 
		if(oDiv.scrollLeft != 0){
			$("#"+me.initialConfig.menuId+"_table_tagLeft").removeClass(""+leftEnd+"");
		}
		
		if(this.rightDisabled == oDiv.scrollLeft){
			$("#"+me.initialConfig.menuId+"_table_tagRight").addClass(""+rightEnd+"");
		}else{
			this.rightDisabled = oDiv.scrollLeft;
		}
	},
	
     _goLeftScroll: function(){
     		var leftEnd = "leftEnd", rightEnd = "rightEnd";
     	if(!$msie){
         	leftEnd = "leftEnd-chrome";
         	rightEnd = "rightEnd-chrome";
         }
         
    	var me = this;
		var oDiv = document.getElementById( me.initialConfig.menuId + "_table_tagScroll")
		oDiv.scrollLeft -= this.initialConfig.options.step; 
		if(oDiv.scrollLeft == 0){
			$("#"+me.initialConfig.menuId+"_table_tagLeft").addClass(""+leftEnd+"");
		}else{
			$("#"+me.initialConfig.menuId+"_table_tagRight").removeClass(""+rightEnd+"");
		}
	},
   _stopFun : function(){
	  
	    clearInterval(this.moveEvent);
	},

    /******************该组件特有的方法，子类不会去重载************************/

	_generateChildrenDiv:function(){
		var _html = "";
		for(var i=0;i<this.initialConfig._subMenuIds.length;i++){
			_html = "<iframe id='positionHelperIframe"+this.initialConfig._subMenuIds[i]+"'  frameborder='no' border='0'' style='top:-9999px;position:absolute;z-index:9998;background:transparent'></iframe>";
			_html = _html + "<div id='positionHelper"+this.initialConfig._subMenuIds[i]+"'  frameborder='no' border='0'' style='top:-9999px;position:absolute;z-index:9999;background:transparent'>"+
			                  "<div id='"+this.initialConfig._subMenuIds[i]+"' style='position:absolute'></div> </div>";
			
			$("body").append(_html);
		}
	},
	/**
	*第一层菜单相关事件的绑定
	*/
	_bindFirstMenuEvent:function(){
		var me = this ,_code = null;
		$("#"+this.initialConfig.menuId+"_table_rollBox").delegate('.first-menuitem-td', 'mouseenter', function(event) {
			// me.fireEvent("firstMenuMouseover",this);
			me.firstMenuMouseover(this);
			_code = $(this).attr("menucode")
			if(me.lastFirstMouseMenu != undefined){
				if(_code != $(me.lastFirstMouseMenu).attr("menucode")){//移到新的第一级菜单
					me.firstMenuMouseout(me.lastFirstMouseMenu);
					me.lastFirstMouseMenu = this;
				}
			}else{
				me.lastFirstMouseMenu = this;
			}
			 me._openFirstMenuChildren(_code,$(this),$(this).attr("id"));
		});

		$("#"+this.initialConfig.menuId+"_table_rollBox").delegate('.first-menuitem-td', 'mouseleave', function(event) {
			// me.fireEvent("firstMenuMouseout",this);
			 me._hiddenMenuChildren($(this).attr("menucode"),0);
		});

		$("#"+this.initialConfig.menuId+"_table_rollBox").delegate('.first-menuitem-td', 'click', function(event) {
			// me.fireEvent("firstMenuMouseover",this);
			//若没有子菜单，单击，打开相应的菜单 
			me._openMenuTask($(this).attr("menucode"));
			me.fireEvent("firstMenuClick",this);
		});	
	},

    _openFirstMenuChildren:function(menuCode,reference,referenceId){
    	
    	var menu = this.initialConfig.menuMap.get(menuCode);
    	if(menu.children == undefined){
    		clearTimeout(this.initialConfig._menuTimeOut);
    		this._hiddenMenuDom(0);//消失上一次打开的第一级子菜单
    		return;
    	}
        var menuItemHtml = this._getChildrenMenuHtml(menu,1);
 		var menuObj = $("#"+this.initialConfig._subMenuIds[1]) ;
 		menuObj.get(0).innerHTML = menuItemHtml;
 		//显示第一级子菜单
       this._showFirstMenuChildren(menuCode,menuObj,reference,referenceId,1);
    },
    //获取一个子菜单的html
    _getChildrenMenuHtml :function(menu,level){
    	var menuItemTrHtmls = "",tempHtml = "",menChildren = "";
        var menuChildrenWidth = "",menuChildren = [];
        
        for(var i=0;i<menu.children.length;i++){
        	menuChildren.push(this.initialConfig.menuMap.get(menu.children[i]));
        }
        menuChildrenWidth = this.getMenuChildrenWidth(menuChildren);

    	for(var i=0;i<menu.children.length;i++){
                menChildren = this.initialConfig.menuMap.get(menu.children[i]);
                menChildren.level = level;//设置菜单的menu的level,当消失时，消失level比其高的子菜单即可
    			tempHtml = this.initialConfig.childrenOneMenuTrtemplateHtml;//获取tr
                tempHtml = this._replace(tempHtml,"{code}",menChildren.code);
                tempHtml = this._replace(tempHtml,"{level}",level);

                //获取菜单的td的HTML
                tempHtml = this._replace(tempHtml,"{menuItemTdHtml}",this.getChildrenMenuTdHtml(menChildren));//获取tr里的td HTML
                menuItemTrHtmls =  menuItemTrHtmls + tempHtml;
    	}
    	
 		var menuItemHtml = this.initialConfig.childrenMenuItemTemplateHtml;
 		menuItemHtml = this._replace(menuItemHtml,"{menuItemTrHtml}",menuItemTrHtmls);
 		menuItemHtml = this._replace(menuItemHtml,"{menuWidth}",menuChildrenWidth);
 		return menuItemHtml;
    },
    _hiddenMenuChildren:function(menuCode,level){
    	var me = this;
    	me._overPreMenu = this.initialConfig.menuMap.get(menuCode);

    	this.initialConfig._menuTimeOut =  window.setTimeout (function(){
		     me._hiddenMenuDom(level);
		},me._delayTime);
       this.initialConfig.lastOpenFirstChildrenMenu = menuCode;
    },

   _showFirstMenuChildren : function(menuCode,menuObj,reference,referenceId,level){
   	  
       clearTimeout(this.initialConfig._menuTimeOut);//有可能是在同一个菜单触发了out与over事件
   	   // menuObj.css("display","block"); 
   	   var _menu = this.initialConfig.menuMap.get(menuCode);
	   		if( this.initialConfig.direction=="v"){
	   			 setMenuPosition(menuObj, reference,this.initialConfig._subMenuIds[level],"horizontal",reference,_menu.children.length,'haiyisoft3') ;
	   
	   		}else{
	   			 setMenuPosition(menuObj, reference,this.initialConfig._subMenuIds[level],"vertical",reference,_menu.children.length) ;
       
	   		}
       
       //在这里消失上次打开菜单的子菜单，上次打开的菜单已经被当前打开的菜单替换了，但其打开的子菜单还是存在的
       for(var i=level + 1;i < this.initialConfig._subMenuIds.length;i++){
   	   	   $("#positionHelper"+this.initialConfig._subMenuIds[i]).css("top","-9999px");
           $("#positionHelperIframe"+this.initialConfig._subMenuIds[i]).css("top","-9999px");
   	   }

       //给子菜单绑定监听事件
       this._bindChildrenMenuEvent(1);
   }, 
   /**
   *给非第一级的菜单委托相关事件
   */
   _bindChildrenMenuEvent:function(level){
   		var me = this,_code = "";
   		var _code="",outTarget = null;
   		   
   		$("#"+this.initialConfig._subMenuIds[level]).undelegate('.submenu-item', 'mouseenter');
   		$("#"+this.initialConfig._subMenuIds[level]).delegate('.submenu-item', 'mouseenter', function(event) {
   			
			clearTimeout(me.initialConfig._menuTimeOut);
           
		    _code = $(this).attr("code");
		    me._currentMenu = me.initialConfig.menuMap.get(_code);
			if(me._overPreMenu ==  null || (me._overPreMenu.code != me._currentMenu.code && me._overPreMenu.level == me._currentMenu.level)){////同一级的，和上一次不是同一个menu ,直接执行 over事件
				me.childrenMenuMouseover(this);
				me._menuSelectItem[me._currentMenu.level] = me._currentMenu;
				//消失mouseover 或select事件
				if(me._overPreMenu != null){
					outTarget = $("#"+me._overPreMenu.code)[0];
					me.childrenMenuMouseout(outTarget);
				}

			}else if(me._overPreMenu.code == me._currentMenu.code){//和上一次的menu相同
				
				return;
			}else if(me._menuIsParentChildren(me._overPreMenu,me._currentMenu)){//是父子关系
				
				 /* if(this.style.backgroundImage.indexOf("menuitem-select.png") > 0){//若有select样式，什么都不做
					//有可能是上次打开到第四级，然后单击该菜单，则整个菜单消失，下次在打开时，从第三级打开，这时第四级已经打开了，
					//并且刚才单击的菜单还有mouseover样式，鼠标移到其亲兄弟节点时,这个mouseover样式也不会消失，就出现了两个mouseover事件
					if(_preMouseoverMenu != null){
						cancelMouseOver(_preMouseoverMenu);
					}
				  }else if(_currentMenu.children == undefined){//若没有子，则直接加上over样式
					mouseOverEvent(this);
				  }else{
					//若有子，在openMenu那里加上select样式
				  }*/
				  me._menuSelectItem[me._currentMenu.level] = me._currentMenu;
				  me.childrenMenuMouseover(this);

			}else{//不在同一级，不是父子关系,上一次的select也是在这里消失,
				
				//去找子时，可能会经过父的亲兄弟节点，这时其兄弟节点被增加了mouseover样式，需要将其删除
				//outTarget = $("#"+me._overPreMenu.code)[0];
				//me.childrenMenuMouseout(outTarget);
				me._cancelWhichMenSelect(me._currentMenu);//与_currentMenu同一级的上一次的select也在这里消失
				me._menuSelectItem[me._currentMenu.level] = me._currentMenu;
				me.childrenMenuMouseover(this);
				
			}
			me._overPreMenu = 	me._currentMenu;
			me._openChildrenMenu(me._currentMenu);
		});

         $("#"+this.initialConfig._subMenuIds[level]).undelegate('.submenu-item', 'mouseleave');

         $("#"+this.initialConfig._subMenuIds[level]).delegate('.submenu-item', 'mouseleave', function(event) {
         		
		    		//这里的消失是鼠标完全移出了所有的子菜单，测消失所有的子菜单 
		    		me.initialConfig._menuTimeOut =  window.setTimeout (function(){
					     me._hiddenMenuDom(0);
					     me.firstMenuMouseout(me.lastFirstMouseMenu);//执行第一级的mouseout事件
					},me._delayTime);
         });

         $("#"+this.initialConfig._subMenuIds[level]).undelegate('.submenu-item', 'click');

         $("#"+this.initialConfig._subMenuIds[level]).delegate('.submenu-item', 'click', function(event) {
         		
		    		//这里的消失是鼠标完全移出了所有的子菜单，测消失所有的子菜单 
		    		me._openMenuTask($(this).attr("code"));
		    		me.firstMenuMouseout(me.lastFirstMouseMenu);
		    		me.fireEvent("menuItemClick",this);
		    		me._hiddenMenuDom(0);
         });

   },

   _hiddenMenuDom:function(level){
   	   level = parseInt(level);
   	   var me = this;
   	   for(var i=level + 1;i < this.initialConfig._subMenuIds.length;i++){
   	   	   $("#positionHelper"+this.initialConfig._subMenuIds[i]).css("top","-9999px");
           $("#positionHelperIframe"+this.initialConfig._subMenuIds[i]).css("top","-9999px");
   	   }
   	 
   },
    
	/**
	*打开菜单对应的页面
	*/
	_openMenuTask:function(menuCode){
		var _menu = this.initialConfig.menuMap.get(menuCode);
		if(_menu.children == undefined){
			if(_menu.entity != ""){
		     		var _link = _menu.entity;
		     		if(_link.indexOf("?")>0){
						_link+="&appCode="+_menu.code;
					}else{
						_link+="?appCode="+_menu.code;
					}
					if(defaultCloseFirstTask == "Y") {
						window.MultitaskPanelManager.addMenuTab(_menu.code,_menu.name,_link,true,false,defaultCloseFirstTask);
					} else {
					 	window.MultitaskPanelManager.addMenuTab(_menu.code,_menu.name,_link,true);
					}	
		     	}
		}
	},

	 _menuIsParentChildren : function(menu1,menu2){//菜单是否是父子关系
    	var flag = false;
    	if(menu2.children != undefined){
    		for(var i=0;i<menu2.children.length;i++){
    			if(menu2.children[i] == menu1.code){
    				flag = true;
    				break;
    			}
    		}
    	}else if(menu1.children != undefined){
    		for(var i=0;i<menu1.children.length;i++){
    			if(menu1.children[i] == menu2.code){
    				flag = true;
    				break;
    			}
    		}
    	}
    	if(!flag){
	    	if(menu2.children != undefined && menu1.children != undefined){
	    		for(var i=0;i<menu2.children.length;i++){
	    			if(menu2.children[i] == menu1.code){
	    				flag = true;
	    				break;
	    			}
	    		}
	    		if(!flag){
	    			for(var i=0;i<menu1.children.length;i++){
		    			if(menu1.children[i] == menu2.code){
		    				flag = true;
		    				break;
		    			}
	    			}
	    		}
	    	}
    	}
    	
    	return flag;
    },
	
    _generateMenuMap:function(){
    	var maxLevel = 0;
    	var menuBean = this.initialConfig.menuBean;
    	var me = this;
    	for(var i=0;i<menuBean.length;i++){
			obj = {};
			obj.name = menuBean[i][1];
			obj.entity = menuBean[i][2];
			obj.code = menuBean[i][3];
			obj.level = 0;
			key = menuBean[i][3];
			if(menuBean[i].length > 5){//有孩子
				children = [];
				for(var j=5;j<menuBean[i].length;j++){
					children.push(menuBean[i][j][3]);
				}
				obj.children = children;
			}
			this.initialConfig.menuMap.put(key,obj);
			for(var j=5;j<menuBean[i].length;j++){
				generatesubMenuMap(menuBean[i][j]);
			}
		}

    	 function generatesubMenuMap(subMenuBean){
			obj = {};
			obj.name = subMenuBean[1];
			obj.entity = subMenuBean[2];
			obj.code = subMenuBean[3];
			obj.imgsrc = subMenuBean[0];
			
			key = subMenuBean[3];
			if(subMenuBean.length > 5){//有孩子
				children = [];
				for(var j=5;j<subMenuBean.length;j++){
					children.push(subMenuBean[j][3]);
				}
				obj.children = children;
			}
			me.initialConfig.menuMap.put(key,obj);
			for(var j=5;j<subMenuBean.length;j++){
				generatesubMenuMap(subMenuBean[j]);
			}
		}
    },
     
    _replace :function(original, regulation, repstr){
		return original.replace(new RegExp(regulation, "g"), repstr);
	},
	/**
		产生第一级菜单的最终html
	*/
    _generateFirstMenuContent:function(){
    	var _menuBean = this.initialConfig.menuBean,_subItem = null,_html,_menuBarHtml="";
    	var _derection = this.initialConfig.direction;
    	for (var i = 0; i < _menuBean.length; i++){
	    	_subItem =  _menuBean[i];
	    	_html = this._getFisrtSubMenuHtml(_subItem[3],_subItem[1],_derection);
	    	_menuBarHtml = _menuBarHtml + _html;
	    }
	    if(_derection=="h"){
	    	_menuBarHtml="<tr>"+_menuBarHtml+"</tr>"
	    }
	    return _menuBarHtml;

    },
    /**
    *获取第一级横向所有菜单项的宽度
    */
    _getFirstMenuTableWidth : function(){
    	var _menuBean = this.initialConfig.menuBean,_subItem = null,_menu = null,_menuItemWidth=0,_menuTableWidth=0;
    	for (var i = 0; i < _menuBean.length; i++){
	    	_subItem =  _menuBean[i];
	    	
	    	_menuItemWidth = parseInt(this.getFirstMenuItemWidth(_subItem[3],_subItem[1]));
	    	_menuTableWidth = _menuTableWidth + _menuItemWidth;
	    }
	    return _menuTableWidth;

    },
    /**
	*获取第一层菜单的每个菜单子项的html 
    */
    _getFisrtSubMenuHtml:function(menuCode,menuItemContent,direction){
    	var width = this.getFirstMenuItemWidth(menuCode,menuItemContent);
		var menuItemHtml ="";
		if(direction!=""&&direction=="v"){
			menuItemHtml= "<tr><td align='center' width='"+width+"px' class='first-menuitem-td' id='"+menuCode+"' menuCode='"+menuCode+"'>",_html = "";
			_html = this.getFirstMenuItemHtml.call(this,menuCode,menuItemContent);
	    
	    	menuItemHtml = menuItemHtml + _html;
	    	menuItemHtml = menuItemHtml + "</td></tr>";
		}else {
			menuItemHtml= "<td align='center' width='"+width+"px' class='first-menuitem-td' id='"+menuCode+"' menuCode='"+menuCode+"'>",_html = "";
			_html = this.getFirstMenuItemHtml.call(this,menuCode,menuItemContent);
	    
	    	menuItemHtml = menuItemHtml + _html;
	    	menuItemHtml = menuItemHtml + "</td>";
		}
		
    	return menuItemHtml;
    },
    _openChildrenMenu:function(menu){   	
		var me = this;
		
        //清空其子即子的子菜单    	
		if(menu.children != undefined){
    		me._showHorizontalMenuComponent(menu);//物理打开菜单
    		me._hiddenMenuDom(menu.level+1);//将子的下一级关闭，子的html会被新打开的菜单替换
		}else{
	    	me._hiddenMenuDom(menu.level);
		}
    },
     
    _showHorizontalMenuComponent :function(menu){
        var level = menu.level + 1;
    	var menuItemHtml = this._getChildrenMenuHtml(menu,level);
 		var menuObj = $("#"+this.initialConfig._subMenuIds[level]) ;
 		menuObj.get(0).innerHTML = menuItemHtml;
        var reference = $("#"+menu.code);
        var _menu = this.initialConfig.menuMap.get(menu.code);
       setMenuPosition(menuObj, reference,this.initialConfig._subMenuIds[level],"horizontal",reference,_menu.children.length) ;
       $("#positionHelper"+this.initialConfig._subMenuIds[level]).css("display","block"); 
       $("#positionHelperIframe"+this.initialConfig._subMenuIds[level]).css("display","block"); 
       

       //给子菜单绑定监听事件
       this._bindChildrenMenuEvent(level);
    },

    _cancelWhichMenSelect:function(menu){
    	var lastMouseoverMenu = this._menuSelectItem[menu.level];
    	this.childrenMenuMouseout($("#"+lastMouseoverMenu.code)[0]);//子类重写了该方法，会调用子类的该方法
    },


    //----------------------------以下方法子类可以重载--------------------------------
      /***
	* 第一级菜单鼠标经过样式，target为第一级菜单的每个td 的dom元素
	*/
	firstMenuMouseover:function(target){
		$(target).addClass('first-menu-mouseover');
		$(target).get(0).style.cursor = "pointer";
	},
	/***
	* 第一级菜单鼠标离开样式，target为第一级菜单的每个td 的dom元素
	*/
	firstMenuMouseout:function(target){
		$(target).removeClass('first-menu-mouseover');
	},
    
    /**
     *非第一级竖直菜单的鼠标经过样式，target为tr的dom元素
     * 
     */
	childrenMenuMouseover : function(target){
	 	$(target).find("td:eq(0)").removeClass("submenu-item-first-td");
		$(target).addClass("submenu-mouseover");
	},
     /**
     *非第一级竖直菜单的鼠标经过样式，target为tr的dom元素
     *  
     */
	childrenMenuMouseout : function(target){
	 	$(target).find("td:eq(0)").addClass("submenu-item-first-td");
		$(target).removeClass("submenu-mouseover");
	},

	/**
    *获取竖直菜单项的html，其父级的元素为tr,menu为子菜单类, menu.name  菜单内容  | menu.code 菜单的code  |  menu.entity  菜单的单击路径    menu.children 为菜单的子菜单，若没有子菜单，则menu.children == undefined
    */
     getChildrenMenuTdHtml : function(menu){
     	
     	var tempHtml = this.initialConfig.childrenOneMenuTdtemplateHtml;
     		tempHtml = this._replace(tempHtml,"{everyMenuItemContent}",menu.name);
            if(menu.children == undefined){//没有孩子节点 
            	tempHtml = this._replace(tempHtml,"{submenu-indicate-flag}","submenu-indicate-close");
            	tempHtml = this._replace(tempHtml,"{submenu-arrow-img}","");
            }else{
            	tempHtml = this._replace(tempHtml,"{submenu-indicate-flag}","submenu-indicate-open");
            	tempHtml = this._replace(tempHtml,"{submenu-arrow-img}","submenu-arrow-img");
            }
        return tempHtml;

     },
   
    /**
    *显示竖直子菜单的宽度       一般是遍历所有的当前子菜单，取最大宽度的子菜单项的宽度为当前竖直菜单的宽度
    *   menuChildren 一个坚直菜单的所有菜单项类 ,为一数组  ，数组元素为menu为子菜单类, menu.name  菜单内容  | menu.code 菜单的code  |  menu.entity  菜单的单击路径 ，则menu.children == undefined
    */
    getMenuChildrenWidth:function(menuChildren){
    	var maxWidth = 0,menu = null,menuWidth = 0;
    	for(var i=0;i<menuChildren.length;i++){
    		menu = menuChildren[i];
    		menuWidth = menu.name.charLength();
    		if(menuWidth > maxWidth){
    			maxWidth = menuWidth;
    		}
    	}
    	maxWidth = maxWidth*6 + 70;
    	return maxWidth;
    },

    /**
	* 获取第一级横向菜单的每个item内容,其父节点 为td
    */
    getFirstMenuItemHtml : function(menuCode,menuItemContent){
    	return menuItemContent;
    },
    /**
	* 获取第一级横向菜单的每个菜单item的宽度
    */
    getFirstMenuItemWidth:function(menuCode,menuItemContent){
    	var width = menuItemContent.charLength()*6+25;
    	return width;
    },
    
    /**
    *第一级横向菜单的单击事件
    */
    firstMenuClick:function(target){
    },

    /**
     * 非第一级菜单的单击事件
    **/
    menuItemClick:function(target){

    },
    /**开始绘制第一级横向菜单*/
    beforerender:function(){
    	
    },
    /**第一级横向菜单绘制结束*/
	afterrender:function(){
		
	}
	
  });

  Haiyisoft.HyMenu3 = Haiyisoft.extend(Haiyisoft.DefaultMenu,{
	
		/********************重写父类的方法*************/
		constructor: function(config){//该函数必须有
			Haiyisoft.HyMenu3.superclass.constructor.call(this, config);//这个必须有

		},
	
	    render:function(){
		    var config = this.initialConfig;
		    		    		    														   													   
			this.initialConfig.firstMenuTemplateHtml = "<div class='first-menu-container'>"+
															"{firsMenuContentHtml}"+
				                                           "</div>";			
				                                           
			this.initialConfig.childrenMenuItemTemplateHtml = "<div style='width:{menuWidth}px' class='submenu-container' direction='right'>"+
	         									   "  <table cellspacing=0 cellpadding=0 style='width:100%;'>"+
						    					   "	<tbody>"+
						    					   "	       {menuItemTrHtml}"+
						    					   "    </tbody>"+
						    					   "  </table>"+
						    					   "</div>";
	
			this.initialConfig.childrenOneMenuTrtemplateHtml = "<tr  code='{code}' id='{code}' level='{level}'  class='submenu-item'>"+
												   " {menuItemTdHtml}"+
												   "</tr>";
	
			this.initialConfig.childrenOneMenuTdtemplateHtml = "<td align='center'  style='padding-right: 3px;width:30px'>"+
															   "  <img height='30px'src='{menuImg}'/>"+
															   "</td>"+
															   "<td>" +  
															   "   {everyMenuItemContent}"+
															   "</td>"+
															   "<td align='center'  style='width:"+config.foldImgWidth+"px'>"+
															   " {arrowImg}"+
															   "</td>";
				
	 									   
											   				   													   													   
	    	//绘制过程
			this._generateMenuMap();
			//绘制第一层菜单的外围
			var _firstMenuHtml = this._replace(this.initialConfig.firstMenuTemplateHtml, "{firsMenuContentHtml}", this._generateFirstMenuContent());
			_firstMenuHtml = this._replace(_firstMenuHtml,"{tableWidth}",this._getFirstMenuTableWidth());
	
			$("#"+this.initialConfig.menuId).html(_firstMenuHtml);
			this._bindFirstMenuEvent();
	
			this._generateChildrenDiv();//产生子菜单的父div
		
	    },
	       /***
	* 第一级菜单鼠标经过样式，target为第一级菜单的每个td 的dom元素
	*/
	firstMenuMouseover:function(target){
		$(target).css('background-color', '#16314f');
		$(target).get(0).style.cursor = "pointer";
	},
	/***
	* 第一级菜单鼠标离开样式，target为第一级菜单的每个td 的dom元素
	*/
	firstMenuMouseout:function(target){
		$(target).css('background-color', '#1e4269');
	},
    
    /**
     *非第一级竖直菜单的鼠标经过样式，target为tr的dom元素
     * 
     */
	childrenMenuMouseover : function(target){
		
		$(target).removeClass("submenu-mouseout").addClass("submenu-mouseover");
		
	},
     /**
     *非第一级竖直菜单的鼠标经过样式，target为tr的dom元素
     *  
     */
	childrenMenuMouseout : function(target){
	 	//$(target).find("td:eq(2)").find("img").css("display","none");
		$(target).removeClass("submenu-mouseover").addClass("submenu-mouseout");
	},

	/**
    *获取竖直菜单项的html，其父级的元素为tr,menu为子菜单类, menu.name  菜单内容  | menu.code 菜单的code  |  menu.entity  菜单的单击路径
    */
     getChildrenMenuTdHtml : function(menu){
     	var tempHtml = this.initialConfig.childrenOneMenuTdtemplateHtml;
     		tempHtml = this._replace(tempHtml,"{everyMenuItemContent}",menu.name);
     		tempHtml = this._replace(tempHtml,"{menuImg}",$$pageContextPath+""+menu.imgsrc);
            if(menu.children == undefined){//没有孩子节点 
            	//tempHtml = this._replace(tempHtml,"{foldImgSrc}",this.initialConfig.unFoldImgSrc);
            	tempHtml = this._replace(tempHtml,"{arrowImg}","");           	
            }else{
            	//tempHtml = this._replace(tempHtml,"{foldImgSrc}",this.initialConfig.foldImgSrc);
            	tempHtml = this._replace(tempHtml,"{arrowImg}","<img  src='"+$$pageContextPath+"/css/css/haiyisoft3/menu/images/jt.png'/>");
            }
        return tempHtml;

     },
    /**
		产生第一级菜单的最终html,有图标
	*/
    _generateFirstMenuContent:function(){
    	var _menuBean = this.initialConfig.menuBean,_subItem = null,_html,_menuBarHtml="";
    	for (var i = 0; i < _menuBean.length; i++){
	    	_subItem =  _menuBean[i];
	    	
	    	_html = this._getFisrtSubMenuHtml(_subItem[3],_subItem[1],_subItem[0]);
	    	_menuBarHtml = _menuBarHtml + _html;
	    }
	    return _menuBarHtml;

    },

    /**
	*获取第一层菜单的每个菜单子项的html 
    */
    _getFisrtSubMenuHtml:function(menuCode,menuItemContent,imgSrc){
		var width = this.getFirstMenuItemWidth(menuCode,menuItemContent);
		imgSrc = $$pageContextPath + "" + imgSrc;
		//每个图片的路径需要改。。。。。。。。。。
		var menuItemHtml = "<div  class='first-menuitem-td' id='"+menuCode+"' menuCode='"+menuCode+"'><img class='first-menu-img'   src='"+imgSrc+"'></img>"
		var _html = "";
		_html = this.getFirstMenuItemHtml.call(this,menuCode,menuItemContent);
    
    	menuItemHtml = menuItemHtml +"&nbsp;"+_html;
    	menuItemHtml = menuItemHtml + "</div>";
    	return menuItemHtml;
    },
	    
	    /**
		*第一层菜单相关事件的绑定
		*/
		_bindFirstMenuEvent:function(){
			var me = this ,_code = null;
			$("#"+this.initialConfig.menuId).delegate('.first-menuitem-td', 'mouseenter', function(event) {
				me.firstMenuMouseover(this);
				_code = $(this).attr("menucode")
				if(me.lastFirstMouseMenu != undefined){
					if(_code != $(me.lastFirstMouseMenu).attr("menucode")){//移到新的第一级菜单
						me.firstMenuMouseout(me.lastFirstMouseMenu);
						me.lastFirstMouseMenu = this;
					}
				}else{
					me.lastFirstMouseMenu = this;
				}
				 me._openFirstMenuChildren(_code,$(this),$(this).attr("id"));
			});
	
			$("#"+this.initialConfig.menuId).delegate('.first-menuitem-td', 'mouseleave', function(event) {
				// me.fireEvent("firstMenuMouseout",this);
				 me._hiddenMenuChildren($(this).attr("menucode"),0);
			});
	
			$("#"+this.initialConfig.menuId).delegate('.first-menuitem-td', 'click', function(event) {
				// me.fireEvent("firstMenuMouseover",this);
				//若没有子菜单，单击，打开相应的菜单 
				me._openMenuTask($(this).attr("menucode"));
				me.fireEvent("firstMenuClick",this);
			});	
		},
		_showFirstMenuChildren : function(menuCode,menuObj,reference,referenceId,level){
   	  
	       clearTimeout(this.initialConfig._menuTimeOut);//有可能是在同一个菜单触发了out与over事件
	   	   // menuObj.css("display","block"); 
	   	    var _menu = this.initialConfig.menuMap.get(menuCode);
	       setMenuPosition(menuObj, reference,this.initialConfig._subMenuIds[level],"horizontal",reference,_menu.children.length,'haiyisoft3') ;
	     
	       //在这里消失上次打开菜单的子菜单，上次打开的菜单已经被当前打开的菜单替换了，但其打开的子菜单还是存在的
	       for(var i=level + 1;i < this.initialConfig._subMenuIds.length;i++){
	   	   	   $("#positionHelper"+this.initialConfig._subMenuIds[i]).css("top","-9999px");
	           $("#positionHelperIframe"+this.initialConfig._subMenuIds[i]).css("top","-9999px");
	   	   }
	
	       //给子菜单绑定监听事件
	       this._bindChildrenMenuEvent(1);
	  },
		/**
	    *第一级横向菜单的单击事件
	    */
	    firstMenuClick:function(target){
			var _menu = this.initialConfig.menuMap.get(target.id);
			if(_menu.children == undefined){//无子菜单，则关闭整个菜单
				$("#menuContainer").css("display","none");
			}
	    },
	
	    /**
	     * 非第一级菜单的单击事件
	    **/
	    menuItemClick:function(target){
			var _menu = this.initialConfig.menuMap.get(target.id);
			if(_menu.children == undefined){//无子菜单，则关闭整个菜单
				$("#menuContainer").css("display","none");
			}
	    }
});
