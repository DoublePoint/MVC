/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月14日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.common.port.adapter.template.persistence.xt.gly;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;

import cn.doublepoint.common.domain.model.entity.xt.T_XT_GLY;

public interface XTGLYRepository extends JpaRepository<T_XT_GLY,String>,QueryDslPredicateExecutor<T_XT_GLY>, XTGLYRepositoryCustom{
	
	
}
