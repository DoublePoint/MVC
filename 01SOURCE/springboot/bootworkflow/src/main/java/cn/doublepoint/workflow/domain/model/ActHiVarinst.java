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
 * The persistent class for the act_hi_varinst database table.
 * 
 */
@Entity
@Table(name="act_hi_varinst")
@NamedQuery(name="ActHiVarinst.findAll", query="SELECT a FROM ActHiVarinst a")
public class ActHiVarinst extends BaseModel {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID_")
	private String id;

	@Column(name="BYTEARRAY_ID_")
	private String bytearrayId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="CREATE_TIME_")
	private Date createTime;

	private double double_;

	@Column(name="EXECUTION_ID_")
	private String executionId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="LAST_UPDATED_TIME_")
	private Date lastUpdatedTime;

	private BigInteger long_;

	@Column(name="NAME_")
	private String name;

	@Column(name="PROC_INST_ID_")
	private String procInstId;

	@Column(name="REV_")
	private int rev;

	@Column(name="TASK_ID_")
	private String taskId;

	@Column(name="TEXT_")
	private String text;

	@Column(name="TEXT2_")
	private String text2;

	@Column(name="VAR_TYPE_")
	private String varType;

	public ActHiVarinst() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBytearrayId() {
		return this.bytearrayId;
	}

	public void setBytearrayId(String bytearrayId) {
		this.bytearrayId = bytearrayId;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public double getDouble_() {
		return this.double_;
	}

	public void setDouble_(double double_) {
		this.double_ = double_;
	}

	public String getExecutionId() {
		return this.executionId;
	}

	public void setExecutionId(String executionId) {
		this.executionId = executionId;
	}

	public Date getLastUpdatedTime() {
		return this.lastUpdatedTime;
	}

	public void setLastUpdatedTime(Date lastUpdatedTime) {
		this.lastUpdatedTime = lastUpdatedTime;
	}

	public BigInteger getLong_() {
		return this.long_;
	}

	public void setLong_(BigInteger long_) {
		this.long_ = long_;
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

	public String getText() {
		return this.text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getText2() {
		return this.text2;
	}

	public void setText2(String text2) {
		this.text2 = text2;
	}

	public String getVarType() {
		return this.varType;
	}

	public void setVarType(String varType) {
		this.varType = varType;
	}

}