package cn.doublepoint.workflow.domain.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import cn.doublepoint.dto.domain.model.entity.BaseModel;


/**
 * The persistent class for the act_evt_log database table.
 * 
 */
@Entity
@Table(name="act_evt_log")
@NamedQuery(name="ActEvtLog.findAll", query="SELECT a FROM ActEvtLog a")
public class ActEvtLog extends BaseModel {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="LOG_NR_")
	private String logNr;

	@Lob
	@Column(name="DATA_")
	private byte[] data;

	@Column(name="EXECUTION_ID_")
	private String executionId;

	@Column(name="IS_PROCESSED_")
	private byte isProcessed;

	@Column(name="LOCK_OWNER_")
	private String lockOwner;

	@Column(name="LOCK_TIME_")
	private Timestamp lockTime;

	@Column(name="PROC_DEF_ID_")
	private String procDefId;

	@Column(name="PROC_INST_ID_")
	private String procInstId;

	@Column(name="TASK_ID_")
	private String taskId;

	@Column(name="TIME_STAMP_")
	private Timestamp timeStamp;

	@Column(name="TYPE_")
	private String type;

	@Column(name="USER_ID_")
	private String userId;

	public ActEvtLog() {
	}

	public String getLogNr() {
		return this.logNr;
	}

	public void setLogNr(String logNr) {
		this.logNr = logNr;
	}

	public byte[] getData() {
		return this.data;
	}

	public void setData(byte[] data) {
		this.data = data;
	}

	public String getExecutionId() {
		return this.executionId;
	}

	public void setExecutionId(String executionId) {
		this.executionId = executionId;
	}

	public byte getIsProcessed() {
		return this.isProcessed;
	}

	public void setIsProcessed(byte isProcessed) {
		this.isProcessed = isProcessed;
	}

	public String getLockOwner() {
		return this.lockOwner;
	}

	public void setLockOwner(String lockOwner) {
		this.lockOwner = lockOwner;
	}

	public Timestamp getLockTime() {
		return this.lockTime;
	}

	public void setLockTime(Timestamp lockTime) {
		this.lockTime = lockTime;
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

	public String getTaskId() {
		return this.taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public Timestamp getTimeStamp() {
		return this.timeStamp;
	}

	public void setTimeStamp(Timestamp timeStamp) {
		this.timeStamp = timeStamp;
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