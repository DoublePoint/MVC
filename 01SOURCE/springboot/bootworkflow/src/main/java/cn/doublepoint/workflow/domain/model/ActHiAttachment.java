package cn.doublepoint.workflow.domain.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import cn.doublepoint.dto.domain.model.entity.BaseModel;


/**
 * The persistent class for the act_hi_attachment database table.
 * 
 */
@Entity
@Table(name="act_hi_attachment")
@NamedQuery(name="ActHiAttachment.findAll", query="SELECT a FROM ActHiAttachment a")
public class ActHiAttachment extends BaseModel {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID_")
	private String id;

	@Column(name="CONTENT_ID_")
	private String contentId;

	@Column(name="DESCRIPTION_")
	private String description;

	@Column(name="NAME_")
	private String name;

	@Column(name="PROC_INST_ID_")
	private String procInstId;

	@Column(name="REV_")
	private int rev;

	@Column(name="TASK_ID_")
	private String taskId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="TIME_")
	private Date time;

	@Column(name="TYPE_")
	private String type;

	@Column(name="URL_")
	private String url;

	@Column(name="USER_ID_")
	private String userId;

	public ActHiAttachment() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContentId() {
		return this.contentId;
	}

	public void setContentId(String contentId) {
		this.contentId = contentId;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProcInstId() {
		return this.procInstId;
	}

	public void setProcInstId(String procInstId) {
		this.procInstId = procInstId;
	}

	public int getRev() {
		return this.rev;
	}

	public void setRev(int rev) {
		this.rev = rev;
	}

	public String getTaskId() {
		return this.taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public Date getTime() {
		return this.time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}