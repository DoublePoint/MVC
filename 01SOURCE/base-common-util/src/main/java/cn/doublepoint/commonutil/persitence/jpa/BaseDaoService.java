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

import cn.doublepoint.dto.domain.model.entity.BaseModel;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;
import cn.doublepoint.dto.domain.model.vo.query.QueryParamList;
import cn.doublepoint.dto.domain.model.vo.query.SortParamList;

public interface BaseDaoService {

	/**
	 * 获取count个数量的序列
	 * 
	 * @param clazz
	 *            实体类型
	 * @param count
	 *            需要获取的数量
	 * @return
	 */
	public <T extends BaseModel> List<Long> getNextVal(Class<T> clazz, int count);

	/**
	 * 根据Id获取数据
	 * 
	 * @param clazz
	 *            实体类型
	 * @param id
	 *            主键
	 * @return
	 */
	public <T extends BaseModel> T loadById(Class<T> clazz, Object id);

	/**
	 * 加载数据
	 * 
	 * @param clazz
	 * @param paramsList
	 * @param pageInfo
	 * @return
	 */
	public <T extends BaseModel> List<T> load(Class<T> clazz, QueryParamList paramsList, PageInfo pageInfo,
			SortParamList sortParamList);

	/**
	 * 删除
	 * 
	 * @param clazz
	 * @param id
	 */
	public <T extends BaseModel> void remove(Class<T> clazz, Object id);

	/**
	 * 删除
	 * 
	 * @param clazz
	 * @param id
	 */
	public <T extends BaseModel> void saveOrUpdate(T model);

	/**
	 * 删除
	 * 
	 * @param clazz
	 * @param id
	 */
	public <T extends BaseModel> void saveOrUpdate(List<T> list);

	/**
	 * 批量更新
	 * 
	 * @param jpql
	 * @param queryParamList
	 * @return
	 */
	public int executeUpdate(String jpql, QueryParamList queryParamList);

	/**
	 * 批量更新
	 * 
	 * @param sql
	 * @param queryParamList
	 * @return
	 */
	public int executeNativeUpdate(String sql, QueryParamList queryParamList);

	/**
	 * 执行jpql查询
	 * 
	 * @param jpql
	 * @param queryParamList
	 * @return
	 */
	public List<Object> executeQuery(String jpql, QueryParamList queryParamList,PageInfo pageInfo);

	/**
	 * 执行sql查询
	 * 
	 * @param sql
	 * @param queryParamList
	 * @return
	 */
	public List<Object> executeNativeQuery(String sql, QueryParamList queryParamList,PageInfo pageInfo);

	/**
	 * 查询总数
	 * 
	 * @param jpql
	 * @param queryParamList
	 * @return
	 */
	public long count(String jpql, QueryParamList queryParamList);

	/**
	 * 查询总数
	 * 
	 * @param jpql
	 * @param queryParamList
	 * @return
	 */
	public <T extends BaseModel> long count(Class<T> clazz, QueryParamList queryParamList);

	/**
	 * 创建实体
	 * 
	 * @param t
	 */
	public <T extends BaseModel> void create(T t);

	/**
	 * 创建实体
	 * 
	 * @param t
	 */
	public <T extends BaseModel> void create(List<T> t);

	/**
	 * 更新实体
	 * 
	 * @param t
	 */
	public <T extends BaseModel> void update(T t);

	/**
	 * 更新实体
	 * 
	 * @param t
	 */
	public <T extends BaseModel> void update(List<T> t);
}
