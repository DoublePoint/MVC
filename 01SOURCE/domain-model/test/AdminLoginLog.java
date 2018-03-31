/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-03-31 16:28:211
 * 
 * 类   说   明 ：
 * 
 * 修   改   人：          修   改   日   期：
 */
package cn.doublepoint.common.domain.model.entity.xt;;

import java.util.*;
import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name="sys_admin_login_log")
public class AdminLoginLog implements Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column
	private String id;
	
	@Column
	private String adminId;
	
	@Column
	private Date loginTime;
	
	@Column
	private String isPasswordError;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
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
		return "AdminLoginLog [id=" + id + ",adminId=" + adminId + ",loginTime=" + loginTime + ",isPasswordError=" + isPasswordError + "]";
	}
}
