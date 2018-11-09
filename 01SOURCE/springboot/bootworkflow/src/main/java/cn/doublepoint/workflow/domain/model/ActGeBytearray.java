package cn.doublepoint.workflow.domain.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import cn.doublepoint.template.dto.domain.model.entity.BaseModel;


/**
 * The persistent class for the act_ge_bytearray database table.
 * 
 */
@Entity
@Table(name="act_ge_bytearray")
@NamedQuery(name="ActGeBytearray.findAll", query="SELECT a FROM ActGeBytearray a")
public class ActGeBytearray extends BaseModel {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID_")
	private String id;

	@Lob
	@Column(name="BYTES_")
	private byte[] bytes;

	@Column(name="DEPLOYMENT_ID_")
	private String deploymentId;

	@Column(name="GENERATED_")
	private byte generated;

	@Column(name="NAME_")
	private String name;

	@Column(name="REV_")
	private int rev;

	public ActGeBytearray() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public byte[] getBytes() {
		return this.bytes;
	}

	public void setBytes(byte[] bytes) {
		this.bytes = bytes;
	}

	public String getDeploymentId() {
		return this.deploymentId;
	}

	public void setDeploymentId(String deploymentId) {
		this.deploymentId = deploymentId;
	}

	public byte getGenerated() {
		return this.generated;
	}

	public void setGenerated(byte generated) {
		this.generated = generated;
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

}