var documentWriteHtml = "";
Vue.component(ConstantComponentMap._FormInputButton, {
	props : [ 'id', 'onrowclick','field','title'],
	template : 
	'<div class="layui-form-item">'+
		'<label class="layui-form-label">{{title}}</label>'+
		'<div class="layui-input-block">'+
			'<input type="text" :name="field" autocomplete="off" class="layui-input" style="padding-right:45px;">'+
			'<a href="#" class="layui-btn inputbutton">...</a>'+
		'</div>'+
	'</div>',

	data : function() {
		return {
			guid : $._GenerateUUID()
		}
	},
	mounted:function(){
		this._addDefineFormFieldObjectScript();
		
	},
	created : function() {
		this._addFormFieldToMap();
	},
	methods : {
		incrementCounter : function() {
		},
		_addFormFieldToMap:function(){
			var domId=this._getFormFieldDomId();
			var formField = new FormField(domId);
			$._AddToLayuiObjectHashMap(domId, formField);
			
		},
		//添加生命ajaxDataGrid对象脚本
		_addDefineFormFieldObjectScript:function(){
			var domId=this._getFormFieldDomId();
			var $script = $('<script type="text/javascript"></script>');
			$script.append('var ' + this.id + '=$._GetFromLayuiObjectHashMap("' + domId + '");');
			documentWriteHtml = $script.prop("outerHTML");
			$("body").append(documentWriteHtml);
		},
		_getFormFieldDomId:function(){
			var _domId = this.id + this.guid;
			return _domId;
		},
		
		
	},
})


function FormField(domId) {
	this.id = domId;
	this.setData=function(data){
		
	}
	return this;
}

