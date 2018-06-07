/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-06-06 18:52:928
 * 
 * 类   说   明 ：系统公告变更表，用在工作流中
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
@Table(name="SYS_ANNOUNCEMENT_CHANGED")
public class AnnouncementChanged extends BaseEntity {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="WORKSHEET_NO")
	private String worksheetNo;//工作单编号
	
	@Column(name="ID")
	private Long id;//公告标识
	
	@Column(name="TYPE")
	private String type;//公告类别
	
	@Column(name="CONTENT")
	private String content;//公告内容
	
	@Column(name="CREATE_ADMIN_ID")
	private Long createAdminId;//创建人员标识
	
	@Column(name="CREATE_TIME")
	private Date createTime;//创建时间
	
	@Column(name="MODIFY_TIME")
	private Date modifyTime;//更新时间

	public String getWorksheetNo() {
		return worksheetNo;
	}
	
	public void setWorksheetNo(String worksheetNo) {
		this.worksheetNo = worksheetNo;
	}

	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}

	public Long getCreateAdminId() {
		return createAdminId;
	}
	
	public void setCreateAdminId(Long createAdminId) {
		this.createAdminId = createAdminId;
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
		return "AnnouncementChanged ["
		+"worksheetNo=" + worksheetNo +","
		+"id=" + id +","
		+"type=" + type +","
		+"content=" + content +","
		+"createAdminId=" + createAdminId +","
		+"createTime=" + createTime +","
		+"modifyTime=" + modifyTime 
		+"]";
	}
}