/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月29日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.commonutil.domain.model;

import java.util.stream.Stream;

import org.apache.commons.lang.StringUtils;

public class StringUtil extends StringUtils{

	/**
	 * 判断字符串是null或者“”
	 * @param str
	 * @return
	 */
	public static boolean isNullOrEmpty(String str){
		return StringUtils.isEmpty(str);
	}
	
	/**
	 * 将字符串转换成大写
	 * @param str
	 * @return
	 */
	public static String upcase(String str){
		return str.toUpperCase();
	}
	
	/**
	 * caseStr中caseStr的后一个字符转换成大写
	 * @param caseStr
	 * @param caseStr
	 * @return
	 */
	public static String upcaseAfter(String aimStr, String caseStr) {
		if (isNullOrEmpty(aimStr) || isNullOrEmpty(caseStr))
			return "";
		String[] arr = aimStr.split(caseStr);
		StringBuffer sBuffer=new StringBuffer();
		Stream.of(arr).forEach(str -> {
			str = str.substring(0, 1).toString().toUpperCase() + str.substring(1);
			sBuffer.append(str);
		});
		return sBuffer.toString();
	}
}
