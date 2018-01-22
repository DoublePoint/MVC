Vue
		.component(
				_ConstantComponentMap._Region,
				{
					props : [ 'id', 'height', 'width', 'backgroundcolor' ],
					template : '<div class="layui-collapse" lay-filter="test">'
							+ '<div class="layui-colla-item">'
							+ ' <h2 class="layui-colla-title">为什么JS社区大量采用未发布或者未广泛支持的语言特性？</h2>'
							+ ' <div class="layui-colla-content">'
							+ '   <p>有不少其他答案说是因为JS太差。我下面的答案已经说了，这不是根本性的原因。但除此之外，我还要纠正一些对JS具体问题的误解。JS当初是被作为脚本语言设计的，所以某些问题并不是JS设计得差或者是JS设计者的失误。比如var的作用域问题，并不是“错误”，而是当时绝大部分脚本语言都是这样的，如perl/php/sh等。模块的问题也是，脚本语言几乎都没有模块/命名空间功能。弱类型、for-in之类的问题也是，只不过现在用那些老的脚本语言的人比较少，所以很多人都误以为是JS才有的坑。另外有人说JS是半残语言，满足不了开发需求，1999年就该死。半残这个嘛，就夸张了。JS虽然有很多问题，但是设计总体还是优秀的。——来自知乎@贺师俊</p>'
							+ '  </div>' + '</div>' + '<div class="layui-colla-item">' + '  <h2 class="layui-colla-title">贤心是男是女？</h2>' + '  <div class="layui-colla-content">'
							+ '     <p>man！ 所以这个问题不要再出现了。。。</p>' + '   </div>' + ' </div>' + '</div>',
					data : function() {

						// var varlayOutHeight=this.height;
						// if(varlayOutHeight==null)
						// varlayOutHeight='100%';
						//		
						// var clientStyleBuffer=$._CreateStringBuffer();
						//		
						// var
						// heightBuffer=$._CreateStyleBuffer("height",varlayOutHeight);
						// clientStyleBuffer.append(heightBuffer.toString());
						// var widthBuffer=$._CreateStyleBuffer("width",'100%');
						// clientStyleBuffer.append(widthBuffer.toString());
						// if(this.backgroundcolor!=null){
						// var
						// bgBuffer=$._CreateStyleBuffer("background-color",this.backgroundcolor);
						// clientStyleBuffer.append(bgBuffer.toString());
						// }
						//		
						// var widthBuffer=$._CreateStringBuffer("width:")
						// return {
						// guid : $._GenerateUUID(),
						// clientStyle:clientStyleBuffer.toString(),
						// layOutHeight: varlayOutHeight,
						// layOutWidth : '100%'
						// }
					},
					created : function() {
					},
					mounted : function() {
						//监听折叠
						  $element.on('collapse(test)', function(data){
						    $layer.msg('展开状态：'+ data.show);
						  });
					},
					methods : {
						_GetComponentDomId : function() {
							var _domId = this.id + this.guid;
							return _domId;
						},
						_GetComponentDom : function() {
							var domId = this._GetComponentDomId();
							var componentDom = $._GetFromLayuiObjectHashMap(domId);
							return componentDom;
						},
						_RegisterComponent : function() {
						},
						_AddDragDom : function() {
						},
						// 添加生命FillLayout对象脚本
						_MapComponent : function() {
						},
						_RegisterResize : function() {
						}
					},
				})

function LLRegion(domId) {
	this.domId = domId;
	this.getDomId = function() {
		return this.domId;
	}
	this.getDom = function() {
		return $("#" + this.domId);
	}
}