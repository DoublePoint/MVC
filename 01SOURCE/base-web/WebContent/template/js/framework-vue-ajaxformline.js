var documentWriteHtml = "";
Vue.component(_ConstantComponentMap._AjaxFormLine, {
	props : [ 'id', 'onrowclick' ],
	template : '<div class="layui-form-item">' 
		+ 	' <div class="layui-inline"><slot></slot></div>'
		+ 	'</div>' ,

	data : function() {
		return {
			guid : $._GenerateUUID()
		}
	},
	mounted:function(){
		this._addDefineAjaxFormLineObjectScript();
		
	},
	created : function() {
		this._addAjaxFormLineToMap();
	},
	methods : {
		incrementCounter : function() {
		},
		_addAjaxFormLineToMap:function(){
//			var domId=this._getAjaxFormLineDomId();
//			var ajaxForm = new AjaxForm(domId);
//			$._AddToLayuiObjectHashMap(domId, ajaxForm);
			
		},
		//添加生命ajaxDataGrid对象脚本
		_addDefineAjaxFormLineObjectScript:function(){
			var domId=this._getAjaxFormLineDomId();
			var $script = $('<script type="text/javascript"></script>');
			$script.append('var ' + this.id + '=$._GetFromLayuiObjectHashMap("' + domId + '");');
			documentWriteHtml = $script.prop("outerHTML");
			$("body").append(documentWriteHtml);
		},
		_getAjaxFormLineDomId:function(){
			var _domId = this.id + this.guid;
			return _domId;
		},
		
		
	},
})

