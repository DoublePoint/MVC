/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-05-14 17:22:625
 * 
 * 类   说   明 ：
 * 
 * 修   改   人：          修   改   日   期：
 */
package cn.doublepoint.template.dto.domain.model.entity.sys;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.doublepoint.template.dto.domain.model.entity.BaseEntity;

@Entity
@Table(name="SYS_ADMIN_LOGIN_LOG")
public class AdminLoginLog extends BaseEntity {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID")
	private Long id;
	
	@Column(name="ADMIN_ID")
	private Long adminId;
	
	@Column(name="LOGIN_TIME")
	private Date loginTime;
	
	@Column(name="IS_PASSWORD_ERROR")
	private String isPasswordError;


	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}

	public Long getAdminId() {
		return adminId;
	}
	
	public void setAdminId(Long adminId) {
		this.adminId = adminId;
	}

	public Date getLoginTime() {
		return loginTime;
	}
	
	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	public String getIsPasswordError() {
		return isPasswordError;
	}
	
	public void setIsPasswordError(String isPasswordError) {
		this.isPasswordError = isPasswordError;
	}
	public String toString() {
		return "AdminLoginLog ["
		+"id=" + id +","
		+"adminId=" + adminId +","
		+"loginTime=" + loginTime +","
		+"isPasswordError=" + isPasswordError 
		+"]";
	}
}
