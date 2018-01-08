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
		this._AddDefineAjaxFormLineObjectScript();
		
	},
	created : function() {
		this._AddAjaxFormLineToMap();
	},
	methods : {
		_AddAjaxFormLineToMap:function(){
//			var domId=this._GetAjaxFormLineDomId();
//			var ajaxForm = new AjaxForm(domId);
//			$._AddToLayuiObjectHashMap(domId, ajaxForm);
			
		},
		//添加生命ajaxDataGrid对象脚本
		_AddDefineAjaxFormLineObjectScript:function(){
			var domId=this._GetAjaxFormLineDomId();
			var $script = $('<script type="text/javascript"></script>');
			$script.append('var ' + this.id + '=$._GetFromLayuiObjectHashMap("' + domId + '");');
			documentWriteHtml = $script.prop("outerHTML");
			$("body").append(documentWriteHtml);
		},
		_GetAjaxFormLineDomId:function(){
			var _domId = this.id + this.guid;
			return _domId;
		},
		
		
	},
})

