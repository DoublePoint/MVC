/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月1日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.commonutil.domain.model;

import java.util.List;

public class AjaxRequest {
	
	private List<AjaxDataWrap<BaseModel>> ajaxDataWrapList;
	private List<String> paramList;
	
	public List<AjaxDataWrap<BaseModel>> getAjaxDataWrapList() {
		return ajaxDataWrapList;
	}
	public void setAjaxDataWrapList(List<AjaxDataWrap<BaseModel>> ajaxDataWrapList) {
		this.ajaxDataWrapList = ajaxDataWrapList;
	}
	public List<String> getParamList() {
		return paramList;
	}
	public void setParamList(List<String> paramList) {
		this.paramList = paramList;
	}
	
	
}
