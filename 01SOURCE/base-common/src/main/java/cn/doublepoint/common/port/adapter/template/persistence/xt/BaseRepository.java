/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年1月2日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.port.adapter.template.persistence.xt;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.data.repository.NoRepositoryBean;

import com.querydsl.jpa.impl.JPAQueryFactory;

@NoRepositoryBean
public class BaseRepository {

	@PersistenceContext
	protected EntityManager entityManager;
	public JPAQueryFactory queryFactory;

	public void init() {
		queryFactory = new JPAQueryFactory(entityManager);
	}

	@PostConstruct
	public void initFactory() {
		this.init();
	}
}
