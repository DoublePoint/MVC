/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年4月23日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.port.adapter.template.persistence.sys;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.querydsl.jpa.impl.JPAQueryFactory;

public class BaseQueryService {
	
	@Autowired  
    @PersistenceContext  
    public EntityManager entityManager;  
	
	public JPAQueryFactory queryFactory;  
    
    @PostConstruct  
    public void init() {  
        queryFactory = new JPAQueryFactory(entityManager);  
    }  
}
