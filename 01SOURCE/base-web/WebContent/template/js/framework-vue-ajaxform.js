var documentWriteHtml = "";
Vue.component(ConstantComponentMap._AjaxForm, {
	props : [ 'id', 'onrowclick' ],
	template : '<form class="layui-form  layui-form-pane" :id="id+guid"  action=""><slot></slot></form>',

	data : function() {
		return {
			guid : $._GenerateUUID()
		}
	},
	mounted:function(){
		this._addDefineAjaxFormObjectScript();
		
	},
	created : function() {
		this._addAjaxFormToMap();
	},
	methods : {
		incrementCounter : function() {
		},
		_addAjaxFormToMap:function(){
			var domId=this._getAjaxFormDomId();
			var ajaxForm = new AjaxForm(domId);
			$._AddToLayuiObjectHashMap(domId, ajaxForm);
			
		},
		//添加生命ajaxDataGrid对象脚本
		_addDefineAjaxFormObjectScript:function(){
			var domId=this._getAjaxFormDomId();
			var $script = $('<script type="text/javascript"></script>');
			$script.append('var ' + this.id + '=$._GetFromLayuiObjectHashMap("' + domId + '");');
			documentWriteHtml = $script.prop("outerHTML");
			$("body").append(documentWriteHtml);
		},
		_getAjaxFormDomId:function(){
			var _domId = this.id + this.guid;
			return _domId;
		},
		
		
	},
})


function AjaxForm(domId) {
	this.id = domId;
	this.setData=function(data){
		
	}
	return this;
}

