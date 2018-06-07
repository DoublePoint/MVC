/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-05-14 17:22:188
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
@Table(name="SYS_CODE")
public class Code extends BaseEntity {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID")
	private Long id;
	
	@Column(name="CLASSIFY")
	private String classify;
	
	@Column(name="CODE")
	private String code;
	
	@Column(name="CODE_NAME")
	private String codeName;
	
	@Column(name="DISPLAY_SN")
	private Integer displaySn;
	
	@Column(name="SCENE1")
	private String scene1;
	
	@Column(name="SCENE2")
	private String scene2;
	
	@Column(name="SCENE3")
	private String scene3;
	
	@Column(name="PARENT_ID")
	private String parentId;
	
	@Column(name="CREATE_TIME")
	private Date createTime;
	
	@Column(name="MODIFY_TIME")
	private Date modifyTime;


	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}

	public String getClassify() {
		return classify;
	}
	
	public void setClassify(String classify) {
		this.classify = classify;
	}

	public String getCode() {
		return code;
	}
	
	public void setCode(String code) {
		this.code = code;
	}

	public String getCodeName() {
		return codeName;
	}
	
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}

	public Integer getDisplaySn() {
		return displaySn;
	}
	
	public void setDisplaySn(Integer displaySn) {
		this.displaySn = displaySn;
	}

	public String getScene1() {
		return scene1;
	}
	
	public void setScene1(String scene1) {
		this.scene1 = scene1;
	}

	public String getScene2() {
		return scene2;
	}
	
	public void setScene2(String scene2) {
		this.scene2 = scene2;
	}

	public String getScene3() {
		return scene3;
	}
	
	public void setScene3(String scene3) {
		this.scene3 = scene3;
	}

	public String getParentId() {
		return parentId;
	}
	
	public void setParentId(String parentId) {
		this.parentId = parentId;
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
	public String toString() {
		return "Code ["
		+"id=" + id +","
		+"classify=" + classify +","
		+"code=" + code +","
		+"codeName=" + codeName +","
		+"displaySn=" + displaySn +","
		+"scene1=" + scene1 +","
		+"scene2=" + scene2 +","
		+"scene3=" + scene3 +","
		+"parentId=" + parentId +","
		+"createTime=" + createTime +","
		+"modifyTime=" + modifyTime 
		+"]";
	}
}
