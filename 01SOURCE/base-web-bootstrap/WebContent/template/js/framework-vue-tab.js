Vue.component(_ConstantComponentMap._Tab, {
	props : [ 'id', 'height', 'width', 'backgroundcolor','title' ],
	template : '<div class="tab-pane fade in active" :id="id+guid" :title="aTitle">'+ '<slot></slot>' +'</div>',
	data : function() {
		var aTitle="";
		if(this.title!=null)
			aTitle=this.title;
		return {
			aTitle:aTitle,
			guid:$._GenerateUUID()
		}
	},
	created : function() {//注册到系统map
		this._RegisterComponent();
	},
	mounted:function(){
		this._MapComponent();
		// 将formfield添加到form中
		this._AddToTabPanel();
	},
	beforeMount : function() {
		
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
			var tab = new Tab(domId);
			for ( var attrName in tab) {
				if (this[attrName] != null)
					tab[attrName] = this[attrName];
			}
			$._AddToLayuiObjectHashMap(domId, tab);
		},
		_AddDragDom : function(){
		},
		// 添加生命FillLayout对象脚本
		_MapComponent : function() {
			$._OutputMapCompoment(this);
		},
		_RegisterResize :function(){
		},
		_AddToTabPanel : function(){
			var parentDomId = this.$parent._GetComponentDomId();
			var tablePanel = $._GetFromLayuiObjectHashMap(parentDomId);
			tablePanel.addTab(this._GetComponentDom());
		}
	},
})


function Tab(domId){
	this.domId=domId;
	this.title="";
	
	this.getDomId=function(){
		return this.domId;
	}
	this.getDom = function() {
		return $("#" + this.domId);
	}
	this.getTitle = function(){
		return this.title;
	}
	this.setTitle = function(aTitle){
		this.title=aTitle;
	}
}