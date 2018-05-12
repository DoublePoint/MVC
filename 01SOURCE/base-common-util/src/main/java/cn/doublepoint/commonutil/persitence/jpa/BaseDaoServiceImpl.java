/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月12日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.commonutil.persitence.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.doublepoint.commonutil.domain.model.BaseModel;
import cn.doublepoint.commonutil.port.adapter.persistence.QueryParamList;

@Service(value="daoService")
public class BaseDaoServiceImpl implements BaseDaoService{
	@PersistenceContext
	private EntityManager em;
	
	@SuppressWarnings({ "unchecked"})
	@Transactional
	@Override
	public <T extends BaseModel> List<T> load(Class<T> clazz,QueryParamList paramsList) {
		try{
			String className=clazz.getName();
			StringBuffer sbBuffer=new StringBuffer("SELECT U FROM "+className+" U WHERE 1=1");
			paramsList.getParams().forEach(param->{
				sbBuffer.append(" AND U.").append(param.getName()).append(param.getRelation()).append(param.getValue());
			});
			Query query=em.createQuery(sbBuffer.toString());
			List<T> list= query.getResultList();
			return list;
		}
		catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	} 
	
	@SuppressWarnings({ "unchecked" })
	@Transactional
	@Override
	public <T extends BaseModel> List<T> loadAll(Class<T> clazz) {
		try{
			String className=clazz.getClass().getName();
			Query query=em.createQuery(String.format("SELECT U FROM %1 U ",className));
			List<T> list= query.getResultList();
			return list;
		}
		catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	} 
	
	@Transactional
	@Override
	public <T extends BaseModel> void remove(Class<T> clazz, Object id) {
		T t = em.find(clazz, id);
		em.remove(t);
	}

	public EntityManager getEm() {
		return em;
	}

	public void setEm(EntityManager em) {
		this.em = em;
	}  
	
	
	
}
