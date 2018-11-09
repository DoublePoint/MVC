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
 * The persistent class for the act_hi_procinst database table.
 * 
 */
@Entity
@Table(name="act_hi_procinst")
@NamedQuery(name="ActHiProcinst.findAll", query="SELECT a FROM ActHiProcinst a")
public class ActHiProcinst extends BaseModel {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID_")
	private String id;

	@Column(name="BUSINESS_KEY_")
	private String businessKey;

	@Column(name="DELETE_REASON_")
	private String deleteReason;

	@Column(name="DURATION_")
	private BigInteger duration;

	@Column(name="END_ACT_ID_")
	private String endActId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="END_TIME_")
	private Date endTime;

	@Column(name="NAME_")
	private String name;

	@Column(name="PROC_DEF_ID_")
	private String procDefId;

	@Column(name="PROC_INST_ID_")
	private String procInstId;

	@Column(name="START_ACT_ID_")
	private String startActId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="START_TIME_")
	private Date startTime;

	@Column(name="START_USER_ID_")
	private String startUserId;

	@Column(name="SUPER_PROCESS_INSTANCE_ID_")
	private String superProcessInstanceId;

	@Column(name="TENANT_ID_")
	private String tenantId;

	public ActHiProcinst() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBusinessKey() {
		return this.businessKey;
	}

	public void setBusinessKey(String businessKey) {
		this.businessKey = businessKey;
	}

	public String getDeleteReason() {
		return this.deleteReason;
	}

	public void setDeleteReason(String deleteReason) {
		this.deleteReason = deleteReason;
	}

	public BigInteger getDuration() {
		return this.duration;
	}

	public void setDuration(BigInteger duration) {
		this.duration = duration;
	}

	public String getEndActId() {
		return this.endActId;
	}

	public void setEndActId(String endActId) {
		this.endActId = endActId;
	}

	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getStartActId() {
		return this.startActId;
	}

	public void setStartActId(String startActId) {
		this.startActId = startActId;
	}

	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public String getStartUserId() {
		return this.startUserId;
	}

	public void setStartUserId(String startUserId) {
		this.startUserId = startUserId;
	}

	public String getSuperProcessInstanceId() {
		return this.superProcessInstanceId;
	}

	public void setSuperProcessInstanceId(String superProcessInstanceId) {
		this.superProcessInstanceId = superProcessInstanceId;
	}

	public String getTenantId() {
		return this.tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

}