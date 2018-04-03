/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-04-03 23:07:367
 * 
 * 类   说   明 ：
 * 
 * 修   改   人：          修   改   日   期：
 */
package cn.doublepoint.common.domain.model.entity.sys;

import java.util.*;
import java.io.Serializable;
import javax.persistence.*;
import cn.doublepoint.commonutil.domain.model.entity.BaseEntity;

@Entity
@Table(name="sys_role")
public class Role extends BaseEntity {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column
	private String id;
	
	@Column
	private String name;
	
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

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
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
		return "Role [id=" + id + ",name=" + name + ",createTime=" + createTime + ",modifyTime=" + modifyTime + "]";
	}
}
