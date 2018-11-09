package cn.doublepoint.workflow.domain.model;

import java.math.BigInteger;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import cn.doublepoint.template.dto.domain.model.entity.BaseModel;


/**
 * The persistent class for the act_ru_variable database table.
 * 
 */
@Entity
@Table(name="act_ru_variable")
@NamedQuery(name="ActRuVariable.findAll", query="SELECT a FROM ActRuVariable a")
public class ActRuVariable extends BaseModel {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID_")
	private String id;

	@Column(name="BYTEARRAY_ID_")
	private String bytearrayId;

	private double double_;

	@Column(name="EXECUTION_ID_")
	private String executionId;

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

	@Column(name="TYPE_")
	private String type;

	public ActRuVariable() {
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

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

}