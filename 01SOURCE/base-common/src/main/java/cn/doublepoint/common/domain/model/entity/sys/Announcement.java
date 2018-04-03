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
@Table(name="sys_announcement")
public class Announcement extends BaseEntity {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column
	private String id;
	
	@Column
	private String type;
	
	@Column
	private String content;
	
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

	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
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
		return "Announcement [id=" + id + ",type=" + type + ",content=" + content + ",createTime=" + createTime + ",modifyTime=" + modifyTime + "]";
	}
}
