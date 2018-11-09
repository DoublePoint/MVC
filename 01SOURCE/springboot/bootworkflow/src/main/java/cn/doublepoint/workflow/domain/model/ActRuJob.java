package cn.doublepoint.workflow.domain.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import cn.doublepoint.dto.domain.model.entity.BaseModel;


/**
 * The persistent class for the act_ru_job database table.
 * 
 */
@Entity
@Table(name="act_ru_job")
@NamedQuery(name="ActRuJob.findAll", query="SELECT a FROM ActRuJob a")
public class ActRuJob extends BaseModel {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID_")
	private String id;

	@Column(name="DUEDATE_")
	private Timestamp duedate;

	@Column(name="EXCEPTION_MSG_")
	private String exceptionMsg;

	@Column(name="EXCEPTION_STACK_ID_")
	private String exceptionStackId;

	@Column(name="EXCLUSIVE_")
	private byte exclusive;

	@Column(name="EXECUTION_ID_")
	private String executionId;

	@Column(name="HANDLER_CFG_")
	private String handlerCfg;

	@Column(name="HANDLER_TYPE_")
	private String handlerType;

	@Column(name="LOCK_EXP_TIME_")
	private Timestamp lockExpTime;

	@Column(name="LOCK_OWNER_")
	private String lockOwner;

	@Column(name="PROC_DEF_ID_")
	private String procDefId;

	@Column(name="PROCESS_INSTANCE_ID_")
	private String processInstanceId;

	@Column(name="REPEAT_")
	private String repeat;

	@Column(name="RETRIES_")
	private int retries;

	@Column(name="REV_")
	private int rev;

	@Column(name="TENANT_ID_")
	private String tenantId;

	@Column(name="TYPE_")
	private String type;

	public ActRuJob() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Timestamp getDuedate() {
		return this.duedate;
	}

	public void setDuedate(Timestamp duedate) {
		this.duedate = duedate;
	}

	public String getExceptionMsg() {
		return this.exceptionMsg;
	}

	public void setExceptionMsg(String exceptionMsg) {
		this.exceptionMsg = exceptionMsg;
	}

	public String getExceptionStackId() {
		return this.exceptionStackId;
	}

	public void setExceptionStackId(String exceptionStackId) {
		this.exceptionStackId = exceptionStackId;
	}

	public byte getExclusive() {
		return this.exclusive;
	}

	public void setExclusive(byte exclusive) {
		this.exclusive = exclusive;
	}

	public String getExecutionId() {
		return this.executionId;
	}

	public void setExecutionId(String executionId) {
		this.executionId = executionId;
	}

	public String getHandlerCfg() {
		return this.handlerCfg;
	}

	public void setHandlerCfg(String handlerCfg) {
		this.handlerCfg = handlerCfg;
	}

	public String getHandlerType() {
		return this.handlerType;
	}

	public void setHandlerType(String handlerType) {
		this.handlerType = handlerType;
	}

	public Timestamp getLockExpTime() {
		return this.lockExpTime;
	}

	public void setLockExpTime(Timestamp lockExpTime) {
		this.lockExpTime = lockExpTime;
	}

	public String getLockOwner() {
		return this.lockOwner;
	}

	public void setLockOwner(String lockOwner) {
		this.lockOwner = lockOwner;
	}

	public String getProcDefId() {
		return this.procDefId;
	}

	public void setProcDefId(String procDefId) {
		this.procDefId = procDefId;
	}

	public String getProcessInstanceId() {
		return this.processInstanceId;
	}

	public void setProcessInstanceId(String processInstanceId) {
		this.processInstanceId = processInstanceId;
	}

	public String getRepeat() {
		return this.repeat;
	}

	public void setRepeat(String repeat) {
		this.repeat = repeat;
	}

	public int getRetries() {
		return this.retries;
	}

	public void setRetries(int retries) {
		this.retries = retries;
	}

	public int getRev() {
		return this.rev;
	}

	public void setRev(int rev) {
		this.rev = rev;
	}

	public String getTenantId() {
		return this.tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

}