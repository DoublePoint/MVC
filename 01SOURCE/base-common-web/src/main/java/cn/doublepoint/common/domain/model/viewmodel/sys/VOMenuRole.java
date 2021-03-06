/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-05-21 22:02:868
 * 
 * 类   说   明 ：
 * 
 * 修   改   人：          修   改   日   期：
 */
package cn.doublepoint.common.domain.model.viewmodel.sys;

import java.util.Date;

import cn.doublepoint.dto.domain.model.entity.BaseEntity;

public class VOMenuRole extends BaseEntity {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;//关联标识
	
	private Integer roleId;//角色标识
	
	private Date createTime;//创建时间
	
	private Date modifyTime;//更新时间
	
	private Integer menuId;//菜单标识
	
	private String menuName;
	
	private Integer permission; //权限代码
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRoleId() {
		return roleId;
	}
	
	public void setRoleId(Integer roleId) {
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

	public Integer getMenuId() {
		return menuId;
	}
	
	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}
	
	public Integer getPermission() {
		return permission;
	}

	public void setPermission(Integer permission) {
		this.permission = permission;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	
}