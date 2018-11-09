package cn.doublepoint.workflow.domain.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import cn.doublepoint.template.dto.domain.model.entity.BaseModel;


/**
 * The persistent class for the act_re_deployment database table.
 * 
 */
@Entity
@Table(name="act_re_deployment")
@NamedQuery(name="ActReDeployment.findAll", query="SELECT a FROM ActReDeployment a")
public class ActReDeployment extends BaseModel {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID_")
	private String id;

	@Column(name="CATEGORY_")
	private String category;

	@Column(name="DEPLOY_TIME_")
	private Timestamp deployTime;

	@Column(name="NAME_")
	private String name;

	@Column(name="TENANT_ID_")
	private String tenantId;

	public ActReDeployment() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCategory() {
		return this.category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Timestamp getDeployTime() {
		return this.deployTime;
	}

	public void setDeployTime(Timestamp deployTime) {
		this.deployTime = deployTime;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTenantId() {
		return this.tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

}