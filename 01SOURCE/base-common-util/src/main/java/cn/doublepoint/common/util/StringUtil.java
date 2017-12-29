/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月29日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.common.util;

import org.apache.commons.lang.StringUtils;

public class StringUtil extends StringUtils{

	public static boolean isNullOrEmpty(String str){
		return StringUtils.isEmpty(str);
	}
}
