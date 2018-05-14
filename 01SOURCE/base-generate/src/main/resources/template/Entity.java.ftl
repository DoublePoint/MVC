/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： ${datetime}
 * 
 * 类   说   明 ：${entityModel.modelComment}
 * 
 * 修   改   人：          修   改   日   期：
 */
package cn.doublepoint.common.domain.model.entity.sys;

import java.util.*;
import java.io.Serializable;
import javax.persistence.*;
import cn.doublepoint.commonutil.domain.model.entity.BaseEntity;

@Entity
@Table(name="${entityModel.annotationTableName}")
public class ${entityModel.entityClassName} extends BaseEntity {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

<#list entityModel.fields as field>
	<#if field_index ==0>@Id</#if>
	@Column(name="${field.annotationColumnName}")
	private <@fieldType type=field.fieldType/> ${field.propertyName};
</#list>

<#list entityModel.fields as field>

	public <@fieldType type=field.fieldType/> ${field.getFunctionName}() {
		return ${field.propertyName};
	}
	
	public void ${field.setFunctionName}(<@fieldType type=field.fieldType/> ${field.propertyName}) {
		this.${field.propertyName} = ${field.propertyName};
	}
</#list>
	public String toString() {
		return "${entityModel.entityClassName} ["<#list entityModel.fields as field>
		+"${field.propertyName}=" + ${field.propertyName} <#if field_has_next>+","</#if></#list>
		+"]";
	}
}
<#macro fieldType type>
	
	<#if type?contains("bigint")>
	Long<#t/>
		<#elseif type?contains("long")>
	Long<#t/>
	<#elseif type?contains("int")>
	Integer<#t/>
	<#elseif type?contains("datetime")>
	Date<#t/>
	<#elseif type?contains("date")>
	Date<#t/>
	<#elseif type?contains("binary") || type?contains("blob")>
	Byte[]<#t/>
	<#elseif type?contains("float")>
	Float<#t/>
	<#elseif type?contains("double")>
	Double<#t/>
	<#else>
	${type}<#t/>
	</#if>
</#macro>