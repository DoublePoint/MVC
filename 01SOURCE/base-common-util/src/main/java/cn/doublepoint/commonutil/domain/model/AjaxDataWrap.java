/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月18日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.commonutil.domain.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class AjaxDataWrap<T> implements Serializable{
	/**                                                                  
	 *                                                                    
	 */
	private static final long serialVersionUID = 1L;
	private int code;
	private String msg;
	private List<T> dataList;
	private PageInfo pageInfo;
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	public List<T> getDataList() {
		return dataList;
	}
	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}
	public PageInfo getPageInfo() {
		return pageInfo;
	}
	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}
	public AjaxDataWrap() {
		super();
		this.pageInfo=new PageInfo();
	}
	
	public <R> AjaxDataWrap<R> copy(Class<R> targetClass){
		AjaxDataWrap<R> ajaxDataWrap=new AjaxDataWrap<>();
		ajaxDataWrap.setPageInfo(this.pageInfo);
		ajaxDataWrap.setDataList(CommonBeanUtils.copyTo(this.dataList, targetClass));
		return ajaxDataWrap;
	}
}
