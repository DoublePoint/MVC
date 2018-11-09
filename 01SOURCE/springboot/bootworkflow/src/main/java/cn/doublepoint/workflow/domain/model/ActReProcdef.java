package cn.doublepoint.workflow.domain.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import cn.doublepoint.template.dto.domain.model.entity.BaseModel;


/**
 * The persistent class for the act_re_procdef database table.
 * 
 */
@Entity
@Table(name="act_re_procdef")
@NamedQuery(name="ActReProcdef.findAll", query="SELECT a FROM ActReProcdef a")
public class ActReProcdef extends BaseModel {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID_")
	private String id;

	@Column(name="CATEGORY_")
	private String category;

	@Column(name="DEPLOYMENT_ID_")
	private String deploymentId;

	@Column(name="DESCRIPTION_")
	private String description;

	@Column(name="DGRM_RESOURCE_NAME_")
	private String dgrmResourceName;

	@Column(name="HAS_GRAPHICAL_NOTATION_")
	private byte hasGraphicalNotation;

	@Column(name="HAS_START_FORM_KEY_")
	private byte hasStartFormKey;

	@Column(name="KEY_")
	private String key;

	@Column(name="NAME_")
	private String name;

	@Column(name="RESOURCE_NAME_")
	private String resourceName;

	@Column(name="REV_")
	private int rev;

	@Column(name="SUSPENSION_STATE_")
	private int suspensionState;

	@Column(name="TENANT_ID_")
	private String tenantId;

	@Column(name="VERSION_")
	private int version;

	public ActReProcdef() {
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

	public String getDeploymentId() {
		return this.deploymentId;
	}

	public void setDeploymentId(String deploymentId) {
		this.deploymentId = deploymentId;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDgrmResourceName() {
		return this.dgrmResourceName;
	}

	public void setDgrmResourceName(String dgrmResourceName) {
		this.dgrmResourceName = dgrmResourceName;
	}

	public byte getHasGraphicalNotation() {
		return this.hasGraphicalNotation;
	}

	public void setHasGraphicalNotation(byte hasGraphicalNotation) {
		this.hasGraphicalNotation = hasGraphicalNotation;
	}

	public byte getHasStartFormKey() {
		return this.hasStartFormKey;
	}

	public void setHasStartFormKey(byte hasStartFormKey) {
		this.hasStartFormKey = hasStartFormKey;
	}

	public String getKey() {
		return this.key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getResourceName() {
		return this.resourceName;
	}

	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}

	public int getRev() {
		return this.rev;
	}

	public void setRev(int rev) {
		this.rev = rev;
	}

	public int getSuspensionState() {
		return this.suspensionState;
	}

	public void setSuspensionState(int suspensionState) {
		this.suspensionState = suspensionState;
	}

	public String getTenantId() {
		return this.tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public int getVersion() {
		return this.version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

}