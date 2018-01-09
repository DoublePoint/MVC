Vue.component(_ConstantComponentMap._AjaxFormLine, {
	props : [ 'id', 'onrowclick','colproportion' ],
	template : '<div class="layui-form-item">' 
//		+ 	' <div class="layui-inline"><slot></slot></div>'
		+ 	' <slot></slot>'
		+ 	'</div>' ,

	data : function() {
		return {
			guid : $._GenerateUUID()
		}
	},
	mounted:function(){
		this._MapComponent();
		
	},
	created : function() {
		this._RegisterComponent();
	},
	methods : {
		_RegisterComponent:function(){
//			var domId=this._GetComponentDomId();
//			var ajaxForm = new AjaxForm(domId);
//			$._AddToLayuiObjectHashMap(domId, ajaxForm);
			
		},
		//添加生命ajaxDataGrid对象脚本
		_MapComponent:function(){
			var documentWriteHtml = "";
			var domId=this._GetComponentDomId();
			var $script = $('<script type="text/javascript"></script>');
			$script.append('var ' + this.id + '=$._GetFromLayuiObjectHashMap("' + domId + '");');
			documentWriteHtml = $script.prop("outerHTML");
			$("body").append(documentWriteHtml);
		},
		_GetComponentDomId:function(){
			var _domId = this.id + this.guid;
			return _domId;
		},
		
		
	},
})



function AjaxLine(domId) {
	this.id = domId;
	this.formItems=new Array();
	this.colproportion;
	//是否包含该字段名称
	this.containsFieldName=function(name){
		var iscontain=false;
		for(var i=0;i<this.formItems.length;i++){
			if(formItems[i].field==name){
				iscontain=true;
			}
		}
		return iscontain;
	}
	this.setData=function(data){
		
	}
	this.addFormItem=function(item){
		this.formItems.push(item);
	}
	this.setFieldValue=function(name,value){
		var items=this.formItems;
		for(var i=0;i<items.length;i++){
			if(items[i].field==name){
				items[i].setData(value);
			}
		}
	}
	this.showField=function(name){
		var items=this.formItems;
		for(var i=0;i<items.length;i++){
			if(items[i].field==name){
				items[i].show();
			}
		}
	}
	this.hideField=function(name,isLeaveLocation){
		var items=this.formItems;
		for(var i=0;i<items.length;i++){
			if(items[i].field==name){
				items[i].hide(isLeaveLocation);
			}
		}
	}
	return this;
}

