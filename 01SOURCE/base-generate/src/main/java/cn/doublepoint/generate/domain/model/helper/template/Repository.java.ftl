/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： ${datetime}
 * 
 * 类   说   明 ：Spring Data JPA
 * 
 * 修   改   人：          修   改   日   期：
 */
package cn.doublepoint.generate.domain.model.helper.template;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;

import cn.doublepoint.common.domain.model.entity.xt.*;

public interface <#list entityModel.modelClassCode?split('_') as n>${n?upper_case}</#list>Repository extends JpaRepository<T_${entityModel.modelClassCode},String>,QueryDslPredicateExecutor<T_${entityModel.modelClassCode}>, <#list entityModel.modelClassCode?split('_') as n>${n?upper_case}</#list>RepositoryExtend{
	
	
}