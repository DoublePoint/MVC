package cn.doublepoint.workflow.domain.model;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import cn.doublepoint.dto.domain.model.entity.BaseModel;

/**
 * The primary key class for the act_id_membership database table.
 * 
 */
@Embeddable
public class ActIdMembershipPK extends BaseModel {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="USER_ID_", insertable=false, updatable=false)
	private String userId;

	@Column(name="GROUP_ID_", insertable=false, updatable=false)
	private String groupId;

	public ActIdMembershipPK() {
	}
	public String getUserId() {
		return this.userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getGroupId() {
		return this.groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof ActIdMembershipPK)) {
			return false;
		}
		ActIdMembershipPK castOther = (ActIdMembershipPK)other;
		return 
			this.userId.equals(castOther.userId)
			&& this.groupId.equals(castOther.groupId);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.userId.hashCode();
		hash = hash * prime + this.groupId.hashCode();
		
		return hash;
	}
}