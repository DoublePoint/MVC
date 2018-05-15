/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-05-14 17:22:402
 * 
 * 类   说   明 ：
 * 
 * 修   改   人：          修   改   日   期：
 */
package cn.doublepoint.common.domain.model.entity.sys;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.doublepoint.commonutil.domain.model.entity.BaseEntity;

@Entity
@Table(name="USER")
public class User extends BaseEntity {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID")
	private Long id;
	
	@Column(name="NAME")
	private String name;
	
	@Column(name="LOGIN_ACCOUNT_NO")
	private Integer loginAccountNo;
	
	@Column(name="LOGIN_PASSWORD")
	private Integer loginPassword;
	
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

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public Integer getLoginAccountNo() {
		return loginAccountNo;
	}
	
	public void setLoginAccountNo(Integer loginAccountNo) {
		this.loginAccountNo = loginAccountNo;
	}

	public Integer getLoginPassword() {
		return loginPassword;
	}
	
	public void setLoginPassword(Integer loginPassword) {
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
		return "User ["
		+"id=" + id +","
		+"name=" + name +","
		+"loginAccountNo=" + loginAccountNo +","
		+"loginPassword=" + loginPassword +","
		+"createTime=" + createTime +","
		+"modifyTime=" + modifyTime 
		+"]";
	}
}
