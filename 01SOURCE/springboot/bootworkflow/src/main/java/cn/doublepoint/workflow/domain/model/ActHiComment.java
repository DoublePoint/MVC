package cn.doublepoint.workflow.domain.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import cn.doublepoint.dto.domain.model.entity.BaseModel;


/**
 * The persistent class for the act_hi_comment database table.
 * 
 */
@Entity
@Table(name="act_hi_comment")
@NamedQuery(name="ActHiComment.findAll", query="SELECT a FROM ActHiComment a")
public class ActHiComment extends BaseModel {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID_")
	private String id;

	@Column(name="ACTION_")
	private String action;

	@Lob
	@Column(name="FULL_MSG_")
	private byte[] fullMsg;

	@Column(name="MESSAGE_")
	private String message;

	@Column(name="PROC_INST_ID_")
	private String procInstId;

	@Column(name="TASK_ID_")
	private String taskId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="TIME_")
	private Date time;

	@Column(name="TYPE_")
	private String type;

	@Column(name="USER_ID_")
	private String userId;

	public ActHiComment() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAction() {
		return this.action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public byte[] getFullMsg() {
		return this.fullMsg;
	}

	public void setFullMsg(byte[] fullMsg) {
		this.fullMsg = fullMsg;
	}

	public String getMessage() {
		return this.message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getProcInstId() {
		return this.procInstId;
	}

	public void setProcInstId(String procInstId) {
		this.procInstId = procInstId;
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

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}