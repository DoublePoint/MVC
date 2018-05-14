/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-05-14 17:22:476
 * 
 * 类   说   明 ：
 * 
 * 修   改   人：          修   改   日   期：
 */
package cn.doublepoint.common.domain.model.entity.sys;

import java.util.*;
import java.io.Serializable;
import javax.persistence.*;
import cn.doublepoint.commonutil.domain.model.entity.BaseEntity;

@Entity
@Table(name="SYS_ADMIN")
public class Admin extends BaseEntity {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID")
	private Long id;
	
	@Column(name="LOGIN_ACCOUNT_NO")
	private String loginAccountNo;
	
	@Column(name="LOGIN_PASSWORD")
	private String loginPassword;
	
	@Column(name="CREATE_TIME")
	private Date createTime;
	
	@Column(name="MODIFY_TIME")
	private Date modifyTime;


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
	public String toString() {
		return "Admin ["
		+"id=" + id +","
		+"loginAccountNo=" + loginAccountNo +","
		+"loginPassword=" + loginPassword +","
		+"createTime=" + createTime +","
		+"modifyTime=" + modifyTime 
		+"]";
	}
}
