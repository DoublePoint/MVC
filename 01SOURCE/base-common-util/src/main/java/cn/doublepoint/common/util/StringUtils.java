/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月15日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.util;

public class StringUtils {
	public static boolean isNullOrEmpty(String s) {
		if (s == null)
			return true;
		if ("".equals(s)) {
			return true;
		}
		return false;
	}
}
