package cn.doublepoint.workflow.domain.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import cn.doublepoint.dto.domain.model.entity.BaseModel;


/**
 * The persistent class for the act_ru_event_subscr database table.
 * 
 */
@Entity
@Table(name="act_ru_event_subscr")
@NamedQuery(name="ActRuEventSubscr.findAll", query="SELECT a FROM ActRuEventSubscr a")
public class ActRuEventSubscr extends BaseModel {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID_")
	private String id;

	@Column(name="ACTIVITY_ID_")
	private String activityId;

	@Column(name="CONFIGURATION_")
	private String configuration;

	@Column(name="CREATED_")
	private Timestamp created;

	@Column(name="EVENT_NAME_")
	private String eventName;

	@Column(name="EVENT_TYPE_")
	private String eventType;

	@Column(name="EXECUTION_ID_")
	private String executionId;

	@Column(name="PROC_DEF_ID_")
	private String procDefId;

	@Column(name="PROC_INST_ID_")
	private String procInstId;

	@Column(name="REV_")
	private int rev;

	@Column(name="TENANT_ID_")
	private String tenantId;

	public ActRuEventSubscr() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getActivityId() {
		return this.activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

	public String getConfiguration() {
		return this.configuration;
	}

	public void setConfiguration(String configuration) {
		this.configuration = configuration;
	}

	public Timestamp getCreated() {
		return this.created;
	}

	public void setCreated(Timestamp created) {
		this.created = created;
	}

	public String getEventName() {
		return this.eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getEventType() {
		return this.eventType;
	}

	public void setEventType(String eventType) {
		this.eventType = eventType;
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

}