/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月25日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.base.jdbc;

import static java.util.stream.Collectors.toList;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.persistence.Table;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import cn.doublepoint.base.commonutil.domain.model.AjaxDataWrap;
import cn.doublepoint.base.commonutil.domain.model.PageInfo;
import cn.doublepoint.base.commonutil.port.adapter.persistence.BaseRepositoryUtil;
import cn.doublepoint.base.commonutil.port.adapter.persistence.QueryParamList;
import cn.doublepoint.base.commonutil.port.adapter.persistence.SortParamList;
import cn.doublepoint.common.util.domain.model.BaseModel;

public class JDBCUtil implements BaseRepositoryUtil {
	@Resource
	JdbcTemplate commonTemplate;

	@Override
	public <T extends BaseModel> List<T> executeQuery(String sql, final Class<T> clas) {
		return commonTemplate.query(sql, new BeanPropertyRowMapper<T>(clas));
	}

	@Override
	public <T extends BaseModel> List<T> load(Class<T> clazz, QueryParamList params) {
		return load(clazz, params, null, null).getData();
	}

	@Override
	public <T extends BaseModel> AjaxDataWrap<T> load(Class<T> clazz, PageInfo pageInfo) {
		return load(clazz, null, null, pageInfo);

	}

	@Override
	public <T extends BaseModel> List<T> load(Class<T> clazz, QueryParamList params, SortParamList sortParams) {
		return load(clazz, params, sortParams, null).getData();
	}

	@Override
	public <T extends BaseModel> AjaxDataWrap<T> load(Class<T> clazz, SortParamList sortParams, PageInfo pageInfo) {
		return load(clazz, null, sortParams, pageInfo);
	}

	/**
	 * 加载全部
	 * 
	 * @param clazz
	 * @return
	 */
	public <T extends BaseModel> List<T> loadAll(Class<T> clazz) {
		return load(clazz, null, null, null).getData();
	}

	@Override
	public <T extends BaseModel> AjaxDataWrap<T> load(Class<T> clazz, QueryParamList params, PageInfo pageInfo) {
		return load(clazz, params, null, pageInfo);
	}

	@Override
	public <T extends BaseModel> AjaxDataWrap<T> load(Class<T> clazz, QueryParamList params, SortParamList sortParams,
			PageInfo pageInfo) {
		BaseModel model;
		try {
			model = clazz.newInstance();
			
			Object[] paramArr = null;
			if (params!=null) {
				paramArr=params.getParams().stream().map(param -> param.getValue()).collect(toList()).toArray();
			}
			StringBuilder sb = new StringBuilder(model.getSelectSql());
			if (params != null)
				sb.append(params.getParamAndSql().getSqlString());
			int totalElementCount = queryCount(new StringBuilder("SELECT COUNT(*) FROM(").append(sb).append(") _VIRTUAL").toString(), paramArr);
			if (sortParams != null)
				sb.append(sortParams.getSortSql());

			pageInfo.setTotalElementCount(totalElementCount);
			if (pageInfo != null)
				sb.append(pageInfo.getLimitSql());
			List<T> dataList = commonTemplate.query(sb.toString(), paramArr, new BeanPropertyRowMapper<T>(clazz));
			AjaxDataWrap<T> ajaxDataWrap = new AjaxDataWrap<T>();
			ajaxDataWrap.setData(dataList);
			ajaxDataWrap.setPager(pageInfo);
			return ajaxDataWrap;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new AjaxDataWrap<T>();

	}

	@Override
	public <T extends BaseModel> void batchUpdate(List<T> updateList) {
		if (updateList == null || updateList.size() == 0)
			return;
		T model = updateList.get(0);
		String querySql = model.getUpdateSql();
		List<Object[]> paramsList = model.getQueryParamList(updateList);
		commonTemplate.batchUpdate(querySql, paramsList);

	}

	@Override
	public <T extends BaseModel> void batchInsert(List<T> insertList) {
		if (insertList == null || insertList.size() == 0)
			return;
		BaseModel model = insertList.get(0);
		String querySql = model.getInsertSql();
		List<Object[]> paramsList = model.getQueryParamList(insertList);
		commonTemplate.batchUpdate(querySql, paramsList);
	}

	@Override
	public <T extends BaseModel> void save2(List<T> objectList) throws Exception {
		if (objectList == null || objectList.size() == 0)
			return;
		Class clazz = objectList.get(0).getClass();
		Object object = objectList.get(0);
		Table table = (Table) clazz.getAnnotation(Table.class);
		String tableName = table.name();
		// 插入数据的列名
		StringBuilder columns = new StringBuilder("(");
		// 确定占位符的个数（即对象中不为 null 的字段个数）
		int columnNum = 0;
		// 填充占位符的值（即对象中不为null的字段的值）
		List<Object> valuesList = new ArrayList<Object>();

		Field[] fields = clazz.getDeclaredFields();
		for (Field field : fields) {
			field.setAccessible(true);
			if (field.get(object) != null) {
				columnNum++;
				columns.append(field.getName()).append(", ");
				valuesList.add(field.get(object));
			}
		}
		columns.replace(columns.lastIndexOf(", "), columns.length(), ")");
		// 获取所有的值
		for (int i = 1; i < objectList.size(); i++) {
			for (Field field : fields) {
				field.setAccessible(true);
				if (field.get(objectList.get(i)) != null) {
					valuesList.add(field.get(objectList.get(i)));
				}
			}
		}
		// 确定一个 Object 的占位符 '?'
		StringBuilder zhanweifuColumn = new StringBuilder("(");
		for (int i = 0; i < columnNum; i++) {
			zhanweifuColumn.append("?, ");
		}
		zhanweifuColumn.replace(zhanweifuColumn.lastIndexOf(", "), zhanweifuColumn.length(), ")");

		// 确定所有的占位符
		int objectNum = objectList.size();
		StringBuilder zhanweifu = new StringBuilder();
		for (int j = 0; j < objectNum; j++) {
			zhanweifu.append(zhanweifuColumn.toString()).append(", ");
		}
		zhanweifu.replace(zhanweifu.lastIndexOf(", "), zhanweifu.length(), "");

		// 生成最终 SQL
		String sql = "INSERT INTO " + tableName + " " + columns + " VALUES " + zhanweifu.toString();
		System.out.println(sql);
		System.out.println(valuesList);
	}

	@Override
	public int queryCount(String sql, Object[] params) {
		return commonTemplate.queryForObject(sql, params, Integer.class);
	}

	// /**
	// * 在数据库中插入实体集合
	// *
	// * @param <T>
	// * 泛型标识
	// * @param entities
	// * 需添加的实体集合，其中实体必须是继承BaseModel的实体对象
	// * @ 出错抛出异常
	// */
	// public static <T extends BaseModel> void create(Collection<T> entities)
	// {
	// IDAO dao = getBaseDAO();
	// dao.create(entities);
	// }
	//
	// /**
	// * 更新单个实体类
	// *
	// * @param <T>
	// * 泛型标识
	// * @param t
	// * 更新的实体对象，必须是继承BaseModel的实体对象
	// * @return 返回更新的对象
	// * @ 出错抛出异常
	// */
	// public static <T extends BaseModel> T update(T t) {
	// IDAO dao = getBaseDAO();
	// return dao.update(t);
	// }
	//
	// /**
	// * 批量更新实体集合
	// *
	// * @param <T>
	// * 泛型标识
	// * @param entities
	// * 需更新的实体集合，其中实体必须是继承BaseModel的实体对象
	// * @ 出错抛出异常
	// */
	// public static <T extends BaseModel> void update(Collection<T> entities)
	// {
	// IDAO dao = getBaseDAO();
	// dao.update(entities);
	// }
	//
	// /**
	// * 根据实体状态，决定采用插入还是保存
	// *
	// * @param <T>
	// * 泛型标识
	// * @param t
	// * 持久化实体对象，必须是继承BaseModel的实体对象
	// * @return 更新后的实体
	// * @ 出错抛出异常
	// */
	// public static <T extends BaseModel> T saveOrUpdate(T t) {
	// IDAO dao = getBaseDAO();
	// return dao.update(t);
	// }
	//
	// /**
	// * 对实体集合进行持久化处理，根据其状态决定更新还是插入
	// *
	// * @param <T>
	// * 泛型标识
	// * @param entities
	// * 持久化的实体集合，其中实体必须是继承BaseModel的实体对象
	// * @ 出错抛出异常
	// */
	// public static <T extends BaseModel> void saveOrUpdate(Collection<T>
	// entities)
	// {
	// IDAO dao = getBaseDAO();
	// dao.update(entities);
	// }
	//
	// /**
	// * 删除单个实体
	// *
	// * @param <T>
	// * 泛型标识
	// * @param t
	// * 需要删除的实体对象，必须是继承BaseModel的实体对象
	// * @ 出错抛出异常
	// */
	// @Deprecated
	// public static <T extends BaseModel> void remove(T t) {
	// IDAO dao = getBaseDAO();
	// dao.remove(t);
	// }
	//
	// /**
	// * 批量删除实体集合，采用逐个删除模式
	// *
	// * @param <T>
	// * 泛型标识
	// * @param entities
	// * 需要删除的实体集合，其中实体必须是必须是继承BaseModel的实体对象
	// * @ 出错抛出异常
	// */
	// @Deprecated
	// public static <T extends BaseModel> void remove(Collection<T> entities)
	// {
	// IDAO dao = getBaseDAO();
	// dao.remove(entities);
	// }
	//
	// /**
	// * 指定实体类型，删除主键标识的实体
	// *
	// * @param <T>
	// * 泛型标识
	// * @param clazz
	// * 实体类，必须是继承BaseModel的实体
	// * @param id
	// * 主键
	// * @ 出错抛出异常
	// */
	// public static <T extends BaseModel> void remove(Class<T> clazz,
	// Serializable id) {
	// IDAO dao = getBaseDAO();
	// dao.remove(clazz, id);
	// }
	//
	// /**
	// * 批量更新语句，采用JPQL模式，对数据库进行批量操作
	// *
	// * @param jpql
	// * JPQL执行语句
	// * @return 返回语句影响的行数，与数据库提供商有关
	// * @ 出错抛出异常
	// */
	// public static int executeUpdate(String jpql) {
	// IDAO dao = getBaseDAO();
	// return dao.executeUpdate(jpql);
	// }
	//
	// /**
	// * 批量更新语句，JPQL绑定参数形式，要求采用名称参数方式
	// *
	// * @param jpql
	// * JPQL执行语句
	// * @param params
	// * 绑定的参数结构
	// * @return 返回语句影响的行数，与数据库提供商有关
	// * @ 出错抛出异常
	// */
	// public static int executeUpdate(String jpql, QueryParamList params)
	// {
	// IDAO dao = getBaseDAO();
	// return dao.executeUpdate(jpql, params);
	// }
	//
	// /**
	// * 刷新实体
	// *
	// * @param <T>
	// * 泛型标识
	// * @param t
	// * 需刷新状态的实体对象，必须是继承BaseModel的实体对象
	// * @ 出错抛出异常
	// */
	// public static <T extends BaseModel> void refresh(T t) {
	// IDAO dao = getBaseDAO();
	// dao.refresh(t);
	// }
	//
	// /**
	// * 判断实体是否存在
	// *
	// * @param <T>
	// * 泛型标识
	// * @param clazz 实体类，必须是继承BaseModel的实体类
	// * @param id
	// * 实体主键
	// * @return true or false
	// * @ 出错抛出异常
	// */
	// public static <T extends BaseModel> boolean exists(Class<T> clazz,
	// Serializable id) {
	// IDAO dao = getBaseDAO();
	// T t = dao.loadById(clazz, id);
	// if (t == null) {
	// return false;
	// }
	// return true;
	// }
	//
	// /**
	// * 根据实体类别，通过主键查找实体对象
	// *
	// * @param <T>
	// * 泛型标识
	// * @param clazz
	// * 实体类，必须是继承BaseModel的实体
	// * @param id
	// * 主键
	// * @return 实体对象
	// * @ 出错抛出异常
	// */
	// public static <T extends BaseModel> T loadById(Class<T> clazz,
	// Serializable id) {
	// IDAO dao = getBaseDAO();
	// return dao.loadById(clazz, id);
	// }
	//
	// /**
	// * 检索实体的所有记录
	// *
	// * @param <T>
	// * 泛型标识
	// * @param clazz 实体类，必须是继承BaseModel的实体
	// * @return 检索后得到的实体列表
	// * @ 出错抛出异常
	// */
	// public static <T extends BaseModel> List<T> loadAll(Class<T> clazz)
	// {
	// IDAO dao = getBaseDAO();
	// return dao.loadAll(clazz);
	// }
	//
	// /**
	// * 检索实体的所有记录
	// *
	// * @param <T>
	// * 泛型标识
	// * @param clazz 实体类，必须是继承BaseModel的实体
	// * @return 检索后得到的实体列表
	// * @ 出错抛出异常
	// */
	// public static <T extends BaseModel> List<T> loadAll(Class<T>
	// clazz,SortParamList sortParams)
	// {
	// IDAO dao = getBaseDAO();
	// return dao.loadAll(clazz, sortParams);
	// }
	//

	// /**
	// * 根据jpql进行检索
	// *
	// * @param jpql
	// * jpql语句
	// * @return 检索后得到的对象列表
	// * @ 出错抛出异常
	// */
	// public static List<Object> find(String jpql) {
	// IDAO dao = getBaseDAO();
	// return dao.createQuery(jpql).getResultList();
	// }
	//
	// /**
	// * 带参数的jpql检索
	// *
	// * @param jpql
	// * jpql语句
	// * @param sortParams
	// * 参数
	// * @return 检索后得到的对象列表
	// * @ 出错抛出异常
	// */
	// public static List<Object> find(String jpql, SortParamList sortParams)
	// {
	// return find(jpql, null, sortParams, null);
	// }
	//
	//
	// /**
	// * 带参数的jpql检索
	// *
	// * @param jpql
	// * jpql语句
	// * @param params
	// * 参数
	// * @return 检索后得到的对象列表
	// * @ 出错抛出异常
	// */
	// public static List<Object> find(String jpql, QueryParamList params)
	// {
	// return find(jpql, params, null);
	// }
	//
	// /**
	// * 带参数的jpql检索
	// *
	// * @param jpql
	// * jpql语句
	// * @param params
	// * 参数
	// * @param sortParams
	// * 排序参数
	// * @return 检索后得到的对象列表
	// * @ 出错抛出异常
	// */
	// public static List<Object> find(String jpql, QueryParamList params,
	// SortParamList sortParams)
	// {
	// return find(jpql, params,sortParams, null);
	// }
	//
	// /**
	// * 带分页信息的jpql检索
	// *
	// * @param jpql
	// * jpql语句
	// * @param pageInfo
	// * 分页信息
	// * @return 检索后得到的对象列表
	// * @ 出错抛出异常
	// */
	// public static List<Object> find(String jpql, PageInfo pageInfo)
	// {
	// return find(jpql, null, pageInfo);
	// }
	//
	// /**
	// * 带参数、分页信息的jpql检索
	// *
	// * @param jpql
	// * jpql语句
	// * @param sortParams
	// * 排序参数
	// * @param pageInfo
	// * 分页信息
	// * @return 检索后得到的对象列表
	// * @ 出错抛出异常
	// */
	// public static List<Object> find(String jpql, SortParamList sortParams,
	// PageInfo pageInfo) {
	// return find(jpql, null, sortParams, pageInfo);
	// }
	//
	// /**
	// * 带参数、分页信息的jpql检索
	// *
	// * @param jpql
	// * jpql语句
	// * @param params
	// * 参数
	// * @param pageInfo
	// * 分页信息
	// * @return 检索后得到的对象列表
	// * @ 出错抛出异常
	// */
	// public static List<Object> find(String jpql, QueryParamList params,
	// PageInfo pageInfo) {
	// return find(jpql, params, pageInfo);
	// }
	//
	//
	// /**
	// * 带参数、分页信息的jpql检索
	// *
	// * @param jpql
	// * jpql语句
	// * @param params
	// * 参数
	// * @param sortParams
	// * 排序参数
	// * @param pageInfo
	// * 分页信息
	// * @return 检索后得到的对象列表
	// * @ 出错抛出异常
	// */
	// public static List<Object> find(String jpql, QueryParamList params,
	// SortParamList sortParams, PageInfo pageInfo) {
	// return find(jpql, params, sortParams, pageInfo);
	// }
	//
	// /**
	// * 带扩展语句的jpql检索
	// *
	// * @param jpql
	// * jpql语句
	// * @param params
	// * 参数
	// * @param sql
	// * 扩展jpql
	// * @param extParams
	// * 扩展参数
	// * @param pageInfo
	// * 分页信息
	// * @return 检索后得到的对象列表
	// * @ 出错抛出异常
	// */
	// public static List<Object> find(String jpql, QueryParamList params,
	// String sql, QueryParamList extParams, PageInfo pageInfo)
	// {
	// IDAO dao = getBaseDAO();
	// return dao.find(jpql, params, sql, extParams, null, pageInfo);
	// }
	//
	// /**
	// * 带扩展语句的jpql检索
	// *
	// * @param jpql
	// * jpql语句
	// * @param params
	// * 参数
	// * @param sql
	// * 扩展jpql
	// * @param extParams
	// * 扩展参数
	// * @param sortParams
	// * 排序参数
	// * @param pageInfo
	// * 分页信息
	// * @return 检索后得到的对象列表
	// * @ 出错抛出异常
	// */
	// public static List<Object> find(String jpql, QueryParamList params,
	// String sql, QueryParamList extParams, SortParamList sortParams,
	// PageInfo pageInfo)
	// {
	// IDAO dao = getBaseDAO();
	// return dao.find(jpql, params, sql, extParams, sortParams, pageInfo);
	// }
	//
	//
	// /**
	// * 执行命名查询
	// *
	// * @param queryName
	// * 命名查询的名称
	// * @return 查询后返回的对象列表
	// * @ 出错抛出异常
	// */
	// public static List<Object> executeNamedQuery(String queryName)
	// {
	// return executeNamedQuery(queryName, null);
	// }
	//
	// /**
	// * 执行带参数的命名查询
	// *
	// * @param queryName
	// * 命名查询的名称
	// * @param params
	// * 参数
	// * @return 查询后返回的对象列表
	// * @ 出错抛出异常
	// */
	// public static List<Object> executeNamedQuery(String queryName,
	// QueryParamList params) {
	// IDAO dao = getBaseDAO();
	// return dao.executeNamedQuery(queryName, params);
	// }
	//
	// /**
	// * 执行本地sql查询
	// *
	// * @param nativeSql
	// * 本地sql
	// * @return 查询后返回的对象列表
	// * @ 出错抛出异常
	// */
	// public static List<Object> executeNativeQuery(String nativeSql)
	// {
	// return executeNativeQuery(nativeSql, null);
	// }
	//
	// /**
	// * 执行本地sql查询
	// *
	// * @param nativeSql
	// * 本地sql
	// * @return 查询后返回的对象列表
	// * @ 出错抛出异常
	// */
	// public static List<Object> executeNativeQueryMapping(String
	// nativeSql,String resultMapping)
	// {
	// IDAO dao = getBaseDAO();
	// return dao.executeNativeQueryMapping(nativeSql, resultMapping);
	// }
	// /**
	// * 执行带参数的本地sql查询
	// *
	// * @param nativeSql
	// * 本地sql
	// * @param params
	// * 参数
	// * @return 查询后返回的对象列表
	// * @ 出错抛出异常
	// */
	// public static List<Object> executeNativeQuery(String nativeSql,
	// QueryParamList params) {
	// IDAO dao = getBaseDAO();
	// return dao.executeNativeQuery(nativeSql, params);
	// }
	//
	// /**
	// * 执行本地sql的更新操作
	// * @param nativeSql
	// * @return 影响的行数
	// * @
	// */
	// public static int executeNativeUpdate(String nativeSql)
	// {
	// IDAO dao = getBaseDAO();
	// return dao.executeNativeUpdate(nativeSql) ;
	// }
	//
	//
	// /**
	// * 执行本地sql的更新操作
	// * @param nativeSql
	// * @param params
	// * @return 影响的行数
	// * @
	// */
	// public static int executeNativeUpdate(String nativeSql, QueryParamList
	// params)
	// {
	// IDAO dao = getBaseDAO();
	// return dao.executeNativeUpdate(nativeSql,params) ;
	// }
	//
	//
	// /**
	// * 执行本地sql查询，并且指定返回结果集类型
	// *
	// * @param <T> 泛型标识
	// * @param nativeSql
	// * 本地sql
	// * @param returnClazz
	// * 返回的结果集类型，必须是继承BaseModel的实体类
	// * @return 查询后返回的实体列表
	// * @ 出错抛出异常
	// */
	// public static <T extends BaseModel> List<T> executeNativeQueryWithRet(
	// String nativeSql, Class<T> returnClazz) {
	// return executeNativeQueryWithRet(nativeSql, null, returnClazz);
	// }
	//
	// /**
	// * 执行带参数的本地sql查询，并且指定返回结果集类型
	// *
	// * @param <T> 泛型标识
	// * @param nativeSql
	// * 本地sql
	// * @param params
	// * 参数
	// * @param returnClazz
	// * 返回的结果集类型，必须是继承BaseModel的实体类
	// * @return 查询后返回的实体列表
	// * @ 出错抛出异常
	// */
	// public static <T extends BaseModel> List<T> executeNativeQueryWithRet(
	// String nativeSql, QueryParamList params, Class<T> returnClazz)
	// {
	// IDAO dao = getBaseDAO();
	// return dao.executeNativeQueryWithRet(nativeSql, params, returnClazz);
	// }
	//
	// /**
	// * 统计一个实体的所有记录数
	// *
	// * @param <T>
	// * 泛型标识
	// * @param clazz 实体类，必须是继承BaseModel的实体
	// * @return 记录数
	// * @ 出错抛出异常
	// */
	// public static <T extends BaseModel> long getTotalCount(Class<T> clazz)
	// {
	// return getTotalCount(clazz, null);
	// }
	//
	// /**
	// * 统计带参数的实体的所有记录数
	// *
	// * @param <T>
	// * 泛型标识
	// * @param clazz 实体类，必须是继承BaseModel的实体
	// * @param params
	// * 参数
	// * @return 记录数
	// * @ 出错抛出异常
	// */
	// public static <T extends BaseModel> long getTotalCount(Class<T> clazz,
	// QueryParamList params) {
	// return getTotalCount(clazz, params, null, null);
	// }
	//
	// /**
	// * 统计带扩展查询的实体的所有记录数
	// *
	// * @param <T>
	// * 泛型标识
	// * @param clazz 实体类，必须是继承BaseModel的实体
	// * @param params
	// * 参数
	// * @param sql
	// * 扩展jpql
	// * @param extParams
	// * 扩展参数
	// * @return 记录数
	// * @ 出错抛出异常
	// */
	// public static <T extends BaseModel> long getTotalCount(Class<T> clazz,
	// QueryParamList params, String sql, QueryParamList extParams)
	// {
	// IDAO dao = getBaseDAO();
	// return dao.getTotalCount(clazz, params, sql, extParams);
	// }
	//
	// /**
	// * 统计指定jpql的所有记录数
	// *
	// * @param jpql
	// * jpql语句
	// * @return 记录数
	// * @ 出错抛出异常
	// */
	// public static long getTotalCount(String jpql) {
	// return getTotalCount(jpql, null);
	// }
	//
	// /**
	// * 统计带参数的jpql的所有记录数
	// *
	// * @param jpql
	// * jpql语句
	// * @param params
	// * 参数
	// * @return 记录数
	// * @ 出错抛出异常
	// */
	// public static long getTotalCount(String jpql, QueryParamList params)
	// {
	// return getTotalCount(jpql, params, null, null);
	// }
	//
	// /**
	// * 统计带扩展查询的jpql的所有记录数
	// *
	// * @param jpql
	// * jpql语句
	// * @param params
	// * 参数
	// * @param sql
	// * 扩展jpql
	// * @param extParams
	// * 扩展参数
	// * @return 记录数
	// * @ 出错抛出异常
	// */
	// public static long getTotalCount(String jpql, QueryParamList params,
	// String sql, QueryParamList extParams) {
	// IDAO dao = getBaseDAO();
	// return dao.getTotalCount(jpql, params, sql, extParams);
	// }
	//
	// /**
	// * 执行不带参数的存储过程，没有返回值
	// *
	// * @param procName
	// * 存储过程名称
	// * @ 出错抛出异常
	// */
	// public static void executeProc(String procName) {
	// executeProc(procName, null);
	// }
	//
	// /**
	// * 执行带参数的存储过程，没有返回值
	// *
	// * @param procName
	// * 存储过程的名字
	// * @param params
	// * 参数
	// * @ 出错抛出异常
	// */
	// public static void executeProc(String procName, Object[] params)
	// {
	// IDAO dao = getBaseDAO();
	// dao.executeProc(procName, params);
	// }
	//
	// /**
	// * 执行返回单值的存储过程
	// *
	// * @param procName
	// * 存储过程的名称
	// * @return 存储过程的返回值
	// * @ 出错抛出异常
	// */
	// public static Object executeProcWithResult(String procName)
	// {
	// return executeProcWithResult(procName, null);
	// }
	//
	// /**
	// * 执行返回单值的、带参数的存储过程
	// *
	// * @param procName
	// * 存储过程的名称
	// * @param params
	// * 参数
	// * @return 存储过程的返回值
	// * @ 出错抛出异常
	// */
	// public static Object executeProcWithResult(String procName, Object[]
	// params)
	// {
	// IDAO dao = getBaseDAO();
	// return dao.executeProcWithResult(procName, params);
	// }
	//
	// /**
	// * 执行返回结果集的存储过程
	// *
	// * @param <T>
	// * 泛型标识
	// * @param procName
	// * 存储过程的名称
	// * @param clazz
	// * 返回的结果集类型，必须是继承BaseModel的实体
	// * @return 实体列表
	// * @ 出错抛出异常
	// */
	// public static <T extends BaseModel> List<T> executeProcWithResultSet(
	// String procName, Class<T> clazz) {
	// return executeProcWithResultSet(procName, null, clazz);
	// }
	//
	// /**
	// * 执行带参数的返回结果集的存储过程
	// *
	// * @param <T>
	// * 泛型标识
	// * @param procName
	// * 存储过程的名称
	// * @param params
	// * 参数
	// * @param clazz
	// * 返回的结果集类型，必须是继承BaseModel的实体
	// * @return 实体列表
	// * @ 出错抛出异常
	// */
	// public static <T extends BaseModel> List<T> executeProcWithResultSet(
	// String procName, Object[] params, Class<T> clazz)
	// {
	// IDAO dao = getBaseDAO();
	// return dao.executeProcWithResultSet(procName, params, clazz);
	// }
	//
	//
	// /**
	// * 清空缓存
	// * @
	// */
	// public static void clear() {
	// IDAO dao = getBaseDAO();
	// dao.clear() ;
	// }
	//
	// /**
	// * 将受控实体同步到数据库
	// * @
	// */
	// public static void flush() {
	// IDAO dao = getBaseDAO();
	// dao.flush() ;
	// }
	// Class FieldUtil{
	//
	// }
}
