/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-03-31 16:12:809
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
@Table(name="")
public class T_ implements Serializable {
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
	private String link;
	
	@Column
	private String parentId;
	
	@Column
	private Integer level;
	
	@Column
	private Integer sn;
	
	@Column
	private Date modifyTime;
	
	@Column
	private Date createTime;

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
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public Integer getSn() {
		return sn;
	}
	public void setSn(Integer sn) {
		this.sn = sn;
	}
	public Date getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String toString() {
		return " [id=" + id + ",name=" + name + ",link=" + link + ",parentId=" + parentId + ",level=" + level + ",sn=" + sn + ",modifyTime=" + modifyTime + ",createTime=" + createTime + "]";
	}
}
