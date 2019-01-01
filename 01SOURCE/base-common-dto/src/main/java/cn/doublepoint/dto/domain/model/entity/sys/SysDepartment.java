package cn.doublepoint.dto.domain.model.entity.sys;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the sys_department database table.
 * 
 */
@Entity
@Table(name="sys_department")
@NamedQuery(name="SysDepartment.findAll", query="SELECT s FROM SysDepartment s")
public class SysDepartment extends cn.doublepoint.dto.domain.model.entity.BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private Integer id;

	private String crea;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="CREATE_TIME")
	private Date createTime;

	private Integer level;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="MODIFY_TIME")
	private Date modifyTime;

	private String name;

	@Column(name="PARENT_ID")
	private Integer parentId;

	private Integer sn;

	public SysDepartment() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCrea() {
		return this.crea;
	}

	public void setCrea(String crea) {
		this.crea = crea;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getLevel() {
		return this.level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Date getModifyTime() {
		return this.modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getParentId() {
		return this.parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Integer getSn() {
		return this.sn;
	}

	public void setSn(Integer sn) {
		this.sn = sn;
	}

}