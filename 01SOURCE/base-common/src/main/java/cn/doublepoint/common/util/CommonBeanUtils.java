/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月27日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;

public class CommonBeanUtils extends BeanUtils {

	public List<Object> copyListProperties(List<Object> sourceList, List<Object> targetList) {
		if (sourceList == null || targetList == null)
			return null;
		for (Object source : sourceList) {
			Object target = new Object();
			copyProperties(source, target);
			targetList.add(source);
		}
		return targetList;
	}

	public static <E> List<E> copyTo(List<?> sourceList, Class<E> targetClass) {
		if (sourceList == null || sourceList.size() == 0)
			return null;
		List<E> res = new ArrayList<E>();
		try {
			for (Object source : sourceList) {
				E target;
				target = targetClass.newInstance();
				BeanUtils.copyProperties(source, target);
				res.add(target);
			}
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return res;
	}
}
