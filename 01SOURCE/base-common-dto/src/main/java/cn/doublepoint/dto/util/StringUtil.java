/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月29日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.dto.util;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Stream;

import org.springframework.util.StringUtils;

public class StringUtil extends StringUtils {

	/**
	 * 判断字符串是null或者“”
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isNullOrEmpty(String str) {
		return StringUtils.isEmpty(str);
	}

	/**
	 * 将字符串转换成大写
	 * 
	 * @param str
	 * @return
	 */
	public static String upcase(String str) {
		return str.toUpperCase();
	}

	/**
	 * aimStr中caseStr的后一个字符转换成大写
	 * 
	 * @param aimStr
	 * @param caseStr
	 * @return
	 */
	public static String upcaseAfter(String aimStr, String caseStr) {
		if (isNullOrEmpty(aimStr) || isNullOrEmpty(caseStr))
			return "";
		String[] arr = aimStr.split(caseStr);
		if(arr.length==0)
			return "";
		StringBuffer sBuffer = new StringBuffer();
		sBuffer.append(arr[0]);
		arr[0]="";
		Stream.of(arr).forEach(str -> {
			try{
				str = str.substring(0, 1).toString().toUpperCase() + str.substring(1);
				sBuffer.append(str);
			}
			catch(Exception e){
			}
		});
		return sBuffer.toString();
	}

	/**
	 * 过滤字符串
	 * 
	 * @param filters
	 * @param obj
	 * @return
	 */
	public static String filter(List<String> filters, String obj) {
		for (String f : filters) {
			Matcher m = Pattern.compile(f, Pattern.CASE_INSENSITIVE).matcher(obj);
			obj = m.replaceAll("");
		}
		return obj;
	}

	/**
	 * 大写第一个字母
	 * 
	 * @param obj
	 * @return
	 */
	public static String uppercaseTheFirstChar(String obj) {
		return obj.substring(0, 1).toUpperCase() + obj.substring(1);
	}
	
	/**
	 * 大写第一个字母
	 * 
	 * @param obj
	 * @return
	 */
	public static String lowercaseTheFirstChar(String obj) {
		return obj.substring(0, 1).toLowerCase() + obj.substring(1);
	}

	/**
	 * 驼峰转换成 下划线 所有字母大写 例如：HelloWorld->HELLO_WORLD
	 * 
	 * @param name
	 *            转换前的驼峰式命名的字符串
	 * @return 转换后下划线大写方式命名的字符串
	 */
	public static String camelToUnderlineOfAllUpper(String name) {
		if (isNullOrEmpty(name))
			return "";
		StringBuffer result=new StringBuffer(name);
		// 循环处理其余字符
		for (int i = 1; i < name.length(); i++) {
			String s = name.substring(i, i + 1);
			// 在大写字母前添加下划线
			if (s.equals(s.toUpperCase()) && !Character.isDigit(s.charAt(0))) {
				result.insert(i, "_");
			}
		}

		return result.toString().toUpperCase();
	}
	
	/**
	 * 驼峰转换成 下划线 所有字母大写 例如：HelloWorld->hello_world
	 * 
	 * @param name
	 *            转换前的驼峰式命名的字符串
	 * @return 转换后下划线大写方式命名的字符串
	 */
	public static String camelToUnderlineOfAllLowcase(String name) {
		if (isNullOrEmpty(name))
			return "";
		StringBuffer result=new StringBuffer(name);
		// 循环处理其余字符
		for (int i = 1; i < name.length(); i++) {
			String s = name.substring(i, i + 1);
			// 在大写字母前添加下划线
			if (s.equals(s.toUpperCase()) && !Character.isDigit(s.charAt(0))) {
				result.insert(i, "_");
			}
		}

		return result.toString().toLowerCase();
	}

	/**
	 * 将下划线大写方式命名的字符串转换为驼峰式。如果转换前的下划线大写方式命名的字符串为空，则返回空字符串。</br>
	 * 例如：HELLO_WORLD->helloWorld
	 * 
	 * @param name
	 *            转换前的下划线大写方式命名的字符串
	 * @return 转换后的驼峰式命名的字符串
	 */
	public static String underlineToCamel(String name) {
		if (StringUtil.isNullOrEmpty(name))
			return "";
		name = name.toLowerCase();
		name = upcaseAfter(name, "_");
		name = name.replace("_", "");
		return name;
	}

	/**
	 * 将下划线大写方式命名的字符串转换为驼峰式。如果转换前的下划线大写方式命名的字符串为空，则返回空字符串。</br>
	 * 例如：HELLO_WORLD->HelloWorld
	 * 
	 * @param name
	 *            转换前的下划线大写方式命名的字符串
	 * @return 转换后的驼峰式命名的字符串
	 */
	public static String underlineToCamelOfFirstUpper(String name) {
		if (StringUtil.isNullOrEmpty(name))
			return "";
		name = name.toLowerCase();
		name = uppercaseTheFirstChar(name);
		name = upcaseAfter(name, "_");
		name = name.replace("_", "");
		return name;
	}
}
