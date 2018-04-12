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

import javax.persistence.Column;
import javax.persistence.Id;

import org.springframework.beans.BeanUtils;

import cn.doublepoint.common.domain.model.entity.sys.Menu;
import cn.doublepoint.commonutil.annotations.domain.model.DateConvertor;
import cn.doublepoint.commonutil.domain.model.entity.BaseEntity;

public class VOMenu extends BaseEntity {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	private String id;
	
	private String name;
	
	private String link;
	
	private String parentId;
	
	private Integer level;
	
	private Integer sn;
	
	private Date modifyTime;
	
	private Date createTime;

	private List<VOMenu> childrenMenuList;

	public String getId() {
		return id;
	}
	
	public void setId(String id) {
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

	public String getParentId() {
		return parentId;
	}
	
	public void setParentId(String parentId) {
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