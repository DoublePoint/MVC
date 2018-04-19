Vue.component(_ConstantComponentMap._TabPanel, {
	props : [ 'id', 'height', 'width', 'backgroundcolor' ],
	template : '<div style="height:100%;"><ul :id="id+guid" class="nav nav-tabs"></ul><div class="tab-content">'+ '<slot></slot>' +'</div></div>',
	data : function() {
		return {
			guid:$._GenerateUUID()
		}
	},
	created : function() {//注册到系统map
		this._RegisterComponent();
	},
	mounted:function(){
		this._MapComponent();
	},
	methods : {
		_GetComponentDomId : function() {
			var _domId = this.id + this.guid;
			return _domId;
		},
		_GetComponentDom :function(){
			var domId = this._GetComponentDomId();
			var componentDom = $._GetFromLayuiObjectHashMap(domId);
			return componentDom;
		},
		_RegisterComponent : function() {
			var domId = this._GetComponentDomId();
			var tabpanel = new TabPanel(domId);
			for ( var attrName in tabpanel) {
				if (this[attrName] != null)
					tabpanel[attrName] = this[attrName];
			}
			$._AddToLayuiObjectHashMap(domId, tabpanel);
		},
		_AddDragDom : function(){
		},
		// 添加生命FillLayout对象脚本
		_MapComponent : function() {
			$._OutputMapCompoment(this);
		},
		_RegisterResize :function(){
		}
	},
})


function TabPanel(domId){
	this.domId=domId;
	
	this.addTab=function(tab){
		var title=tab.getTitle();
		var domId=tab.getDomId();
		var $li=$("<li></li>");
		if(tab.getActive()=="true"){
			$li.attr("class","active");
		}
		var $a=$('<a href="#'+domId+'" data-toggle="tab">'+tab.getTitle()+'</a>')
		$li.append($a);
		this.getDom().append($li);
	}
	this.getDomId=function(){
		return this.domId;
	}
	this.getDom = function() {
		return $("#" + this.domId);
	}
}