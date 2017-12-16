$(document).ready(function(){
	writeNavList();
	writeNavBar();
	setMenuActive();
});

function writeNavList(){
	var str;
	
	var $mainDiv=$('<div class="well" style="padding: 8px 0;"></div>')
	var $mainUl=$('<ul class="nav nav-list"></ul>');
	
	
	var $liHeaderJS=$('<li class="nav-header">介绍</li>');
	var $liApiSSM=$('<li><a href="l-index.html">&nbsp;&nbsp;API是什么</a></li>')
	$liHeaderJS.append($liApiSSM);
	$mainUl.append($liHeaderJS);
		
	var $liHeader_WJMS=$('<li class="nav-header">文件描述</li>');
	
	str='<li ><a href="l-framework-constant.html">&nbsp;&nbsp;framework-constant.js</a></li>';
	$liHeader_WJMS.append(buildLiTag(str));
		//var $GridChildrenUl=$('<ul class="nav nav-list"></ul>');
		//var $liChildGridRow=$('<li ><a href="l-framework-jquery.html">&nbsp;&nbsp;GridRow</a></li>');
		//$GridChildrenUl.append($liChildGridRow);
		//$liHeader_WJMS.append($GridChildrenUl);
		
			str='<li><a href="l-framework-jquery.html">&nbsp;&nbsp;framework-jquery.js</a></li>';
	$liHeader_WJMS.append(buildLiTag(str));
	
	str='<li><a href="l-framework-model.html">&nbsp;&nbsp;framework-model.js</a></li>';
	$liHeader_WJMS.append(buildLiTag(str));
	
	str='<li><a href="l-framework-vue-datagrid.html">&nbsp;&nbsp;framework-vue-datagrid.js</a></li>';
	$liHeader_WJMS.append(buildLiTag(str));
	
	str='<li><a href="l-framework-vue-datagridrow.html">&nbsp;&nbsp;framework-vue-datagridrow.js</a></li>';
	$liHeader_WJMS.append(buildLiTag(str));
	
	str='<li><a href="l-framework-vue-init.html">&nbsp;&nbsp;framework-vue-init.js</a></li>';
	$liHeader_WJMS.append(buildLiTag(str));
	
	str='<li><a href="l-framework-vue-layout.html">&nbsp;&nbsp;framework-vue-layout.js</a></li>';
	$liHeader_WJMS.append(buildLiTag(str));
	
	str='<li><a href="l-framework-vue-layoutfield-h.html">&nbsp;&nbsp;framework-vue-layoutfield-h.js</a></li>';
	$liHeader_WJMS.append(buildLiTag(str));
	
	str='<li><a href="l-framework-vue-layoutfield-v.html">&nbsp;&nbsp;framework-vue-layoutfield-v.js</a></li>';
	$liHeader_WJMS.append(buildLiTag(str));
	
	str='<li><a href="l-framework-vue-menu.html">&nbsp;&nbsp;framework-vue-menu.js</a></li>';
	$liHeader_WJMS.append(buildLiTag(str));
	
	str='<li><a href="l-framework-vue-tree.html">&nbsp;&nbsp;framework-vue-tree.js</a></li>';
	$liHeader_WJMS.append(buildLiTag(str));
	
	
	$mainUl.append($liHeader_WJMS);
	$mainDiv.append($mainUl);
	
		var html='	<div class="well" style="padding: 8px 0;">'+
								'<ul class="nav nav-list">'+
								'	<li class="nav-header">介绍</li>'+
								'	<li><a href="l-index.html">&nbsp;&nbsp;API是什么</a></li>'+
								'	<li class="nav-header">组件</li>'+
								'	<li ><a href="l-AjaxDataGrid.html">&nbsp;&nbsp;AjaxDataGrid</a></li><ul class="nav nav-list"><li ><a href="l-GridRow.html">&nbsp;&nbsp;GridRow</a></li></ul>'+
								'	<li><a href="l-AjaxForm.html">&nbsp;&nbsp;AjaxForm</a></li>'+
								'	<li><a href="l-AjaxTree.html">&nbsp;&nbsp;AjaxTree</a></li>'+
								'	<li><a href="l-Menu.html">&nbsp;&nbsp;Menu</a></li>'+
								'</ul>'+
					'</div>';
	
	$("#navid").append($mainDiv.prop("outerHTML"));	
}
function writeNavBar(){
	var html='<div class="navbar-inner">'+
				'<div class="container"  style="width:1200px;height:80px;line-height:80px;  background-color: #20a0ff; color: #fff;">'+
					'<a class="btn btn-navbar" data-toggle="collapse"'+
						'data-target=".nav-collapse"> <span class="icon-bar"></span> <span'+
						'class="icon-bar"></span> <span class="icon-bar"></span>'+
					  '</a> <a class="brand" href="#">LL-框架开发帮助手册</a>'+
					'<div class="nav-collapse"></div>'+
				'</div>'+
			'</div>';
			$("#navbar").append(html);	
	}
function setMenuActive(){
	var strFullPath = window.document.location.href;
	var indexStart=strFullPath.lastIndexOf("/");
	var indexEnd=strFullPath.lastIndexOf(".");
	//var documentName=strFullPath.substr(indexStart+1,indexEnd-indexStart-1);
	var documentName=strFullPath.substr(indexStart+1,indexEnd);
	var id=documentName.substr(2,documentName.length-2);
	$("[href='"+documentName+"']").css("color","#20a0ff");
	}
	
	function buildLiTag(listr){
		var $limenu=$(listr);
		return $limenu;
		}