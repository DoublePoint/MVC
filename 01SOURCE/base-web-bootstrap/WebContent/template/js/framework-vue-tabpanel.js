Vue.component(_ConstantComponentMap._TabPanel, {
	props : [ 'id', 'height', 'width', 'backgroundcolor' ],
	template : '<div style="height:100%;"><ul :id="id+guid" class="nav nav-tabs"></ul><div class="tab-content">' + '<slot></slot>' + '</div></div>',
	data : function() {
		return {
			guid : $.generateUUID()
		}
	},
	created : function() {// 注册到系统map
		this._RegisterComponent();
	},
	mounted : function() {
		this._MapComponent();

		this._Init();
	},
	methods : {
		_GetComponentDomId : function() {
			var _domId = this.id + this.guid;
			return _domId;
		},
		_GetComponentDom : function() {
			var domId = this._GetComponentDomId();
			var componentDom = $.getFromLayuiObjectHashMap(domId);
			return componentDom;
		},
		_Init : function() {
			this._GetComponentDom().init();
		},
		_RegisterComponent : function() {
			var domId = this._GetComponentDomId();
			var tabpanel = new TabPanel(domId);
			for ( var attrName in tabpanel) {
				if (this[attrName] != null)
					tabpanel[attrName] = this[attrName];
			}
			$.addToLayuiObjectHashMap(domId, tabpanel);
		},
		_AddDragDom : function() {
		},
		// 添加生命FillLayout对象脚本
		_MapComponent : function() {
			$.outputMapCompoment(this);
		},
		_RegisterResize : function() {
		}

	},
})

function TabPanel(domId) {
	this.domId = domId;

	this.addTab = function(tab) {
		var title = tab.getTitle();
		var domId = tab.getDomId();
		var $li = $("<li></li>");
		if (tab.getActive() == "true") {
			$li.attr("class", "active");
		}
		var $a = $('<a href="#' + domId + '" data-toggle="tab">' + tab.getTitle() + '</a>');
		
		$li.append($a);
		this.getDom().append($li);
	}
	this.getDomId = function() {
		return this.domId;
	}
	this.getDom = function() {
		return $("#" + this.domId);
	}
	this.init = function() {
		//鼠标悬停
		var showTabTimeout;
		$('#'+this.domId+' a').mouseover(function (e) {
			var $a=$(this);
			showTabTimeout=setTimeout(function (){
				$a.tab('show');
			},500)
		});
		$('#'+this.domId+' a').mouseout(function (e) {
			clearTimeout(showTabTimeout);
		});
		
		
		//Tab切换
		this.getDom().on('shown.bs.tab', function(e) {
			//e.target // 当前活动的标签
			//e.relatedTarget // 上一个选择的标签
			resizeAllVueModel();
		})
	}
}