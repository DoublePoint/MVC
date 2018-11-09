package cn.doublepoint.workflow.domain.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import cn.doublepoint.template.dto.domain.model.entity.BaseModel;


/**
 * The persistent class for the act_id_info database table.
 * 
 */
@Entity
@Table(name="act_id_info")
@NamedQuery(name="ActIdInfo.findAll", query="SELECT a FROM ActIdInfo a")
public class ActIdInfo extends BaseModel {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID_")
	private String id;

	@Column(name="KEY_")
	private String key;

	@Column(name="PARENT_ID_")
	private String parentId;

	@Lob
	@Column(name="PASSWORD_")
	private byte[] password;

	@Column(name="REV_")
	private int rev;

	@Column(name="TYPE_")
	private String type;

	@Column(name="USER_ID_")
	private String userId;

	@Column(name="VALUE_")
	private String value;

	public ActIdInfo() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getKey() {
		return this.key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getParentId() {
		return this.parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public byte[] getPassword() {
		return this.password;
	}

	public void setPassword(byte[] password) {
		this.password = password;
	}

	public int getRev() {
		return this.rev;
	}

	public void setRev(int rev) {
		this.rev = rev;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getValue() {
		return this.value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}