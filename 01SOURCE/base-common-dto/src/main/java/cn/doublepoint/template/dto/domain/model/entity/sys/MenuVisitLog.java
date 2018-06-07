/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-05-14 17:22:411
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
@Table(name="SYS_MENU_VISIT_LOG")
public class MenuVisitLog extends BaseEntity {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID")
	private Long id;
	
	@Column(name="MENU_ID")
	private Long menuId;
	
	@Column(name="VISIT_TIME")
	private Date visitTime;
	
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

	public Long getMenuId() {
		return menuId;
	}
	
	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}

	public Date getVisitTime() {
		return visitTime;
	}
	
	public void setVisitTime(Date visitTime) {
		this.visitTime = visitTime;
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
		return "MenuVisitLog ["
		+"id=" + id +","
		+"menuId=" + menuId +","
		+"visitTime=" + visitTime +","
		+"createTime=" + createTime +","
		+"modifyTime=" + modifyTime 
		+"]";
	}
}
