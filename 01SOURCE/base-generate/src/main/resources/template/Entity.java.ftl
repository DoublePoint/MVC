/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： ${datetime}
 * 
 * 类   说   明 ：${baseModel.entityModel.modelComment}
 * 
 * 修   改   人：          修   改   日   期：
 */
package cn.doublepoint.common.domain.model.entity.sys;

import java.util.*;
import java.io.Serializable;
import javax.persistence.*;
import cn.doublepoint.commonutil.domain.model.entity.BaseEntity;

@Entity
@Table(name="${baseModel.entityModel.annotationTableName}")
public class ${baseModel.entityModel.entityClassName} extends BaseEntity {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

<#list baseModel.entityModel.fields as field>
	<#if field_index ==0>@Id</#if>
	@Column(name="${field.annotationColumnName}")
	private ${field.fieldTypeStr} ${field.propertyName};
</#list>
<#list baseModel.entityModel.fields as field>

	public ${field.fieldTypeStr} ${field.getFunctionName}() {
		return ${field.propertyName};
	}
	
	public void ${field.setFunctionName}(${field.fieldTypeStr} ${field.propertyName}) {
		this.${field.propertyName} = ${field.propertyName};
	}
</#list>

	public String toString() {
		return "${baseModel.entityModel.entityClassName} ["<#list baseModel.entityModel.fields as field>
		+"${field.propertyName}=" + ${field.propertyName} <#if field_has_next>+","</#if></#list>
		+"]";
	}
}