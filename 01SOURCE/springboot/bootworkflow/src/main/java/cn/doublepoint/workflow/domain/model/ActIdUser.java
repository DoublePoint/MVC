package cn.doublepoint.workflow.domain.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import cn.doublepoint.dto.domain.model.entity.BaseModel;


/**
 * The persistent class for the act_id_user database table.
 * 
 */
@Entity
@Table(name="act_id_user")
@NamedQuery(name="ActIdUser.findAll", query="SELECT a FROM ActIdUser a")
public class ActIdUser extends BaseModel {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID_")
	private String id;

	@Column(name="EMAIL_")
	private String email;

	@Column(name="FIRST_")
	private String first;

	@Column(name="LAST_")
	private String last;

	@Column(name="PICTURE_ID_")
	private String pictureId;

	@Column(name="PWD_")
	private String pwd;

	@Column(name="REV_")
	private int rev;

	public ActIdUser() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirst() {
		return this.first;
	}

	public void setFirst(String first) {
		this.first = first;
	}

	public String getLast() {
		return this.last;
	}

	public void setLast(String last) {
		this.last = last;
	}

	public String getPictureId() {
		return this.pictureId;
	}

	public void setPictureId(String pictureId) {
		this.pictureId = pictureId;
	}

	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getRev() {
		return this.rev;
	}

	public void setRev(int rev) {
		this.rev = rev;
	}

}