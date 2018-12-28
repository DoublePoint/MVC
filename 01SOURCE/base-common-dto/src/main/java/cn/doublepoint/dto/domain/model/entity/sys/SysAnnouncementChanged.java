package cn.doublepoint.dto.domain.model.entity.sys;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the sys_announcement_changed database table.
 * 
 */
@Entity
@Table(name="sys_announcement_changed")
@NamedQuery(name="SysAnnouncementChanged.findAll", query="SELECT s FROM SysAnnouncementChanged s")
public class SysAnnouncementChanged extends cn.doublepoint.dto.domain.model.entity.BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="WORKSHEET_NO")
	private String worksheetNo;

	private String content;

	@Column(name="CREATE_ADMIN_ID")
	private Integer createAdminId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="CREATE_TIME")
	private Date createTime;

	private Integer id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="MODIFY_TIME")
	private Date modifyTime;

	private String title;

	private String type;

	public SysAnnouncementChanged() {
	}

	public String getWorksheetNo() {
		return this.worksheetNo;
	}

	public void setWorksheetNo(String worksheetNo) {
		this.worksheetNo = worksheetNo;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getCreateAdminId() {
		return this.createAdminId;
	}

	public void setCreateAdminId(Integer createAdminId) {
		this.createAdminId = createAdminId;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getModifyTime() {
		return this.modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

}