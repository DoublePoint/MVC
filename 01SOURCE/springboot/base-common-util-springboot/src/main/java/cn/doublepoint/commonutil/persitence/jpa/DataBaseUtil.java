/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月14日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.commonutil.persitence.jpa;

import cn.doublepoint.commonutil.ApplicationContextUtil;

public class DataBaseUtil {
	public static BaseDaoService getDaoService() {
		BaseDaoService daoService = (BaseDaoService) ApplicationContextUtil.getBean("daoService");
		return daoService;
	}
}
