Vue.component(_LL_Constant._ConstantComponentMap._StepPanel, {
	props : [ 'id', 'onstepchanged','onstepchanging' ],

	template : '<div :id="id+guid" style="height:100%;height:100%;">' + '<slot></slot>' + '</div>',
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

		// 初始化step模板
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
		_RegisterComponent : function() {
			var domId = this._GetComponentDomId();
			var steppanel = new StepPanel(domId);
			for ( var attrName in steppanel) {
				if (this[attrName] != null)
					steppanel[attrName] = this[attrName];
			}
			$.addToLayuiObjectHashMap(domId, steppanel);
		},
		// 添加生命FillLayout对象脚本
		_MapComponent : function() {
			$.outputMapCompoment(this);
		},
		_Init : function() {
			this._GetComponentDom().init();
		}
	},
})

function StepPanel(domId) {
	this.domId = domId;
	this.onstepchanged="";
	this.onstepchanging="";
	this.getDomId = function() {
		return this.domId;
	}
	this.getDom = function() {
		return $("#" + this.domId);
	}
	this.init = function() {
		var panel = this;
		panel.getDom().steps({
			headerTag : "h2",
			bodyTag : "section",
			transitionEffect : "slideLeft",
			stepsOrientation : "vertical",
			/* Labels */
			labels : {
				cancel : "返回",
				current : "当前进度:",
				pagination : "Pagination",
				finish : "完成",
				next : "下一步",
				previous : "上一步",
				loading : "加载中 ..."
			},
			onStepChanged : function(event, currentIndex, priorIndex) {
				
			},
			onStepChanging : function(event, currentIndex, newIndex) {
				if (panel.onstepchanging != null) {
					var arr = new Array();
					arr.push(event);
					arr.push(currentIndex);
					arr.push(newIndex);
					var res=$._Eval(panel.onstepchanging, arr);
					if(res==false)
						return false;
					return true;
				}
			}
		});
	}
}