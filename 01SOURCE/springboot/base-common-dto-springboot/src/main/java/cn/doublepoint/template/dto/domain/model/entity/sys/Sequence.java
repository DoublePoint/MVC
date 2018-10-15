/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-05-14 17:22:618
 * 
 * 类   说   明 ：
 * 
 * 修   改   人：          修   改   日   期：
 */
package cn.doublepoint.template.dto.domain.model.entity.sys;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.doublepoint.template.dto.domain.model.entity.BaseEntity;

@Entity
@Table(name="SYS_SEQUENCE")
public class Sequence extends BaseEntity {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ENTITY_CODE")
	private String entityCode;
	
	@Column(name="SEQUENCE_NO")
	private long sequenceNo;


	public String getEntityCode() {
		return entityCode;
	}
	
	public void setEntityCode(String entityCode) {
		this.entityCode = entityCode;
	}

	public long getSequenceNo() {
		return sequenceNo;
	}
	
	public void setSequenceNo(long sequenceNo) {
		this.sequenceNo = sequenceNo;
	}
	public String toString() {
		return "Sequence ["
		+"entityCode=" + entityCode +","
		+"sequenceNo=" + sequenceNo 
		+"]";
	}
}
