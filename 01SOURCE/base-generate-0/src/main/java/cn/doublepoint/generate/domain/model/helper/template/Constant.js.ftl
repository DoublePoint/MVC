/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： ${datetime}
 * 
 * 类   说   明 ：	同后端XTConstant.java
 * 
 * 修   改   人：          修   改   日   期：
 */
var XTConstant={
<#list fieldList as field>		

		${field.fieldName}:<@fieldType type=field.fieldType/>${field.fieldValue}<@fieldType type=field.fieldType/>,
</#list>		
};

<#macro fieldType type>
	<#if type?contains("string")>
	"<#t/>
	<#else>
	<#t/>
	</#if>
</#macro>