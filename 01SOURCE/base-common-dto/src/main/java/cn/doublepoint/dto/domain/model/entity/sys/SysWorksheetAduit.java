package cn.doublepoint.dto.domain.model.entity.sys;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the sys_worksheet_aduit database table.
 * 
 */
@Entity
@Table(name="sys_worksheet_aduit")
@NamedQuery(name="SysWorksheetAduit.findAll", query="SELECT s FROM SysWorksheetAduit s")
public class SysWorksheetAduit extends cn.doublepoint.dto.domain.model.entity.BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private Integer id;

	@Column(name="ADUIT_RESULT")
	private String aduitResult;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="CREATE_TIME")
	private Date createTime;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="MODIFY_TIME")
	private Date modifyTime;

	@Column(name="PEACH_NO")
	private int peachNo;

	private String remark;

	@Column(name="TASK_ID")
	private int taskId;

	@Column(name="WORKSHEET_NO")
	private String worksheetNo;

	public SysWorksheetAduit() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAduitResult() {
		return this.aduitResult;
	}

	public void setAduitResult(String aduitResult) {
		this.aduitResult = aduitResult;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getModifyTime() {
		return this.modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	public int getPeachNo() {
		return this.peachNo;
	}

	public void setPeachNo(int peachNo) {
		this.peachNo = peachNo;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getTaskId() {
		return this.taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	public String getWorksheetNo() {
		return this.worksheetNo;
	}

	public void setWorksheetNo(String worksheetNo) {
		this.worksheetNo = worksheetNo;
	}

}