package cn.doublepoint.dto.domain.model.entity.sys;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the sys_code database table.
 * 
 */
@Entity
@Table(name="sys_code")
@NamedQuery(name="SysCode.findAll", query="SELECT s FROM SysCode s")
public class SysCode extends cn.doublepoint.dto.domain.model.entity.BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private Integer id;

	private String classify;

	private String code;

	@Column(name="CODE_NAME")
	private String codeName;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="CREATE_TIME")
	private Date createTime;

	@Column(name="DISPLAY_SN")
	private Integer displaySn;

	private String enable;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="MODIFY_TIME")
	private Date modifyTime;

	@Column(name="PARENT_ID")
	private String parentId;

	private String scene1;

	private String scene2;

	private String scene3;

	public SysCode() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getClassify() {
		return this.classify;
	}

	public void setClassify(String classify) {
		this.classify = classify;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCodeName() {
		return this.codeName;
	}

	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getDisplaySn() {
		return this.displaySn;
	}

	public void setDisplaySn(Integer displaySn) {
		this.displaySn = displaySn;
	}

	public String getEnable() {
		return this.enable;
	}

	public void setEnable(String enable) {
		this.enable = enable;
	}

	public Date getModifyTime() {
		return this.modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	public String getParentId() {
		return this.parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getScene1() {
		return this.scene1;
	}

	public void setScene1(String scene1) {
		this.scene1 = scene1;
	}

	public String getScene2() {
		return this.scene2;
	}

	public void setScene2(String scene2) {
		this.scene2 = scene2;
	}

	public String getScene3() {
		return this.scene3;
	}

	public void setScene3(String scene3) {
		this.scene3 = scene3;
	}

}