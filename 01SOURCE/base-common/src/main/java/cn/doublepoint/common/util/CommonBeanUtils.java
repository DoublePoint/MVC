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
import org.springframework.data.domain.Page;

import cn.doublepoint.base.commonutil.domain.model.AjaxDataWrap;
import cn.doublepoint.base.commonutil.domain.model.Pager;

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
	
	/**
	 * Spring Data Jpa Page转换成AjaxDataWrap
	 * @param page
	 * @param cla
	 * @return
	 */
	public static <T> AjaxDataWrap<T> copyPageToAjaxDataWrap(Page page,Class<T> cla){
		AjaxDataWrap<T> ajaxDataWrap=new AjaxDataWrap<T>();
		Pager pager=new Pager();
		if(page!=null){
			pager.setCurrentPageCount(page.getNumberOfElements());//本页条数
			pager.setCurrentPageNum(page.getNumber());//当前是第几页
			pager.setTotalPageCount(page.getTotalPages());//总页数
			pager.setTotalElementCount(page.getTotalElements());//总条数
			pager.setPageSize(page.getSize());//每页条数
		}
		List<T> resList=copyTo(page.getContent(),cla);
		ajaxDataWrap.setData(resList);
		ajaxDataWrap.setPager(pager);
		return ajaxDataWrap;
	}
}
