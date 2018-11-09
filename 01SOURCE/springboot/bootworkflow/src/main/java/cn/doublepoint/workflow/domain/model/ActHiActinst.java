package cn.doublepoint.workflow.domain.model;

import java.math.BigInteger;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import cn.doublepoint.template.dto.domain.model.entity.BaseModel;


/**
 * The persistent class for the act_hi_actinst database table.
 * 
 */
@Entity
@Table(name="act_hi_actinst")
@NamedQuery(name="ActHiActinst.findAll", query="SELECT a FROM ActHiActinst a")
public class ActHiActinst extends BaseModel {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID_")
	private String id;

	@Column(name="ACT_ID_")
	private String actId;

	@Column(name="ACT_NAME_")
	private String actName;

	@Column(name="ACT_TYPE_")
	private String actType;

	@Column(name="ASSIGNEE_")
	private String assignee;

	@Column(name="CALL_PROC_INST_ID_")
	private String callProcInstId;

	@Column(name="DURATION_")
	private BigInteger duration;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="END_TIME_")
	private Date endTime;

	@Column(name="EXECUTION_ID_")
	private String executionId;

	@Column(name="PROC_DEF_ID_")
	private String procDefId;

	@Column(name="PROC_INST_ID_")
	private String procInstId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="START_TIME_")
	private Date startTime;

	@Column(name="TASK_ID_")
	private String taskId;

	@Column(name="TENANT_ID_")
	private String tenantId;

	public ActHiActinst() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getActId() {
		return this.actId;
	}

	public void setActId(String actId) {
		this.actId = actId;
	}

	public String getActName() {
		return this.actName;
	}

	public void setActName(String actName) {
		this.actName = actName;
	}

	public String getActType() {
		return this.actType;
	}

	public void setActType(String actType) {
		this.actType = actType;
	}

	public String getAssignee() {
		return this.assignee;
	}

	public void setAssignee(String assignee) {
		this.assignee = assignee;
	}

	public String getCallProcInstId() {
		return this.callProcInstId;
	}

	public void setCallProcInstId(String callProcInstId) {
		this.callProcInstId = callProcInstId;
	}

	public BigInteger getDuration() {
		return this.duration;
	}

	public void setDuration(BigInteger duration) {
		this.duration = duration;
	}

	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getExecutionId() {
		return this.executionId;
	}

	public void setExecutionId(String executionId) {
		this.executionId = executionId;
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

	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public String getTaskId() {
		return this.taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getTenantId() {
		return this.tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

}