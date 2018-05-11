/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月14日
* 
* 类   说   明 ：查询菜单服务
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.commonutil.persitence.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.PersistenceContext;

import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.deser.Deserializers.Base;

import cn.doublepoint.commonutil.ApplicationContextUtil;
import cn.doublepoint.commonutil.domain.model.BaseModel;

@Service
public class JPAUtil {

	@PersistenceContext
	EntityManager em;  
	  
	
	public <T extends BaseModel> void remove(Class<T> clazz, Object id) {
		//EntityManager entityManager = getEntityManager();
//		EntityTransaction transaction = entityManager.getTransaction();
//	 transaction.begin();

		T t = em.find(clazz, id);
		em.remove(t);
//		entityManager.flush();
//		transaction.commit();
//		entityManager.close();
	}

	private EntityManager getEntityManager() {
		EntityManagerFactory entityManagerFactory = (EntityManagerFactory) ApplicationContextUtil.getBean("entityManagerFactory");
		return entityManagerFactory.createEntityManager();

	}
}
