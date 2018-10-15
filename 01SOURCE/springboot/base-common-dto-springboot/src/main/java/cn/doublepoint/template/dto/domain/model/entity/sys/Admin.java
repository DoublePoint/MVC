/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-05-22 22:38:951
 * 
 * 类   说   明 ：系统管理员表，包含了系统的管理员信息
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
@Table(name="SYS_ADMIN")
public class Admin extends BaseEntity {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID")
	private Long id;//管理员标识
	
	@Column(name="LOGIN_ACCOUNT_NO")
	private String loginAccountNo;//登录账号
	
	@Column(name="LOGIN_PASSWORD")
	private String loginPassword;//登录密码
	
	@Column(name="role_id")
	private Long roleId;//角色标识
	
	@Column(name="ENABLE")
	private String enable;//是否启用
	
	@Column(name="CREATE_TIME")
	private Date createTime;//创建时间
	
	@Column(name="MODIFY_TIME")
	private Date modifyTime;//更新时间

	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}

	public String getLoginAccountNo() {
		return loginAccountNo;
	}
	
	public void setLoginAccountNo(String loginAccountNo) {
		this.loginAccountNo = loginAccountNo;
	}

	public String getLoginPassword() {
		return loginPassword;
	}
	
	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}

	public String getEnable() {
		return enable;
	}
	
	public void setEnable(String enable) {
		this.enable = enable;
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
	
	

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public String toString() {
		return "Admin ["
		+"id=" + id +","
		+"loginAccountNo=" + loginAccountNo +","
		+"loginPassword=" + loginPassword +","
		+"roleId=" + roleId +","
		+"enable=" + enable +","
		+"createTime=" + createTime +","
		+"modifyTime=" + modifyTime 
		+"]";
	}
}