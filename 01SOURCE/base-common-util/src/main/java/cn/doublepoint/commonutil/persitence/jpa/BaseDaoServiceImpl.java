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
import javax.persistence.criteria.Order;

import org.springframework.objenesis.instantiator.android.Android10Instantiator;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.doublepoint.commonutil.domain.model.BaseModel;
import cn.doublepoint.commonutil.domain.model.PageInfo;
import cn.doublepoint.commonutil.port.adapter.persistence.QueryParamList;
import cn.doublepoint.commonutil.port.adapter.persistence.SortParamList;

@Service(value = "daoService")
public class BaseDaoServiceImpl implements BaseDaoService {
	@PersistenceContext
	private EntityManager em;

	public <T extends BaseModel> T loadById(Class<T> clazz, Object id) {
		return em.find(clazz, id);
	}

	@Override
	public <T extends BaseModel> List<Long> getNextVal(Class<T> clazz, int count) {
		return null;
	}

	@SuppressWarnings({ "unchecked" })
	@Transactional
	@Override
	public <T extends BaseModel> List<T> load(Class<T> clazz, QueryParamList paramsList, PageInfo pageInfo,SortParamList sortParamList) {
		try {
			String className = clazz.getName();
			StringBuffer jpqlFromBuffer = new StringBuffer("FROM " + className + " U WHERE 1=1");
			if (paramsList != null) {
				paramsList.getParams().stream().forEach(param -> {
					jpqlFromBuffer.append(" AND U.").append(param.getName()).append(param.getRelation())
							.append(param.getValue());
				});
			}

			int firstIndex=-1;
			int lastIndex=-1;
			if (pageInfo != null) {
				StringBuffer countBuffer = new StringBuffer("Select count(U)" + jpqlFromBuffer.toString());
				Query countQuery = em.createQuery(countBuffer.toString());
				long count = (long) countQuery.getSingleResult();
				pageInfo.setTotalElementCount(count);
				firstIndex=getFirstResult(pageInfo);
				lastIndex=getMaxRsults(pageInfo);
			}
			
			StringBuffer queryBuffer=new StringBuffer();
			queryBuffer.append("SELECT U ").append(jpqlFromBuffer);
			if(sortParamList!=null){
				queryBuffer.append(" order by ");
				sortParamList.getParams().stream().forEach(param->{
					queryBuffer.append(" U.").append(param.getSortProperty()).append(" ").append(param.getSortType()).append(",");
				});
				queryBuffer.deleteCharAt(queryBuffer.length() - 1);
			}
			Query query = em.createQuery(queryBuffer.toString());
			if(firstIndex!=-1 && lastIndex !=-1){
				query.setFirstResult(getFirstResult(pageInfo));
				query.setMaxResults(getMaxRsults(pageInfo));
			}
			List<T> list = query.getResultList();
			return list;
		} catch (Exception e) {
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
	
	@Transactional
	@Override
	public <T extends BaseModel> void saveOrUpdate(T model) {
		em.merge(model);
	}

	@Transactional
	@Override
	public <T extends BaseModel> void saveOrUpdate(List<T> list) {
		list.stream().forEach(model->{
			saveOrUpdate(model);
		});
	}
	
	

	public EntityManager getEm() {
		return em;
	}

	public void setEm(EntityManager em) {
		this.em = em;
	}

	private int getFirstResult(PageInfo pageInfo) {
		int pageSize = (int) pageInfo.getPageSize();
		int pageNum = (int) pageInfo.getCurrentPageNum();
		return pageSize * (pageNum - 1);
	}

	private int getMaxRsults(PageInfo pageInfo) {
		return (int) pageInfo.getPageSize();
	}

}
