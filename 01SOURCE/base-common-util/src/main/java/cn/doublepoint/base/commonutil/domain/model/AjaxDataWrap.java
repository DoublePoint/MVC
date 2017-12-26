/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月18日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.base.commonutil.domain.model;

import java.io.Serializable;
import java.util.List;

import cn.doublepoint.common.util.CommonBeanUtils;

public class AjaxDataWrap<T> implements Serializable{
	/**                                                                  
	 *                                                                    
	 */
	private static final long serialVersionUID = 1L;
	private int code;
	private String msg;
	private List<T> data;
	private PageInfo pager;
	
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
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
	public PageInfo getPager() {
		return pager;
	}
	public void setPager(PageInfo pager) {
		this.pager = pager;
	}
	
	public AjaxDataWrap() {
		super();
		this.pager=new PageInfo();
	}
	
	public <R> AjaxDataWrap<R> copy(Class<R> targetClass){
		AjaxDataWrap<R> ajaxDataWrap=new AjaxDataWrap<>();
		ajaxDataWrap.setPager(this.pager);
		ajaxDataWrap.setData(CommonBeanUtils.copyTo(this.data, targetClass));
		return ajaxDataWrap;
	}
}
