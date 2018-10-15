/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月22日
* 
* 类   说   明 ： 加密帮助类
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.commonutil.encrypt;

import cn.doublepoint.commonutil.ApplicationContextUtil;

public class EncyptUtil {

	/**
	 * 加密
	 * @param password
	 * @return
	 */
	public static String encypt(String password) {
		EncyptService service = (EncyptService) getEncyptService();
		return service.encypt(password);
	}

	private static EncyptService getEncyptService() {
		EncyptService encyptService = (EncyptService) ApplicationContextUtil.getBean("encyptService");
		return encyptService;
	}
}
