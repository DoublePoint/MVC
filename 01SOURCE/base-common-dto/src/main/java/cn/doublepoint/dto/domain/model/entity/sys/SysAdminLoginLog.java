package cn.doublepoint.dto.domain.model.entity.sys;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the sys_admin_login_log database table.
 * 
 */
@Entity
@Table(name="sys_admin_login_log")
@NamedQuery(name="SysAdminLoginLog.findAll", query="SELECT s FROM SysAdminLoginLog s")
public class SysAdminLoginLog extends cn.doublepoint.dto.domain.model.entity.BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private Integer id;

	@Column(name="ADMIN_ID")
	private Integer adminId;

	@Column(name="IS_PASSWORD_ERROR")
	private String isPasswordError;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="LOGIN_TIME")
	private Date loginTime;

	public SysAdminLoginLog() {
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

	public String getIsPasswordError() {
		return this.isPasswordError;
	}

	public void setIsPasswordError(String isPasswordError) {
		this.isPasswordError = isPasswordError;
	}

	public Date getLoginTime() {
		return this.loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

}