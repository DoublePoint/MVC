/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月9日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.commonutil.log;

import org.apache.log4j.Logger;

public class Log4jUtil {

	public static void debug(Object obj) {
		getLogger().debug(obj);
	}

	public static void error(Exception obj) {
		getLogger().error("", obj);
	}

	public static void info(Object obj) {
		getLogger().info(obj);
	}
	
	public static void warn(Exception obj){
		getLogger().warn(obj.getMessage(), null);
	}

	/**
	 * 获取最开始的调用者所在类
	 * 
	 * @return
	 */
	private static String getClassName() {
		Throwable th = new Throwable();
		StackTraceElement[] stes = th.getStackTrace();
		StackTraceElement ste = stes[3];
		return ste.getClassName();
	}

	/**
	 * 根据类名获得logger对象
	 * 
	 * @param className
	 * @return
	 */
	private static Logger getLogger() {
		try {
			return Logger.getLogger(Class.forName(getClassName()));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return  Logger.getLogger(Log4jUtil.class);
	}
}
