package cn.doublepoint.common.domain.model.viewmodel.sys;

import java.io.Serializable;
import java.util.Date;


/**
 * The persistent class for the sys_admin_role database table.
 * 
 */
public class VOAdminRole extends cn.doublepoint.dto.domain.model.entity.BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;

	private Integer adminId;

	private Date createTime;

	private Date modifyTime;

	private Integer roleId;
	
	private String roleName;

	public VOAdminRole() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getAdminId() {
		return this.adminId;
	}

	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getModifyTime() {
		return this.modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

}