$(document).ready(function(){
	writeNavList();
	writeNavBar();
	setMenuActive();
});

function writeNavList(){
	var $mainDiv=$('<div class="well" style="padding: 8px 0;"></div>')
	var $mainUl=$('<ul class="nav nav-list"></ul>');
	
	
	var $liHeaderJS=$('<li class="nav-header">介绍</li>');
	var $liApiSSM=$('<li><a href="l-index.html">&nbsp;&nbsp;API是什么</a></li>')
	$liHeaderJS.append($liApiSSM);
	$mainUl.append($liHeaderJS);
	
	
	var $liHeaderZJ=$('<li class="nav-header">组件</li>');
	var $liFatherAjaxDataGrid=$('<li ><a href="l-AjaxDataGrid.html">&nbsp;&nbsp;AjaxDataGrid</a></li>');
	$liHeaderZJ.append($liFatherAjaxDataGrid);
		var $GridChildrenUl=$('<ul class="nav nav-list"></ul>');
		var $liChildGridRow=$('<li ><a href="l-GridRow.html">&nbsp;&nbsp;GridRow</a></li>');
		$GridChildrenUl.append($liChildGridRow);
	$liHeaderZJ.append($GridChildrenUl);
	
	var $liFatherAjaxForm=$('<li><a href="l-AjaxForm.html">&nbsp;&nbsp;AjaxForm</a></li>');
	$liHeaderZJ.append($liFatherAjaxForm);
	
	var $liFatherAjaxTree=$('<li><a href="l-AjaxTree.html">&nbsp;&nbsp;AjaxTree</a></li>');
	$liHeaderZJ.append($liFatherAjaxTree);
	
	var $liFatherAjaxMenu=$('<li><a href="l-Menu.html">&nbsp;&nbsp;Menu</a></li>');
	$liHeaderZJ.append($liFatherAjaxMenu);
	
	$mainUl.append($liHeaderZJ);
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
					  '</a> <a class="brand" href="#">LL-操作手册</a>'+
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