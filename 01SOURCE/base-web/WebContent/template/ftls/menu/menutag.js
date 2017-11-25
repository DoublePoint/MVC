//function AjaxMenu(config) {
//	this.id = config.id;
//	this.cdmc = config.cdmc;
//	this.cdbs = config.cdbs;
//	this.cdlj = config.cdlj;
//	this.childrenMenuList = config.childrenMenuList;
//	this.hasChildrenMenu=function(){
//		if(this.childrenMenuList==null||this.childrenMenuList.length<=0){
//			return false;
//		}
//		return true;
//	}
//	return this;
//}
//
//function getChildrenMenuHtml(menu){
//	var $li=$("<li></li>");
//	if(menu.childrenCDList==null||menu.childrenCDList.length<=0){
//		var $a=$("<a></a>");
//		$a.attr("class","afinve");
//		if(menu.cdlj==null||menu.cdlj=="")
//			$a.attr("href","#");
//		else
//			$a.attr("href",menu.cdlj);
//		$li.append($a);
//		
//		if(menu.cdtb!=null&&menu.cdtb!=""){
//			var $i=$("<i></i>");
//			$i.attr("class","");
//			$li.append($i);
//		}
//		var $spanCdmc=$("<span></span>");
//		if(menu.cdmc!=null&&menu.cdmc!=""){
//			$spanCdmc.append(menu.cdmc);
//			if(menu.cdcj=="1"){
//				$spanCdmc.attr("class","nav-text");
//			}
//		}
//	}
//	else{
//		var $a=$("<a></a>");
//		$a.attr("class","afinve");
//		if(menu.cdlj==null||menu.cdlj=="")
//			$a.attr("href","#");
//		else
//			$a.attr("href",menu.cdlj);
//		$li.append($a);
//		
//		if(menu.cdtb!=null&&menu.cdtb!=""){
//			var $i=$("<i></i>");
//			$i.attr("class","");
//			$li.append($i);
//		}
//		
//		var $spanCdmc=$("<span></span>");
//		if(menu.cdmc!=null&&menu.cdmc!=""){
//			$spanCdmc.append(menu.cdmc);
//			if(menu.cdcj=="1"){
//				$spanCdmc.attr("class","nav-text");
//			}
//		}
//		
//		var $spanIcon=$("<span></span>");
//		$spanIcon.attr("class","arrow");
//		$li.append($spanIcon);
//		
//		$ul=$("<ul></ul>");
//		$ul.attr("class","sub-menu");
//		
//		for(var i=0;i<menu.childrenCDList.length;i++){
//			$ul.append(getChildrenMenuHtml(menu.childrenCDList[i]));
//		}
//		$li.append($ul);
//	}
//	return $li.prop("outerHTML");
//}
//
//function getHtml(data){
//	if(data==null||data.length<=0)
//		return;
//	
//	var $ul=$("<ul></ul>");
//	$ul.attr("class",navMenu);
//	
//	var str="";
//	for(var i=0;i<data.length;i++){
//		str=str+getChildrenMenuHtml(data[i]);
//	}
//	$ul.append(str);
//}