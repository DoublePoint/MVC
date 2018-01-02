/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年1月2日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.common.port.adapter.template.persistence.xt.cd;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public class BaseRepository {

//	@PersistenceContext(unitName="doublepoint")
	@PersistenceContext
    protected EntityManager entityManager;
}

