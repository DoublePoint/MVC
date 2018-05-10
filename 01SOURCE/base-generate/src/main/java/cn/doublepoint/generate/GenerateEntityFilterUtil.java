/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年4月19日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.generate;

import java.util.ArrayList;
import java.util.List;

public class GenerateEntityFilterUtil {
	
	/**
	 * 获取Filter 信息
	 * @return
	 */
	public static List<String> getFilters(){
		List<String> list=new ArrayList<>();
		list.add("sys");
		list.add("ep");
		list.add("hr");
		list.add("_");
		return list;
	}
}
