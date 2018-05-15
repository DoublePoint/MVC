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
	private boolean isDeleteThe_ = true;// 是否删除下划线
	private boolean isFilterSomeChar = true;// 是否进行某些字符串的过滤
	
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
	
	public boolean isDeleteThe_() {
		return isDeleteThe_;
	}
	public void setDeleteThe_(boolean isDeleteThe_) {
		this.isDeleteThe_ = isDeleteThe_;
	}
	public boolean isFilterSomeChar() {
		return isFilterSomeChar;
	}
	public void setFilterSomeChar(boolean isFilterSomeChar) {
		this.isFilterSomeChar = isFilterSomeChar;
	}
	
	
}
