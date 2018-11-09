package cn.doublepoint.workflow.domain.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import cn.doublepoint.template.dto.domain.model.entity.BaseModel;


/**
 * The persistent class for the act_ru_execution database table.
 * 
 */
@Entity
@Table(name="act_ru_execution")
@NamedQuery(name="ActRuExecution.findAll", query="SELECT a FROM ActRuExecution a")
public class ActRuExecution extends BaseModel {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID_")
	private String id;

	@Column(name="ACT_ID_")
	private String actId;

	@Column(name="BUSINESS_KEY_")
	private String businessKey;

	@Column(name="CACHED_ENT_STATE_")
	private int cachedEntState;

	@Column(name="IS_ACTIVE_")
	private byte isActive;

	@Column(name="IS_CONCURRENT_")
	private byte isConcurrent;

	@Column(name="IS_EVENT_SCOPE_")
	private byte isEventScope;

	@Column(name="IS_SCOPE_")
	private byte isScope;

	@Column(name="LOCK_TIME_")
	private Timestamp lockTime;

	@Column(name="NAME_")
	private String name;

	@Column(name="PARENT_ID_")
	private String parentId;

	@Column(name="PROC_DEF_ID_")
	private String procDefId;

	@Column(name="PROC_INST_ID_")
	private String procInstId;

	@Column(name="REV_")
	private int rev;

	@Column(name="SUPER_EXEC_")
	private String superExec;

	@Column(name="SUSPENSION_STATE_")
	private int suspensionState;

	@Column(name="TENANT_ID_")
	private String tenantId;

	public ActRuExecution() {
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

	public String getBusinessKey() {
		return this.businessKey;
	}

	public void setBusinessKey(String businessKey) {
		this.businessKey = businessKey;
	}

	public int getCachedEntState() {
		return this.cachedEntState;
	}

	public void setCachedEntState(int cachedEntState) {
		this.cachedEntState = cachedEntState;
	}

	public byte getIsActive() {
		return this.isActive;
	}

	public void setIsActive(byte isActive) {
		this.isActive = isActive;
	}

	public byte getIsConcurrent() {
		return this.isConcurrent;
	}

	public void setIsConcurrent(byte isConcurrent) {
		this.isConcurrent = isConcurrent;
	}

	public byte getIsEventScope() {
		return this.isEventScope;
	}

	public void setIsEventScope(byte isEventScope) {
		this.isEventScope = isEventScope;
	}

	public byte getIsScope() {
		return this.isScope;
	}

	public void setIsScope(byte isScope) {
		this.isScope = isScope;
	}

	public Timestamp getLockTime() {
		return this.lockTime;
	}

	public void setLockTime(Timestamp lockTime) {
		this.lockTime = lockTime;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getParentId() {
		return this.parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
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

	public String getSuperExec() {
		return this.superExec;
	}

	public void setSuperExec(String superExec) {
		this.superExec = superExec;
	}

	public int getSuspensionState() {
		return this.suspensionState;
	}

	public void setSuspensionState(int suspensionState) {
		this.suspensionState = suspensionState;
	}

	public String getTenantId() {
		return this.tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

}