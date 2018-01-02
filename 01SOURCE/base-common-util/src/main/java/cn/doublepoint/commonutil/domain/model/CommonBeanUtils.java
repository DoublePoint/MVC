/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月27日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.commonutil.domain.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

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

	/**
	 * Iterable转成list;
	 * 
	 * @param iterable
	 * @return
	 */
	public static <T extends BaseModel> List<T> copyIterableToList(Iterable<T> iterable) {
		if (iterable == null)
			return null;
		List<T> list = new ArrayList<>();
		iterable.forEach(item -> list.add(item));
		return list;
	}

	/**
	 * 复制PageInfo到Pageable
	 * 
	 * @param pageInfo
	 * @return
	 */
	public static Pageable copyPageInfoToPageable(PageInfo pageInfo) {
		Pageable pageable = new PageRequest(pageInfo.getCurrentPageNum()<=0?pageInfo.getCurrentPageNum():pageInfo.getCurrentPageNum()-1, pageInfo.getPageSize());// 从0开始查询二十条
		return pageable;
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
	 * 
	 * @param page
	 * @param cla
	 * @return
	 *//*
		 * public static <T> AjaxDataWrap<T> copyPageToAjaxDataWrap(Page
		 * page,Class<T> cla){ AjaxDataWrap<T> ajaxDataWrap=new
		 * AjaxDataWrap<T>(); PageInfo pager=new PageInfo(); if(page!=null){
		 * pager.setCurrentPageCount(page.getNumberOfElements());//本页条数
		 * pager.setCurrentPageNum(page.getNumber());//当前是第几页
		 * pager.setTotalPageCount(page.getTotalPages());//总页数
		 * pager.setTotalElementCount(page.getTotalElements());//总条数
		 * pager.setPageSize(page.getSize());//每页条数 } List<T>
		 * resList=copyTo(page.getContent(),cla); ajaxDataWrap.setData(resList);
		 * ajaxDataWrap.setPageInfo(pager); return ajaxDataWrap; }
		 */
	/**
	 * Spring Data Jpa Page转换成AjaxDataWrap
	 * 
	 * @param page
	 * @param cla
	 * @return
	 */
	public static <T, E> AjaxDataWrap<E> copyPageToAjaxDataWrap(Page<T> page, Class<E> cla) {
		AjaxDataWrap<E> ajaxDataWrap = new AjaxDataWrap<E>();
		PageInfo pageInfo = new PageInfo();
		if (page != null) {
			pageInfo.setCurrentPageCount(page.getNumberOfElements());// 本页条数
			pageInfo.setCurrentPageNum(page.getNumber()+1);//索引页+1 当前是第几页
			pageInfo.setTotalPageCount(page.getTotalPages());// 总页数
			pageInfo.setTotalElementCount(page.getTotalElements());// 总条数
			pageInfo.setPageSize(page.getSize());// 每页条数
			pageInfo.setSort(page.getSort());
		}
		List<E> resList = copyTo(page.getContent(), cla);
		ajaxDataWrap.setData(resList);
		ajaxDataWrap.setPageInfo(pageInfo);
		return ajaxDataWrap;
	}

	public static <T extends BaseModel> AjaxDataWrap<T> copyPageToAjaxDataWrap(Page<T> page) {
		List<T> list = page.getContent();
		PageInfo pageInfo = new PageInfo();
		pageInfo.setCurrentPageNum(page.getNumber()+1);//索引页+1 当前是第几页
		pageInfo.setCurrentPageCount(page.getNumberOfElements());
		pageInfo.setTotalElementCount(page.getTotalElements());
		pageInfo.setTotalPageCount(page.getTotalPages());
		pageInfo.setPageSize(page.getSize());
		pageInfo.setSort(page.getSort());
		AjaxDataWrap<T> ajaxDataWrap = new AjaxDataWrap<>();
		ajaxDataWrap.setData(list);
		ajaxDataWrap.setPageInfo(pageInfo);
		return ajaxDataWrap;
	}
}
