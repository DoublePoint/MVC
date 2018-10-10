/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年10月10日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.template.dto.domain.model.entity.workflow;

import java.util.Date;

import cn.doublepoint.template.dto.domain.model.entity.BaseModel;

public class VOTask  extends BaseModel {

	/**
	 * The reason why this task was deleted {'completed' | 'deleted' | any other
	 * user defined string }.
	 */
	private String deleteReason;

	/** Time when the task started. */
	private Date startTime;

	/** Time when the task was deleted or completed. */
	private Date endTime;

	/**
	 * Difference between {@link #getEndTimeprivate Long} and {@link #getStartTimeprivate Long} in
	 * milliseconds.
	 */
	private Long durationInMillis;

	/**
	 * Difference between {@link #getEndTimeprivate Long} and {@link #getClaimTimeprivate Long} in
	 * milliseconds.
	 */
	private Long workTimeInMillis;

	/** Time when the task was claimed. */
	private Date claimTime;

	/** Sets an optional localized name for the task. */
	private String localizedName;

	/** Sets an optional localized description for the task. */
	private String localizedDescription;

	public String getDeleteReason() {
		return deleteReason;
	}

	public void setDeleteReason(String deleteReason) {
		this.deleteReason = deleteReason;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Long getDurationInMillis() {
		return durationInMillis;
	}

	public void setDurationInMillis(Long durationInMillis) {
		this.durationInMillis = durationInMillis;
	}

	public Long getWorkTimeInMillis() {
		return workTimeInMillis;
	}

	public void setWorkTimeInMillis(Long workTimeInMillis) {
		this.workTimeInMillis = workTimeInMillis;
	}

	public Date getClaimTime() {
		return claimTime;
	}

	public void setClaimTime(Date claimTime) {
		this.claimTime = claimTime;
	}

	public String getLocalizedName() {
		return localizedName;
	}

	public void setLocalizedName(String localizedName) {
		this.localizedName = localizedName;
	}

	public String getLocalizedDescription() {
		return localizedDescription;
	}

	public void setLocalizedDescription(String localizedDescription) {
		this.localizedDescription = localizedDescription;
	}
	
}
