/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-10-27 13:24:981                      
*                                                                 
* 类   说   明 ：     系统菜单续表    
*                                                                 
* 修   改   人：          修   改   日   期：                     
*/
package cn.doublepoint.common.domain.model.viewmodel.sys;

import java.util.Date;
import java.util.List;

import cn.doublepoint.commonutil.domain.model.entity.BaseEntity;

public class VOMenu extends BaseEntity {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	private Long id;
	
	private String name;
	
	private String link;
	
	private Long parentId;
	
	private Integer level;
	
	private Integer sn;
	
	private Date modifyTime;
	
	private Date createTime;

	private List<VOMenu> childrenMenuList;

	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public String getLink() {
		return link;
	}
	
	public void setLink(String link) {
		this.link = link;
	}

	public Long getParentId() {
		return parentId;
	}
	
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public Integer getLevel() {
		return level;
	}
	
	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getSn() {
		return sn;
	}
	
	public void setSn(Integer sn) {
		this.sn = sn;
	}

	public Date getModifyTime() {
		return modifyTime;
	}
	
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	public Date getCreateTime() {
		return createTime;
	}
	
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	
	
	public List<VOMenu> getChildrenMenuList() {
		return childrenMenuList;
	}

	public void setChildrenMenuList(List<VOMenu> childrenMenuList) {
		this.childrenMenuList = childrenMenuList;
	}

	public String toString() {
		return "Menu [id=" + id + ",name=" + name + ",link=" + link + ",parentId=" + parentId + ",level=" + level + ",sn=" + sn + ",modifyTime=" + modifyTime + ",createTime=" + createTime + "]";
	}
}
