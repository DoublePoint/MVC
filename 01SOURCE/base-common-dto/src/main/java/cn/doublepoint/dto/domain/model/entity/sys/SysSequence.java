package cn.doublepoint.dto.domain.model.entity.sys;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the sys_sequence database table.
 * 
 */
@Entity
@Table(name="sys_sequence")
@NamedQuery(name="SysSequence.findAll", query="SELECT s FROM SysSequence s")
public class SysSequence extends cn.doublepoint.dto.domain.model.entity.BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ENTITY_CODE")
	private String entityCode;

	@Column(name="SEQUENCE_NO")
	private Integer sequenceNo;

	public SysSequence() {
	}

	public String getEntityCode() {
		return this.entityCode;
	}

	public void setEntityCode(String entityCode) {
		this.entityCode = entityCode;
	}

	public Integer getSequenceNo() {
		return this.sequenceNo;
	}

	public void setSequenceNo(Integer sequenceNo) {
		this.sequenceNo = sequenceNo;
	}

}