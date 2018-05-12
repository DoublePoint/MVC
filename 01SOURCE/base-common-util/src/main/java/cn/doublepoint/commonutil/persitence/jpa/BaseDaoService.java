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

import cn.doublepoint.commonutil.domain.model.BaseModel;
import cn.doublepoint.commonutil.port.adapter.persistence.QueryParamList;

public interface BaseDaoService {

	/**
	 * 删除
	 * @param clazz
	 * @param id
	 */
	public <T extends BaseModel> void remove(Class<T> clazz, Object id);

	/**
	 * 加载数据
	 * @param clazz
	 * @param paramsList
	 * @return
	 */
	public <T extends BaseModel> List<T> load(Class<T> clazz, QueryParamList paramsList);

	/**
	 * 加载全部数据
	 * @param clazz
	 * @return
	 */
	public <T extends BaseModel> List<T> loadAll(Class<T> clazz);
}
