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

import cn.doublepoint.commonutil.ApplicationContextUtil;
import cn.doublepoint.commonutil.domain.model.BaseModel;

public class JPAUtil {

	public static <T extends BaseModel> void remove(Class<T> clazz, Object id) {
		BaseDaoService daoService=getDaoService();
		daoService.remove(clazz, id);
	}

	public static BaseDaoService getDaoService() {
		BaseDaoService daoService= (BaseDaoService)ApplicationContextUtil.getBean("daoService");
		return daoService;
	}

}
