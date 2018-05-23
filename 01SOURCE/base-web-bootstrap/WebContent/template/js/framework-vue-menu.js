var existTabsNameArray = new Array();
Vue.component(_LL_Constant._ConstantComponentMap._AjaxMenu, {
	props : [ 'id', 'datasource', 'columns', 'onmenuclick' ],
	template : ' <div class="sidebar-collapse"><ul :id="id+guid" lay-filter="side" class="nav"></ul></div>',

	data : function() {
		return {
			guid : $.generateUUID()
		}
	},
	mounted : function() {
		this._InitAjaxMenuData();
		this._MapComponent();
		this._InitMenuClick();
		this._TabDeleteClick();
		
		$('#'+this._GetComponentDomId()+'').metisMenu();
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
			$.addToLayuiObjectHashMap(domId, _AjaxMenu);
		},
		// 添加生命AjaxMenu对象脚本
		_MapComponent : function() {
			$.outputMapCompoment(this);
		},
		_GetComponentDomId : function() {
			var _domId = this.id + this.guid;
			return _domId;
		},
		_InitMenuClick : function() {
			$('.nav li a').on('click', function() {
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
				var dataWrap=$.createAjaxDataWrap();
				var menu={
						id:$(this).attr("menuId")
				};
				dataWrap.dataList[0]=menu;
				$.request({
					url:$$pageContextPath+"/template/sys/menu-visit/add-log",
					data:{
						dataWrap:dataWrap
					}
				});
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
					var _AjaxMenu = $.getFromLayuiObjectHashMap(domId);
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
	// this.name = config.name;
	// this.cdbs = config.cdbs;
	// this.link = config.link;
	// this.childrenMenuList = config.childrenMenuList;
	this.setData = function(data) {
		$("#" + domId).empty();
		$("#" + domId).append(this.getHtml(data));

	};

	this.getChildrenMenuHtml = function(menu) {
		var $li = $("<li></li>");
		if (menu.childrenMenuList == null || menu.childrenMenuList.length <= 0) {
			var $a = $("<a></a>");
			//$a.attr("class", "afinve");
			$a.attr("onclick", "javascript:return false;");
			if (menu.link == null || menu.link == ""){
				$a.attr("menuhref", "#");
			}
			else{
				$a.attr("menuId",menu.id);	
				$a.attr("menuhref", menu.link);
			}
			if (menu.icon != null && menu.icon != "") {
				var $i = $("<i>"+menu.icon+"</i>");
				$i.attr("class", "fa "+getRandomIcon());
				$a.append($i);
			}
			else{
				var $i = $("<i>&nbsp;&nbsp;&nbsp;</i>");
				$i.attr("class", "fa "+getRandomIcon());
				$a.append($i);
			}
			if (menu.name != null && menu.name != "") {
				$a.append(menu.name);
			}
			$li.append($a);
		} else {
			var $a = $("<a></a>");
			//$a.attr("class", "afinve");
			if (menu.link == null || menu.link == "")
				$a.attr("menuhref", "#");
			else{
				$a.attr("menuId",menu.id);	
				$a.attr("menuhref", menu.link);
			}
			if (menu.icon != null && menu.icon != "") {
				var $i = $("<i>"+menu.icon+"</i>");
				$i.attr("class", "fa "+getRandomIcon());
				$a.append($i);
			}
			else{
				var $i = $("<i>&nbsp;&nbsp;&nbsp;</i>");
				$i.attr("class", "fa "+getRandomIcon());
				$a.append($i);
			}
			if (menu.name != null && menu.name != "") {
				$a.append(menu.name);
			}
			var $span=$('<span class="fa arrow"></span>');
			$a.append($span);
			$li.append($a);
			
			var $ul = $("<ul></ul>");
			$ul.attr("class", "nav nav-second-level");
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

var arr = [" fa-toggle-on ",
           " fa-bell ",
           " fa-circle-o ",
           " fa-code ",
           " fa-square-o ",
           " fa-bug ",
           " fa-edit ",
           " fa-eyedropper ",
           " fa-coffee ",
           " fa-flash ",
           " fa-key ",
           " fa-send ",
           " fa-recycle ",
           " fa-desktop ",
           " fa-anchor",
           " fa-sign-in ",
           " fa-flask ",
           " fa-plus ",
           ]; 
var index = Math.floor((Math.random()*arr.length)); 
function getRandomIcon(){
	var index = Math.floor((Math.random()*arr.length)); 
	return arr[index]; 
}