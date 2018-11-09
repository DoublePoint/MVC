package cn.doublepoint.workflow.domain.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import cn.doublepoint.template.dto.domain.model.entity.BaseModel;


/**
 * The persistent class for the act_ge_property database table.
 * 
 */
@Entity
@Table(name="act_ge_property")
@NamedQuery(name="ActGeProperty.findAll", query="SELECT a FROM ActGeProperty a")
public class ActGeProperty extends BaseModel {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="NAME_")
	private String name;

	@Column(name="REV_")
	private int rev;

	@Column(name="VALUE_")
	private String value;

	public ActGeProperty() {
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getRev() {
		return this.rev;
	}

	public void setRev(int rev) {
		this.rev = rev;
	}

	public String getValue() {
		return this.value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}