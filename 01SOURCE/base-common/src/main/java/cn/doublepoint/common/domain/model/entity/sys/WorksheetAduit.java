/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-06-06 18:52:940
 * 
 * 类   说   明 ：工作单审批信息，工作单的审批环节，包括审批信息，
 * 
 * 修   改   人：          修   改   日   期：
 */
package cn.doublepoint.common.domain.model.entity.sys;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.doublepoint.commonutil.domain.model.entity.BaseEntity;

@Entity
@Table(name="SYS_WORKSHEET_ADUIT")
public class WorksheetAduit extends BaseEntity {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID")
	private Long id;//审批标识
	
	@Column(name="WORKSHEET_NO")
	private String worksheetNo;//工作单编号
	
	@Column(name="TASK_ID")
	private Long taskId;//环节标识
	
	@Column(name="PEACH_NO")
	private Integer peachNo;//审批批次编号
	
	@Column(name="ADUIT_RESULT")
	private String aduitResult;//审批结果
	
	@Column(name="REMARK")
	private String remark;//备注信息
	
	@Column(name="CREATE_TIME")
	private Date createTime;//创建时间
	
	@Column(name="MODIFY_TIME")
	private Date modifyTime;//更新时间

	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}

	public String getWorksheetNo() {
		return worksheetNo;
	}
	
	public void setWorksheetNo(String worksheetNo) {
		this.worksheetNo = worksheetNo;
	}

	public Long getTaskId() {
		return taskId;
	}
	
	public void setTaskId(Long taskId) {
		this.taskId = taskId;
	}

	public Integer getPeachNo() {
		return peachNo;
	}
	
	public void setPeachNo(Integer peachNo) {
		this.peachNo = peachNo;
	}

	public String getAduitResult() {
		return aduitResult;
	}
	
	public void setAduitResult(String aduitResult) {
		this.aduitResult = aduitResult;
	}

	public String getRemark() {
		return remark;
	}
	
	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getCreateTime() {
		return createTime;
	}
	
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getModifyTime() {
		return modifyTime;
	}
	
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	public String toString() {
		return "WorksheetAduit ["
		+"id=" + id +","
		+"worksheetNo=" + worksheetNo +","
		+"taskId=" + taskId +","
		+"peachNo=" + peachNo +","
		+"aduitResult=" + aduitResult +","
		+"remark=" + remark +","
		+"createTime=" + createTime +","
		+"modifyTime=" + modifyTime 
		+"]";
	}
}