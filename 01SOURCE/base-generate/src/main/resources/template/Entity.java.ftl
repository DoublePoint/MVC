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
@Table(name="${entityModel.tableName}")
public class ${entityModel.className} extends BaseEntity {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

<#list entityModel.fields as field>
	<#if field_index ==0>@Id</#if>
	@Column
	private <@fieldType type=field.fieldType/> <#list field.fieldName?split('_') as n><#if n_index ==0>${n}<#else>${n?cap_first}</#if></#list>;
</#list>

<#list entityModel.fields as field>

	public <@fieldType type=field.fieldType/> get<#list field.fieldName?split('_') as n>${n?cap_first}</#list>() {
		return <#list field.fieldName?split('_') as n><#if n_index ==0>${n}<#else>${n?cap_first}</#if></#list>;
	}
	
	public void set<#list field.fieldName?split('_') as n>${n?cap_first}</#list>(<@fieldType type=field.fieldType/> <#list field.fieldName?split('_') as n><#if n_index ==0>${n}<#else>${n?cap_first}</#if></#list>) {
		this.<#list field.fieldName?split('_') as n><#if n_index ==0>${n}<#else>${n?cap_first}</#if></#list> = <#list field.fieldName?split('_') as n><#if n_index ==0>${n}<#else>${n?cap_first}</#if></#list>;
	}
</#list>
	public String toString() {
		return "${entityModel.className} [<#list entityModel.fields as field>
		<#list field.fieldName?split('_') as n><#if n_index ==0>${n}<#else>${n?cap_first}</#if></#list>=" + <#list field.fieldName?split('_') as n><#if n_index ==0>${n}<#else>${n?cap_first}</#if></#list> + "<#if field_has_next>,</#if></#list>]";
	}
}
<#macro fieldType type>
	<#if type?contains("bigint")>
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