package cn.doublepoint.workflow.domain.model;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import cn.doublepoint.dto.domain.model.entity.BaseModel;


/**
 * The persistent class for the act_id_membership database table.
 * 
 */
@Entity
@Table(name="act_id_membership")
@NamedQuery(name="ActIdMembership.findAll", query="SELECT a FROM ActIdMembership a")
public class ActIdMembership extends BaseModel {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private ActIdMembershipPK id;

	public ActIdMembership() {
	}

	public ActIdMembershipPK getId() {
		return this.id;
	}

	public void setId(ActIdMembershipPK id) {
		this.id = id;
	}

}