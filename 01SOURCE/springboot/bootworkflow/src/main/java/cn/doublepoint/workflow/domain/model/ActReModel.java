package cn.doublepoint.workflow.domain.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import cn.doublepoint.template.dto.domain.model.entity.BaseModel;


/**
 * The persistent class for the act_re_model database table.
 * 
 */
@Entity
@Table(name="act_re_model")
@NamedQuery(name="ActReModel.findAll", query="SELECT a FROM ActReModel a")
public class ActReModel extends BaseModel {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID_")
	private String id;

	@Column(name="CATEGORY_")
	private String category;

	@Column(name="CREATE_TIME_")
	private Timestamp createTime;

	@Column(name="DEPLOYMENT_ID_")
	private String deploymentId;

	@Column(name="EDITOR_SOURCE_EXTRA_VALUE_ID_")
	private String editorSourceExtraValueId;

	@Column(name="EDITOR_SOURCE_VALUE_ID_")
	private String editorSourceValueId;

	@Column(name="KEY_")
	private String key;

	@Column(name="LAST_UPDATE_TIME_")
	private Timestamp lastUpdateTime;

	@Column(name="META_INFO_")
	private String metaInfo;

	@Column(name="NAME_")
	private String name;

	@Column(name="REV_")
	private int rev;

	@Column(name="TENANT_ID_")
	private String tenantId;

	@Column(name="VERSION_")
	private int version;

	public ActReModel() {
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

	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public String getDeploymentId() {
		return this.deploymentId;
	}

	public void setDeploymentId(String deploymentId) {
		this.deploymentId = deploymentId;
	}

	public String getEditorSourceExtraValueId() {
		return this.editorSourceExtraValueId;
	}

	public void setEditorSourceExtraValueId(String editorSourceExtraValueId) {
		this.editorSourceExtraValueId = editorSourceExtraValueId;
	}

	public String getEditorSourceValueId() {
		return this.editorSourceValueId;
	}

	public void setEditorSourceValueId(String editorSourceValueId) {
		this.editorSourceValueId = editorSourceValueId;
	}

	public String getKey() {
		return this.key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public Timestamp getLastUpdateTime() {
		return this.lastUpdateTime;
	}

	public void setLastUpdateTime(Timestamp lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	public String getMetaInfo() {
		return this.metaInfo;
	}

	public void setMetaInfo(String metaInfo) {
		this.metaInfo = metaInfo;
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