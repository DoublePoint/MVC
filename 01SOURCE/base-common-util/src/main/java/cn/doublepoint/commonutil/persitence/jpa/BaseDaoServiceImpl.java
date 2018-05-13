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
import cn.doublepoint.commonutil.domain.model.PageInfo;
import cn.doublepoint.commonutil.port.adapter.persistence.QueryParamList;

@Service(value="daoService")
public class BaseDaoServiceImpl implements BaseDaoService{
	@PersistenceContext
	private EntityManager em;
	
	/**
	 * 根据参数以及分页条件加载数据
	 * @param clazz
	 * @param paramsList
	 * @param pageInfo
	 * @return
	 */
	@SuppressWarnings({ "unchecked"})
	@Transactional
	@Override
	public <T extends BaseModel> List<T> load(Class<T> clazz,QueryParamList paramsList,PageInfo pageInfo) {
		try{
			String className=clazz.getName();
			StringBuffer jpqlBuffer=new StringBuffer("FROM "+className+" U WHERE 1=1");
			if(paramsList!=null){
				paramsList.getParams().forEach(param->{
					jpqlBuffer.append(" AND U.").append(param.getName()).append(param.getRelation()).append(param.getValue());
				});
			}
			
			Query query=em.createQuery("SELECT U "+jpqlBuffer.toString());
			
			if(pageInfo!=null){
				StringBuffer countBuffer=new StringBuffer("Select count(U)"+jpqlBuffer.toString());
				Query countQuery=em.createQuery(countBuffer.toString());
				long count=(long)countQuery.getSingleResult();
				pageInfo.setTotalElementCount(count);
				query.setFirstResult(getFirstResult(pageInfo));
				query.setMaxResults(getMaxRsults(pageInfo));
			}
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
	
	/**
	 * 获取第一条记录index 用于分页
	 * @param pageInfo
	 * @return
	 */
	private int getFirstResult(PageInfo pageInfo){
		int pageSize=(int)pageInfo.getPageSize();
		int pageNum=(int)pageInfo.getCurrentPageNum();
		return pageSize*(pageNum-1);
	}
	
	/**
	 * 获取第一条记录index 用于分页
	 * @param pageInfo
	 * @return
	 */
	private int getMaxRsults(PageInfo pageInfo){
		return (int)pageInfo.getPageSize();
	}
	
	
	
}
