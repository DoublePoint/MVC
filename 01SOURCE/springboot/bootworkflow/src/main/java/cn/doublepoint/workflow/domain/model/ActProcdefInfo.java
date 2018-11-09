package cn.doublepoint.workflow.domain.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import cn.doublepoint.dto.domain.model.entity.BaseModel;


/**
 * The persistent class for the act_procdef_info database table.
 * 
 */
@Entity
@Table(name="act_procdef_info")
@NamedQuery(name="ActProcdefInfo.findAll", query="SELECT a FROM ActProcdefInfo a")
public class ActProcdefInfo extends BaseModel {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID_")
	private String id;

	@Column(name="INFO_JSON_ID_")
	private String infoJsonId;

	@Column(name="PROC_DEF_ID_")
	private String procDefId;

	@Column(name="REV_")
	private int rev;

	public ActProcdefInfo() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getInfoJsonId() {
		return this.infoJsonId;
	}

	public void setInfoJsonId(String infoJsonId) {
		this.infoJsonId = infoJsonId;
	}

	public String getProcDefId() {
		return this.procDefId;
	}

	public void setProcDefId(String procDefId) {
		this.procDefId = procDefId;
	}

	public int getRev() {
		return this.rev;
	}

	public void setRev(int rev) {
		this.rev = rev;
	}

}