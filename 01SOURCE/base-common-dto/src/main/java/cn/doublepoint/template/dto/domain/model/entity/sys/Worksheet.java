/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-06-06 18:52:917
 * 
 * 类   说   明 ：
 * 
 * 修   改   人：          修   改   日   期：
 */
package cn.doublepoint.template.dto.domain.model.entity.sys;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.doublepoint.template.dto.domain.model.entity.BaseEntity;

@Entity
@Table(name="SYS_WORKSHEET")
public class Worksheet extends BaseEntity {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID")
	private Long id;//工作单标识
	
	@Column(name="WORKSHEET_NO")
	private String worksheetNo;//工作单编号
	
	@Column(name="NAME")
	private String name;//工作单名称
	
	@Column(name="CLASSIFICATION")
	private String classification;//工作单类别
	
	@Column(name="INSTANCE_ID")
	private String instanceId;//实例标识
	
	@Column(name="DESCRIPTION")
	private String description;//工作单描述
	
	@Column(name="STATE")
	private String state;//工作单状态
	
	@Column(name="CREATE_USER")
	private String createUser;//发起人
	
	@Column(name="CREATE_TIME")
	private Date createTime;//创建时间
	
	@Column(name="MODIFY_TIME")
	private Date modifyTime;//更新时间

	public String getWorksheetNo() {
		return worksheetNo;
	}
	
	public void setWorksheetNo(String worksheetNo) {
		this.worksheetNo = worksheetNo;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public String getClassification() {
		return classification;
	}
	
	public void setClassification(String classification) {
		this.classification = classification;
	}

	public String getInstanceId() {
		return instanceId;
	}
	
	public void setInstanceId(String instanceId) {
		this.instanceId = instanceId;
	}

	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}

	public String getState() {
		return state;
	}
	
	public void setState(String state) {
		this.state = state;
	}

	public String getCreateUser() {
		return createUser;
	}
	
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public Date getCreateTime() {
		return createTime;
	}
	
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getModifyTime() {
		return modifyTime;
	}
	
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
	
	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

}