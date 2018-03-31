/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-03-31 16:28:211
 * 
 * 类   说   明 ：
 * 
 * 修   改   人：          修   改   日   期：
 */
package cn.doublepoint.common.domain.model.entity.xt;;

import java.util.*;
import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name="sys_code")
public class Code implements Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column
	private String id;
	
	@Column
	private String classify;
	
	@Column
	private String code;
	
	@Column
	private String codeName;
	
	@Column
	private Integer displaySn;
	
	@Column
	private String scene1;
	
	@Column
	private String scene2;
	
	@Column
	private String scene3;
	
	@Column
	private String parentId;
	
	@Column
	private Date createTime;
	
	@Column
	private Date modifyTime;

	public String getId() {
		return id;
	}
	public void setId(String id) {
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
		return "Code [id=" + id + ",classify=" + classify + ",code=" + code + ",codeName=" + codeName + ",displaySn=" + displaySn + ",scene1=" + scene1 + ",scene2=" + scene2 + ",scene3=" + scene3 + ",parentId=" + parentId + ",createTime=" + createTime + ",modifyTime=" + modifyTime + "]";
	}
}
