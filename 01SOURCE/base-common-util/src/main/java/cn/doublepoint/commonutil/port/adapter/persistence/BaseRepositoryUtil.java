/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月26日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.commonutil.port.adapter.persistence;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.doublepoint.commonutil.ajaxmodel.AjaxDataPacket;
import cn.doublepoint.dto.domain.model.entity.BaseModel;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;
import cn.doublepoint.dto.domain.model.vo.query.QueryParamList;
import cn.doublepoint.dto.domain.model.vo.query.SortParamList;

@Service
public interface BaseRepositoryUtil {

	<T extends BaseModel> List<T> executeQuery(String sql, Class<T> clas);

	<T extends BaseModel> List<T> executeQuery(String sql, Object[] params, Class<T> clas);
	/**
	 * 带参数的实体检索
	 *
	 * @param <T>
	 *            泛型标识
	 * @param clazz
	 *            实体类，必须是继承BaseModel的实体
	 * @param params
	 *            参数
	 * @return 检索后得到的实体列表 @ 出错抛出异常
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 */
	<T extends BaseModel> List<T> load(Class<T> clazz, QueryParamList params);

	/**
	 * 带分页的实体检索
	 *
	 * @param <T>
	 *            泛型标识
	 * @param clazz
	 *            实体类，必须是继承BaseModel的实体
	 * @param pageInfo
	 *            分页信息
	 * @return 检索后得到的实体列表 @ 出错抛出异常
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 */
	<T extends BaseModel> AjaxDataPacket<T> load(Class<T> clazz, PageInfo pageInfo);

	/**
	 * 带参数的实体检索
	 *
	 * @param <T>
	 *            泛型标识
	 * @param clazz
	 *            实体类，必须是继承BaseModel的实体
	 * @param params
	 *            参数
	 * @param sortParams
	 *            排序参数
	 * @return 检索后得到的实体列表 @ 出错抛出异常
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 */
	<T extends BaseModel> List<T> load(Class<T> clazz, QueryParamList params, SortParamList sortParams);

	/**
	 * 带参数、分页的实体检索
	 *
	 * @param <T>
	 *            泛型标识
	 * @param clazz
	 *            实体类，必须是继承BaseModel的实体
	 * @param sortParams
	 *            排序参数
	 * @param pageInfo
	 *            分页信息
	 * @return 检索后得到的实体列表 @ 出错抛出异常
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 */
	<T extends BaseModel> AjaxDataPacket<T> load(Class<T> clazz, SortParamList sortParams, PageInfo pageInfo);

	/**
	 * 带参数、分页的实体检索
	 *
	 * @param <T>
	 *            泛型标识
	 * @param clazz
	 *            实体类，必须是继承BaseModel的实体
	 * @param params
	 *            参数
	 * @param pageInfo
	 *            分页信息
	 * @return 检索后得到的实体列表 @ 出错抛出异常
	 */
	<T extends BaseModel> AjaxDataPacket<T> load(Class<T> clazz, QueryParamList params, PageInfo pageInfo);

	/**
	 * 带参数、分页的实体检索
	 *
	 * @param <T>
	 *            泛型标识
	 * @param clazz
	 *            实体类，必须是继承BaseModel的实体
	 * @param params
	 *            参数
	 * @param sortParams
	 *            排序参数
	 * @param pageInfo
	 *            分页信息
	 * @return 检索后得到的实体列表 @ 出错抛出异常
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 */
	<T extends BaseModel> AjaxDataPacket<T> load(Class<T> clazz, QueryParamList params, SortParamList sortParams,
			PageInfo pageInfo);

	/**
	 * 批量更新
	 * 
	 * @param queryModelList
	 */
	<T extends BaseModel> void batchUpdate(List<T> updateList);

	/**
	 * 批量插入
	 * 
	 * @param queryModelList
	 */
	<T extends BaseModel> void batchInsert(List<T> insertList);

	/**
	 * 查询条数
	 * 
	 * @param sql
	 * @return
	 */
	int queryCount(String sql, Object[] params);


}