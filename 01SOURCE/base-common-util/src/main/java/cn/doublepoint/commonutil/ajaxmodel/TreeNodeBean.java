/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年4月3日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.commonutil.ajaxmodel;

import java.util.List;

import cn.doublepoint.commonutil.domain.model.BaseModel;

public class TreeNodeBean extends BaseModel{
	
	private String code;
	private String title;
	private List<TreeNodeBean> childrenNodeBean;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public List<TreeNodeBean> getChildrenNodeBean() {
		return childrenNodeBean;
	}
	public void setChildrenNodeBean(List<TreeNodeBean> childrenNodeBean) {
		this.childrenNodeBean = childrenNodeBean;
	}
	
}
