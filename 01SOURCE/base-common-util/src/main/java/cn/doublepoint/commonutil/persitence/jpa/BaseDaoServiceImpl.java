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

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.engine.spi.SessionFactoryImplementor;
import org.hibernate.hql.internal.classic.QueryTranslatorImpl;
import org.springframework.data.web.config.HateoasAwareSpringDataWebConfiguration;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.doublepoint.commonutil.ajaxmodel.PageInfo;
import cn.doublepoint.commonutil.port.adapter.persistence.QueryParam;
import cn.doublepoint.commonutil.port.adapter.persistence.QueryParamList;
import cn.doublepoint.commonutil.port.adapter.persistence.SortParamList;
import cn.doublepoint.template.dto.domain.model.entity.BaseModel;

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
	public <T extends BaseModel> List<T> load(Class<T> clazz, QueryParamList paramsList, PageInfo pageInfo,
			SortParamList sortParamList) {
		try {
			String className = clazz.getName();
			StringBuffer jpqlFromBuffer = new StringBuffer("SELECT U  FROM " + className + " U WHERE 1=1 ");
			if (paramsList != null) {
				paramsList.getParams().stream().forEach(param -> {
					if (param.getRelation() != QueryParam.RELATION_ISNULL
							&& param.getRelation() != QueryParam.RELATION_NOTNULL) {
						jpqlFromBuffer.append(" AND U.").append(param.getName()).append(" ").append(param.getRelation())
								.append(" ").append(":" + param.getName());
					} else
						jpqlFromBuffer.append(" AND U.").append(param.getName()).append(" ")
								.append(param.getRelation());

				});
			}

			int firstIndex = -1;
			int lastIndex = -1;
			if (pageInfo != null) {
				long count = count(jpqlFromBuffer.toString(), paramsList);
				pageInfo.setTotalElementCount(count);
				firstIndex = getFirstResult(pageInfo);
				lastIndex = getMaxRsults(pageInfo);
			}

			StringBuffer queryBuffer = new StringBuffer();
			queryBuffer.append(jpqlFromBuffer);
			if (sortParamList != null) {
				queryBuffer.append(" order by ");
				sortParamList.getParams().stream().forEach(param -> {
					queryBuffer.append(" U.").append(param.getSortProperty()).append(" ").append(param.getSortType())
							.append(",");
				});
				queryBuffer.deleteCharAt(queryBuffer.length() - 1);
			}
			Query query = em.createQuery(queryBuffer.toString());
			if (firstIndex != -1 && lastIndex != -1) {
				query.setFirstResult(getFirstResult(pageInfo));
				query.setMaxResults(getMaxRsults(pageInfo));
			}
			if (paramsList != null) {
				paramsList.getParams().stream().forEach(param -> {
					if (param.getRelation() != QueryParam.RELATION_ISNULL
							&& param.getRelation() != QueryParam.RELATION_NOTNULL) {
						query.setParameter(param.getName(), param.getValue());
					}
				});
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
		list.stream().forEach(model -> {
			saveOrUpdate(model);
		});
	}

	@Override
	@Transactional
	public int executeUpdate(String jpql, QueryParamList queryParamList) {
		Query query = em.createQuery(jpql);

		queryParamList.getParams().stream().forEach(param -> {
			query.setParameter(param.getName(), param.getValue());
		});
		int result = query.executeUpdate();
		return result;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public  List<Object> executeQuery(String jpql, QueryParamList queryParamList,PageInfo pageInfo) {
		Query query = em.createQuery(jpql);

		queryParamList.getParams().stream().forEach(param -> {
			query.setParameter(param.getName(), param.getValue());
		});
		if (pageInfo != null) {
			long count = count(jpql, queryParamList);
			pageInfo.setTotalElementCount(count);
			query.setFirstResult(getFirstResult(pageInfo));
			query.setMaxResults(getMaxRsults(pageInfo));
		}
		List<Object> result = query.getResultList();
		return result;
	}
	
	@Override
	public int executeNativeUpdate(String sql, QueryParamList queryParamList) {
		Query query = em.createNativeQuery(sql);

		queryParamList.getParams().stream().forEach(param -> {
			query.setParameter(param.getName(), param.getValue());
		});
		int result = query.executeUpdate();
		return result;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public  List<Object> executeNativeQuery(String sql, QueryParamList queryParamList,PageInfo pageInfo) {
		Query query = em.createNativeQuery(sql);
		if(queryParamList!=null){
			queryParamList.getParams().stream().forEach(param -> {
				query.setParameter(param.getName(), param.getValue());
			});
		}
		
		if (pageInfo != null) {
			long count = count(sql, queryParamList);
			pageInfo.setTotalElementCount(count);
			query.setFirstResult(getFirstResult(pageInfo));
			query.setMaxResults(getMaxRsults(pageInfo));
		}
		List<Object> result = query.getResultList();
		return result;
	}

	/**
	 * 更具查询条件和查询参数 获取结果总数
	 * 
	 * @param jpql
	 * @param queryParamList
	 * @return
	 */
	public long count(String jpql, QueryParamList queryParamList) {
		
		String sql=JPQLConverterUtil.convertJPQLToSQL(jpql,em);
		sql=sql.replace("：", ":");
		StringBuffer countBuffer = new StringBuffer("Select count(1) FROM (" + sql).append(") ll_c_t");
		Query countQuery = em.createNativeQuery(countBuffer.toString());
		
		if (queryParamList != null) {
			queryParamList.getParams().stream().forEach(param -> {
				if (param.getRelation() != QueryParam.RELATION_ISNULL
						&& param.getRelation() != QueryParam.RELATION_NOTNULL) {
					countQuery.setParameter(param.getName(), param.getValue());
				}
			});
		}
		
		
		Object object=countQuery.getSingleResult();
		return ((BigInteger )object).longValue();
	}

	/**
	 * 更具查询条件和查询参数 获取结果总数
	 * 
	 * @param jpql
	 * @param queryParamList
	 * @return
	 */
	public <T extends BaseModel> long count(Class<T> clazz, QueryParamList paramsList) {
		String className = clazz.getName();
		StringBuffer jpqlFromBuffer = new StringBuffer("SELECT U FROM " + className + " U WHERE 1=1 ");
		if (paramsList != null) {
			paramsList.getParams().stream().forEach(param -> {
				if (param.getRelation() != QueryParam.RELATION_ISNULL
						&& param.getRelation() != QueryParam.RELATION_NOTNULL) {
					jpqlFromBuffer.append(" AND U.").append(param.getName()).append(" ").append(param.getRelation())
							.append(" ").append(":" + param.getName());
				} else
					jpqlFromBuffer.append(" AND U.").append(param.getName()).append(" ").append(param.getRelation());

			});
		}
		return count(jpqlFromBuffer.toString(), paramsList);
	}
	
	@Override
	@Transactional
	public <T extends BaseModel> void create(T t) {
		em.persist(t);
	}
	
	@Override
	@Transactional
	public <T extends BaseModel> void create(List<T> list) {
		list.forEach(t->create(t));
	}

	@Override
	@Transactional
	public <T extends BaseModel> void update(T t) {
		em.merge(t);
	}
	
	@Override
	@Transactional
	public <T extends BaseModel> void update(List<T> list) {
		list.forEach(t->update(t));
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
