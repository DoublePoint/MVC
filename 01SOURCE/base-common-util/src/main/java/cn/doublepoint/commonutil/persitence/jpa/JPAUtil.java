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

import java.lang.reflect.Field;
import java.util.List;
import java.util.stream.Stream;

import javax.persistence.Id;

import cn.doublepoint.commonutil.domain.model.BaseModel;
import cn.doublepoint.commonutil.domain.model.Log4jUtil;
import cn.doublepoint.commonutil.domain.model.PageInfo;
import cn.doublepoint.commonutil.port.adapter.persistence.QueryParamList;
import cn.doublepoint.commonutil.port.adapter.persistence.SortParamList;

public class JPAUtil extends DataBaseUtil{
	/**
	 * 获取实体信息
	 * @param clazz
	 * @param queryParamList
	 * @return
	 */
	public static <T extends BaseModel> T loadById(Class<T> clazz,Object id) {
		BaseDaoService daoService = getDaoService();
		return daoService.loadById(clazz,id);
	}
	
	/**
	 * 获取实体信息
	 * @param clazz
	 * @param queryParamList
	 * @return
	 */
	public static <T extends BaseModel> List<T> load(Class<T> clazz,QueryParamList queryParamList) {
		BaseDaoService daoService = getDaoService();
		return daoService.load(clazz,queryParamList,null,null);
	}
	
	/**
	 * 获取实体信息
	 * @param clazz
	 * @param queryParamList
	 * @return
	 */
	public static <T extends BaseModel> List<T> load(Class<T> clazz,PageInfo pageInfo) {
		BaseDaoService daoService = getDaoService();
		return daoService.load(clazz,null,pageInfo,null);
	}
	
	/**
	 * 获取实体信息
	 * @param clazz
	 * @param queryParamList
	 * @return
	 */
	public static <T extends BaseModel> List<T> load(Class<T> clazz,SortParamList sortParamList) {
		BaseDaoService daoService = getDaoService();
		return daoService.load(clazz,null,null,sortParamList);
	}
	
	/**
	 * 获取实体信息
	 * @param clazz
	 * @param queryParamList
	 * @return
	 */
	public static <T extends BaseModel> List<T> load(Class<T> clazz,QueryParamList queryParamList,PageInfo pageInfo) {
		BaseDaoService daoService = getDaoService();
		return daoService.load(clazz,queryParamList,pageInfo,null);
	}
	
	/**
	 * 获取实体信息
	 * @param clazz
	 * @param queryParamList
	 * @return
	 */
	public static <T extends BaseModel> List<T> load(Class<T> clazz,QueryParamList queryParamList,SortParamList sortParamList) {
		BaseDaoService daoService = getDaoService();
		return daoService.load(clazz,queryParamList,null,sortParamList);
	}
	
	/**
	 * 获取实体信息
	 * @param clazz
	 * @param queryParamList
	 * @return
	 */
	public static <T extends BaseModel> List<T> load(Class<T> clazz,PageInfo pageInfo,SortParamList sortParamList) {
		BaseDaoService daoService = getDaoService();
		return daoService.load(clazz,null,pageInfo,sortParamList);
	}
	
	/**
	 * 获取实体信息
	 * @param clazz
	 * @param queryParamList
	 * @return
	 */
	public static <T extends BaseModel> List<T> load(Class<T> clazz,QueryParamList queryParamList,PageInfo pageInfo,SortParamList sortParamList) {
		BaseDaoService daoService = getDaoService();
		return daoService.load(clazz,queryParamList,pageInfo,sortParamList);
	}
	
	public static <T extends BaseModel> List<T> loadAll(Class<T> clazz) {
		BaseDaoService daoService = getDaoService();
		return daoService.load(clazz,null,null,null);
	}

	/**
	 * 删除列表
	 * @param list
	 */
	public static <T extends BaseModel> void remove(List<T> list) {
		if (list == null || list.size() == 0)
			return;
		list.stream().forEach(JPAUtil::remove);
	}
	
	/**
	 * 保存
	 * @param list
	 */
	public static <T extends BaseModel> void saveOrUpdate(T t) {
		BaseDaoService daoService = getDaoService();
		daoService.saveOrUpdate(t);
	}
	
	/**
	 * 保存
	 * @param list
	 */
	public static <T extends BaseModel> void saveOrUpdate(List<T> list) {
		BaseDaoService daoService = getDaoService();
		daoService.saveOrUpdate(list);
	}

	/**
	 * 根据id删除
	 * 
	 * @param clazz
	 * @param id
	 */
	public static <T extends BaseModel> void remove(Class<T> clazz, Object id) {
		BaseDaoService daoService = getDaoService();
		daoService.remove(clazz, id);
	}

	/**
	 * 根据id删除
	 * 
	 * @param clazz
	 * @param id
	 */
	public static <T extends BaseModel> void remove(T model) {
		BaseDaoService daoService = getDaoService();
		try {
			daoService.remove(model.getClass(), getPrimary(model));
		} catch (IllegalArgumentException e) {
			Log4jUtil.error(e.getMessage());
		} catch (IllegalAccessException e) {
			Log4jUtil.error(e);
		}
	}

	private static <T extends BaseModel> Object getPrimary(T model)
			throws IllegalArgumentException, IllegalAccessException {
		Field[] fields = model.getClass().getDeclaredFields();
		Field res = Stream.of(fields).filter(field -> {
			field.setAccessible(true);
			return (field.getAnnotation(Id.class) != null);
		}).findAny().get();
		return res.get(model);
	}

}
