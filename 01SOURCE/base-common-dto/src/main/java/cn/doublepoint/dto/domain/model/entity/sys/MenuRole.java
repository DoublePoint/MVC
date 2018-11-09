/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-05-21 22:02:868
 * 
 * 类   说   明 ：
 * 
 * 修   改   人：          修   改   日   期：
 */
package cn.doublepoint.dto.domain.model.entity.sys;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.doublepoint.dto.domain.model.entity.BaseEntity;

@Entity
@Table(name="SYS_MENU_ROLE")
public class MenuRole extends BaseEntity {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID")
	private Long id;//关联标识
	
	@Column(name="ROLE_ID")
	private Long roleId;//角色标识
	
	@Column(name="CREATE_TIME")
	private Date createTime;//创建时间
	
	@Column(name="MODIFY_TIME")
	private Date modifyTime;//更新时间
	
	@Column(name="MENU_ID")
	private Long menuId;//菜单标识

	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}

	public Long getRoleId() {
		return roleId;
	}
	
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public Date getCreateTime() {
		return createTime;
	}
	
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getModifyTime() {
		return modifyTime;
	}
	
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	public Long getMenuId() {
		return menuId;
	}
	
	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}

	public String toString() {
		return "MenuRole ["
		+"id=" + id +","
		+"roleId=" + roleId +","
		+"createTime=" + createTime +","
		+"modifyTime=" + modifyTime +","
		+"menuId=" + menuId 
		+"]";
	}
}