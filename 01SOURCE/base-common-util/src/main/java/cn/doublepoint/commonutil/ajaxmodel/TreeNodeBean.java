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

import cn.doublepoint.dto.domain.model.entity.BaseModel;

public  class TreeNodeBean extends BaseModel{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String code;
	private String title;
	private String name;
	private boolean isParent=true;
	private String prop1;
	private String prop2;
	private String prop3;
	private String prop4;
	private String prop5;
	private Object nodeBean;
	
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
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProp1() {
		return prop1;
	}
	public void setProp1(String prop1) {
		this.prop1 = prop1;
	}
	public String getProp2() {
		return prop2;
	}
	public void setProp2(String prop2) {
		this.prop2 = prop2;
	}
	public String getProp3() {
		return prop3;
	}
	public void setProp3(String prop3) {
		this.prop3 = prop3;
	}
	public String getProp4() {
		return prop4;
	}
	public void setProp4(String prop4) {
		this.prop4 = prop4;
	}
	public String getProp5() {
		return prop5;
	}
	public void setProp5(String prop5) {
		this.prop5 = prop5;
	}
	public boolean getIsParent() {
		return isParent;
	}
	public void setIsParent(boolean isParent) {
		this.isParent = isParent;
	}
	public Object getNodeBean() {
		return nodeBean;
	}
	public void setNodeBean(Object nodeBean) {
		this.nodeBean = nodeBean;
	}

	
}
