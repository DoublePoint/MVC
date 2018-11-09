package cn.doublepoint.workflow.domain.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import cn.doublepoint.template.dto.domain.model.entity.BaseModel;


/**
 * The persistent class for the act_ru_identitylink database table.
 * 
 */
@Entity
@Table(name="act_ru_identitylink")
@NamedQuery(name="ActRuIdentitylink.findAll", query="SELECT a FROM ActRuIdentitylink a")
public class ActRuIdentitylink extends BaseModel {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID_")
	private String id;

	@Column(name="GROUP_ID_")
	private String groupId;

	@Column(name="PROC_DEF_ID_")
	private String procDefId;

	@Column(name="PROC_INST_ID_")
	private String procInstId;

	@Column(name="REV_")
	private int rev;

	@Column(name="TASK_ID_")
	private String taskId;

	@Column(name="TYPE_")
	private String type;

	@Column(name="USER_ID_")
	private String userId;

	public ActRuIdentitylink() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGroupId() {
		return this.groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getProcDefId() {
		return this.procDefId;
	}

	public void setProcDefId(String procDefId) {
		this.procDefId = procDefId;
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