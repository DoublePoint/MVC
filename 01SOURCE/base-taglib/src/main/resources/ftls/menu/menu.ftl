<ul class="layui-nav layui-nav-tree layui-inline" lay-filter="demo"
	id="${menu.id?if_exists }"
	style="margin-right: 10px; margin-top: 2px;${menu.style?if_exists }">
	<li class="layui-nav-item layui-nav-itemed"><a href="javascript:;">默认展开</a>
		<dl class="layui-nav-child">
			<dd>
				<a href="javascript:;">选项一</a>
			</dd>
			<dd>
				<a href="javascript:;">选项二</a>
			</dd>
			<dd>
				<a href="javascript:;">选项三</a>
			</dd>
			<dd>
				<a href="">跳转项</a>
			</dd>
		</dl></li>
	<li class="layui-nav-item"><a href="javascript:;">解决方案</a>
		<dl class="layui-nav-child">
			<dd>
				<a href="">移动模块</a>
			</dd>
			<dd>
				<a href="">后台模版</a>
			</dd>
			<dd>
				<a href="">电商平台</a>
			</dd>
		</dl></li>
	<li class="layui-nav-item"><a href="">云市场</a></li>
	<li class="layui-nav-item"><a href="">社区</a></li>
	<li class="layui-nav-item"><a href="javascript:;">2222222222<span
			class="layui-nav-more"></span></a>
	<dl class="layui-nav-child">
			<dd>
				<a href="javascript:;">移动模块</a>
			</dd>
			<dd>
				<a href="javascript:;">后台模版</a>
			</dd>
			<dd>
				<a href="javascript:;">电商平台</a>
			</dd>
		</dl></li>
</ul>

<script type="text/javascript">
	var config={};
	config.id=${r'"'}${menu.id?string}${r'"'};
	var ${menu.id?if_exists}=new Menu(config);
	//${r'$("#'}${menu.id?if_exists }${r'")'}
	
</script>