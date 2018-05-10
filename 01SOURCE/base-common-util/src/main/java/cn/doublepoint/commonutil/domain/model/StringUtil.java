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

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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
	 * aimStr中caseStr的后一个字符转换成大写
	 * @param aimStr
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
	
	/**
	 * 过滤字符串
	 * @param filters
	 * @param obj
	 * @return
	 */
	public static String filter(List<String> filters,String obj){
		for (String f : filters) {
			Matcher m = Pattern.compile(f, Pattern.CASE_INSENSITIVE).matcher(obj);
			obj=m.replaceAll("");   
		}
		return obj;
	}
	
	/**
	 * 大写第一个字母
	 * @param obj
	 * @return
	 */
	public static String upcaseTheFirstChar(String obj){
		return obj.substring(0, 1).toUpperCase()+obj.substring(1);
	}
}
