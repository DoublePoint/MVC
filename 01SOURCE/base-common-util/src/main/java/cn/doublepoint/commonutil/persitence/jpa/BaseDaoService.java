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

import cn.doublepoint.commonutil.ajaxmodel.PageInfo;
import cn.doublepoint.commonutil.domain.model.BaseModel;
import cn.doublepoint.commonutil.port.adapter.persistence.QueryParamList;
import cn.doublepoint.commonutil.port.adapter.persistence.SortParamList;

public interface BaseDaoService {
	
	/**
	 * 获取count个数量的序列
	 * @param clazz 实体类型
	 * @param count 需要获取的数量
	 * @return
	 */
	public <T extends BaseModel> List<Long> getNextVal(Class<T> clazz, int count); 

	/**
	 * 根据Id获取数据
	 * @param clazz 实体类型
	 * @param id 主键
	 * @return
	 */
	public <T extends BaseModel> T loadById(Class<T> clazz, Object id); 
	
	/**
	 * 加载数据
	 * @param clazz
	 * @param paramsList
	 * @param pageInfo
	 * @return
	 */
	public <T extends BaseModel> List<T> load(Class<T> clazz,QueryParamList paramsList,PageInfo pageInfo,SortParamList sortParamList); 

	/**
	 * 删除
	 * @param clazz
	 * @param id
	 */
	public <T extends BaseModel> void remove(Class<T> clazz, Object id);

	
	/**
	 * 删除
	 * @param clazz
	 * @param id
	 */
	public <T extends BaseModel> void saveOrUpdate(T model);
	
	/**
	 * 删除
	 * @param clazz
	 * @param id
	 */
	public <T extends BaseModel> void saveOrUpdate(List<T> list);
}
