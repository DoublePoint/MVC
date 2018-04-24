(function($) {
	var FillAreaTBTemplate='<div  :id="id+guid" :class="clientClassBuffer" :style="clientStyle" ><div class="panel-heading" :style="clientHeadingStyle">{{headTitle}}</div><slot></slot></div>';
	Vue.component(_ConstantComponentMap._FillAreaTB, {
		props : [ 'id', 'height',  'backgroundcolor',"showborder","showtitle","title" ],
		template : FillAreaTBTemplate,

		data : function() {
			var varlayOutHeight=this.height;
			if(varlayOutHeight==null||varlayOutHeight=="")
				varlayOutHeight='100%';
			var clientStyleBuffer=this._InitClientStyle();
			var clientClassBuffer=this._InitClientClassBuffer();
			var clientHeadingStyle=this._InitClientHeadingStyleBuffer();
			return {
				guid : $._GenerateUUID(),
				clientStyle:clientStyleBuffer.toString(),
				clientClassBuffer:clientClassBuffer.toString(),
				clientHeadingStyle:clientHeadingStyle.toString(),
				headTitle:this.title
			}
		},
		created : function() {
			this._RegisterComponent();
		},
		beforeMount : function() {
			// 添加到父dom中
			this._AddToParent();
		},
		mounted : function() {
			this._MapComponent();
		},
		methods : {
			_GetComponentDomId : function() {
				var _domId = this.id + this.guid;
				return _domId;
			},
			_GetLayoutAreaX :function(){
				var domId = this._GetComponentDomId();
				var aLayoutArea = $._GetFromLayuiObjectHashMap(domId);
				return aLayoutArea;
			},
			_RegisterComponent : function() {
				var domId = this._GetComponentDomId();
				var _FillArea = new FillAreaTB(domId);
				for ( var attrName in _FillArea) {
					if (this[attrName] != null)
						_FillArea[attrName] = this[attrName];
				}
				$._AddToLayuiObjectHashMap(domId, _FillArea);
				try{
					// 注册该对象ID 以便在浏览器大小改变时重新计算其大小
					if (this.height!=null&&this.height.toString().indexOf("*") != -1) {
						_FillArea.setIsResize(true);
					}
				}
				catch(e){
					console.log("加载模板出错。layoutarea-tb-79");
				}
				
			},
			// 将本标签作为ajaxform的一个属性
			_AddToParent : function() {
				if(this.$parent==null) return;
				var _FillArea = this._GetLayoutAreaX();
				var layoutDomId = this.$parent._GetComponentDomId();
				var layout = $._GetFromLayuiObjectHashMap(layoutDomId);
				layout.addLayoutAreaItem(_FillArea);
			},
			// 添加生命FillArea对象脚本
			_MapComponent : function() {
				$._OutputMapCompoment(this);
			},
			
			
			_InitClientStyle : function(){
				var varlayOutHeight=this.height;
				if(varlayOutHeight==null||varlayOutHeight=="")
					varlayOutHeight = '100%';
				else if (varlayOutHeight.toString().indexOf("px") != -1
						||varlayOutHeight.toString().indexOf("%") != -1) {
					varlayOutHeight = varlayOutHeight;
				}
				else if (varlayOutHeight.toString().indexOf("*") != -1){
					varlayOutHeight = '100%';
				}
				else{
					varlayOutHeight = varlayOutHeight + "px";
				}
				var clientStyleBuffer=$._CreateStringBuffer();
				var heightBuffer=$._CreateStyleBuffer("height",varlayOutHeight);
				clientStyleBuffer.append(heightBuffer.toString());
				var widthBuffer=$._CreateStyleBuffer("width",'100%');
				clientStyleBuffer.append(widthBuffer.toString());
				if(this.backgroundcolor!=null){
					var bgBuffer=$._CreateStyleBuffer("background-color",this.backgroundcolor);
					clientStyleBuffer.append(bgBuffer.toString());
				}
				
				return clientStyleBuffer;
			},
			_InitClientClassBuffer : function(){
				var bf=$._CreateStringBuffer();
				bf.append(" ll-fill-area-tb panel-info ll-panel");
				if(this.showborder=="true")
					bf.append(" layout-area-Border ");
				bf.append(" ll-panel");
				return bf;
			},
			_InitClientHeadingStyleBuffer : function(){
				var bf=$._CreateStyleBuffer("padding: 5px 10px 5px 10px; ");
				if(this.showtitle!="true")
					bf.append('display:none;');
				
				return bf;
			}
		},
	})

	function FillAreaTB(domId) {
		this.domId = domId;
		this.height = 0;
		this.isResize=false;
		this.showborder=false;
		
		this.getDomId=function(){
			return this.domId;
		}
		this.getDom = function() {
			return $("#" + this.domId);
		}
		this.getBrother=function(){
			return this.getDom().parent().children();
		}
		this.getLayout=function(){
			return this.getDom().parent();
		}
		this.getLayoutWidth=function(){
			return this.getDom().parent().width();
		}
		this.getLayoutHeight=function(){
			return this.getDom().parent().height();
		}
		this.getIsResize=function(){
			return this.isResize;
		}
		this.getWidth=function(){
			return this.width;
		}
		this.setFillAreaHeight=function(height){
			this.getDom().height(height);
		}
		this.setFillAreaWidth=function(width){
			this.getDom().width(width);
		}
		this.setIsResize=function(aIsResize){
			this.isResize=aIsResize;
		}
		this.resize = function() {
			var parentWidth = this.getLayoutWidth();
			var parentheight = this.getLayoutHeight();
			var children = this.getBrother();
			if (children.length <= 0)
				return;
			var allBrotherFixHeight = 0;
			for (var i = 0; i < children.length; i++) {
				if (children[i].id != this.domId) {
					allBrotherFixHeight += children[i].offsetHeight;
				}
			}
			var thisRuleHright=parentheight - allBrotherFixHeight;
			
			if(thisRuleHright<_ConstantLayoutArea._DEFAULT_MIN_HEIGHT)
				thisRuleHright=_ConstantLayoutArea._DEFAULT_MIN_HEIGHT;
			
			this.setFillAreaHeight(thisRuleHright);
			this.setFillAreaWidth("100%");
		}
	}


})($);
