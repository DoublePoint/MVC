Vue.component(_ConstantComponentMap._Step, {
	props : [ 'id', 'height', 'width', 'backgroundcolor','title','active' ],
	template : '<section :id="id+guid" >'+ '<slot></slot>' +'</section>',
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
		this._AddStepHeader();
		// 将formfield添加到form中
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
			var step = new Step(domId);
			for ( var attrName in step) {
				if (this[attrName] != null)
					step[attrName] = this[attrName];
			}
			$._AddToLayuiObjectHashMap(domId, step);
		},
		// 添加生命FillLayout对象脚本
		_MapComponent : function() {
			$._OutputMapCompoment(this);
		},
		_RegisterResize :function(){
		},
		_AddStepHeader:function(){
			this._GetComponentDom().addStepName(this.title);
		},
		_InitClientStyleBuffer : function(){
		}
	},
})


function Step(domId){
	this.domId=domId;
	this.title="";
	this.active="";
	
	this.addStepName=function(stepTitle){
		var $header=$("<h2>"+this.title+"</h2>");
		this.getDom().before($header);
	}
	this.getActive=function(){
		return this.active;
	}
	this.getDomId=function(){
		return this.domId;
	}
	this.getDom = function() {
		return $("#" + this.domId);
	}
	this.setActive = function(aActive){
		this.active=aActive;
	}
	this.getTitle = function(){
		return this.title;
	}
	this.setTitle = function(aTitle){
		this.title=aTitle;
	}
	
}