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

import cn.doublepoint.commonutil.domain.model.BaseModel;

public interface BaseDaoService {

	/**
	 * 删除
	 * @param clazz
	 * @param id
	 */
	public <T extends BaseModel> void remove(Class<T> clazz, Object id);
}
