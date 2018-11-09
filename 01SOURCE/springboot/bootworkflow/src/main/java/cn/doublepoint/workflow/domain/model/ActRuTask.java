package cn.doublepoint.workflow.domain.model;

import java.sql.Timestamp;
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
 * The persistent class for the act_ru_task database table.
 * 
 */
@Entity
@Table(name="act_ru_task")
@NamedQuery(name="ActRuTask.findAll", query="SELECT a FROM ActRuTask a")
public class ActRuTask extends BaseModel {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID_")
	private String id;

	@Column(name="ASSIGNEE_")
	private String assignee;

	@Column(name="CATEGORY_")
	private String category;

	@Column(name="CREATE_TIME_")
	private Timestamp createTime;

	@Column(name="DELEGATION_")
	private String delegation;

	@Column(name="DESCRIPTION_")
	private String description;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="DUE_DATE_")
	private Date dueDate;

	@Column(name="EXECUTION_ID_")
	private String executionId;

	@Column(name="FORM_KEY_")
	private String formKey;

	@Column(name="NAME_")
	private String name;

	@Column(name="OWNER_")
	private String owner;

	@Column(name="PARENT_TASK_ID_")
	private String parentTaskId;

	@Column(name="PRIORITY_")
	private int priority;

	@Column(name="PROC_DEF_ID_")
	private String procDefId;

	@Column(name="PROC_INST_ID_")
	private String procInstId;

	@Column(name="REV_")
	private int rev;

	@Column(name="SUSPENSION_STATE_")
	private int suspensionState;

	@Column(name="TASK_DEF_KEY_")
	private String taskDefKey;

	@Column(name="TENANT_ID_")
	private String tenantId;

	public ActRuTask() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAssignee() {
		return this.assignee;
	}

	public void setAssignee(String assignee) {
		this.assignee = assignee;
	}

	public String getCategory() {
		return this.category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public String getDelegation() {
		return this.delegation;
	}

	public void setDelegation(String delegation) {
		this.delegation = delegation;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDueDate() {
		return this.dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public String getExecutionId() {
		return this.executionId;
	}

	public void setExecutionId(String executionId) {
		this.executionId = executionId;
	}

	public String getFormKey() {
		return this.formKey;
	}

	public void setFormKey(String formKey) {
		this.formKey = formKey;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOwner() {
		return this.owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getParentTaskId() {
		return this.parentTaskId;
	}

	public void setParentTaskId(String parentTaskId) {
		this.parentTaskId = parentTaskId;
	}

	public int getPriority() {
		return this.priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
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

	public int getSuspensionState() {
		return this.suspensionState;
	}

	public void setSuspensionState(int suspensionState) {
		this.suspensionState = suspensionState;
	}

	public String getTaskDefKey() {
		return this.taskDefKey;
	}

	public void setTaskDefKey(String taskDefKey) {
		this.taskDefKey = taskDefKey;
	}

	public String getTenantId() {
		return this.tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

}