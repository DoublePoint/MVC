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

import cn.doublepoint.dto.domain.model.entity.BaseModel;

public class CommonBeanUtil extends BeanUtils {

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

//	/**
//	 * 复制PageInfo到Pageable
//	 * 
//	 * @param pageInfo
//	 * @return
//	 */
//	public static PageRequest copyPageInfoToPageable(PageInfo pageInfo) {
//		if(pageInfo==null)
//			return null;
//		PageRequest pageable = new PageRequest(pageInfo.getCurrentPageNum()<=0?(int)pageInfo.getCurrentPageNum():(int)(pageInfo.getCurrentPageNum()-1), (int)(pageInfo.getPageSize()));// 从0开始查询二十条
//		return pageable;
//	}

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
	 * Spring Data Jpa Page转换成AjaxDataPacket
	 * 
	 * @param page
	 * @param cla
	 * @return
	 *//*
		 * public static <T> AjaxDataPacket<T> copyPageToAjaxDataPacket(Page
		 * page,Class<T> cla){ AjaxDataPacket<T> ajaxDataPacket=new
		 * AjaxDataPacket<T>(); PageInfo pager=new PageInfo(); if(page!=null){
		 * pager.setCurrentPageCount(page.getNumberOfElements());//本页条数
		 * pager.setCurrentPageNum(page.getNumber());//当前是第几页
		 * pager.setTotalPageCount(page.getTotalPages());//总页数
		 * pager.setTotalElementCount(page.getTotalElements());//总条数
		 * pager.setPageSize(page.getSize());//每页条数 } List<T>
		 * resList=copyTo(page.getContent(),cla); ajaxDataPacket.setData(resList);
		 * ajaxDataPacket.setPageInfo(pager); return ajaxDataPacket; }
		 */
//	/**
//	 * Spring Data Jpa Page转换成AjaxDataPacket
//	 * 
//	 * @param page
//	 * @param cla
//	 * @return
//	 */
//	public static <T, E extends BaseEntity> AjaxDataPacket<E > copyPageToAjaxDataPacket(Page<T> page, Class<E> cla) {
//		AjaxDataPacket<E> ajaxDataPacket = new AjaxDataPacket<E>();
//		PageInfo pageInfo = new PageInfo();
//		if (page != null) {
//			pageInfo.setCurrentPageCount(page.getNumberOfElements());// 本页条数
//			pageInfo.setCurrentPageNum(page.getNumber()+1);//索引页+1 当前是第几页
//			pageInfo.setTotalPageCount(page.getTotalPages());// 总页数
//			pageInfo.setTotalElementCount(page.getTotalElements());// 总条数
//			pageInfo.setPageSize(page.getSize());// 每页条数
//		}
//		List<E> resList = copyTo(page.getContent(), cla);
//		ajaxDataPacket.setDataList(resList);
//		ajaxDataPacket.setPageInfo(pageInfo);
//		return ajaxDataPacket;
//	}
//
//	public static <T extends BaseModel> AjaxDataPacket<T> copyPageToAjaxDataPacket(Page<T> page) {
//		List<T> list = page.getContent();
//		PageInfo pageInfo = new PageInfo();
//		pageInfo.setCurrentPageNum(page.getNumber()+1);//索引页+1 当前是第几页
//		pageInfo.setCurrentPageCount(page.getNumberOfElements());
//		pageInfo.setTotalElementCount(page.getTotalElements());
//		pageInfo.setTotalPageCount(page.getTotalPages());
//		pageInfo.setPageSize(page.getSize());
//		AjaxDataPacket<T> ajaxDataPacket = new AjaxDataPacket<>();
//		ajaxDataPacket.setDataList(list);
//		ajaxDataPacket.setPageInfo(pageInfo);
//		return ajaxDataPacket;
//	}
}
