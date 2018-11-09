package cn.doublepoint.dto.domain.model.vo.workflow;

import java.sql.Timestamp;

import cn.doublepoint.dto.domain.model.entity.BaseModel;


/**
 * The persistent class for the act_re_model database table.
 * 
 */
public class VOActReModel extends BaseModel {
	private static final long serialVersionUID = 1L;

	private String id;

	private String category;

	private Timestamp createTime;

	private String deploymentId;

	private String editorSourceExtraValueId;

	private String editorSourceValueId;

	private String key;

	private Timestamp lastUpdateTime;

	private String metaInfo;

	private String name;

	private int rev;

	private String tenantId;

	private int version;

	public VOActReModel() {
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