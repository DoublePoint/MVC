/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月18日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.common.domain.model;

import java.util.List;

public class AjaxDataWrap<T> {
	private int code;
	private String msg;
	private int count;
	private List<T> data;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.count=data.size();
		this.data = data;
	}
	
	
}
