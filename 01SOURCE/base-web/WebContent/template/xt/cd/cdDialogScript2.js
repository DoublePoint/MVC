$(document).ready(function(){
	writeNavList();
	setMenuActive();
});

function writeNavList(){
	var html='<div class="well" style="padding: 8px 0;">'+
								'<ul class="nav nav-list">'+
								'	<li class="nav-header">介绍</li>'+
								'	<li><a href="profile.htm">&nbsp;&nbsp;API是什么</a></li>'+
								'	<li><a href="settings.htm">&nbsp;&nbsp;标签</a></li>'+
								'	<li class="nav-header">组件</li>'+
								'	<li ><a href="l-AjaxDataGrid.html">&nbsp;&nbsp;AjaxDataGrid</a></li>'+
								'	<li><a href="l-AjaxForm.html">&nbsp;&nbsp;AjaxForm</a></li>'+
								'	<li><a href="l-AjaxTree.html">&nbsp;&nbsp;AjaxTree</a></li>'+
								'	<li><a href="l-Menu.html">&nbsp;&nbsp;Menu</a></li>'+
								'</ul>'+
					'</div>';
	
	$("#navid").append(html);	
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