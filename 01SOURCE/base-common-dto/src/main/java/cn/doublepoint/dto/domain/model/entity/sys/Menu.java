/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-05-14 17:22:04
 * 
 * 类   说   明 ：
 * 
 * 修   改   人：          修   改   日   期：
 */
package cn.doublepoint.dto.domain.model.entity.sys;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.doublepoint.dto.domain.model.entity.BaseEntity;

@Entity
@Table(name="SYS_MENU")
public class Menu extends BaseEntity {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID")
	private Long id;
	
	@Column(name="NAME")
	private String name;
	
	@Column(name="LINK")
	private String link;
	
	@Column(name="PARENT_ID")
	private Long parentId;
	
	@Column(name="LEVEL")
	private Integer level;
	
	@Column(name="SN")
	private Integer sn;
	
	@Column(name="IS_CROSS_DOMAIN")
	private String isCrossDomain;
	
	@Column(name="ICON")
	private String icon;
	
	@Column(name="MODIFY_TIME")
	private Date modifyTime;
	
	@Column(name="CREATE_TIME")
	private Date createTime;


	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
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

	public Long getParentId() {
		return parentId;
	}
	
	public void setParentId(Long parentId) {
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
	
	
	public String getIsCrossDomain() {
		return isCrossDomain;
	}

	public void setIsCrossDomain(String isCrossDomain) {
		this.isCrossDomain = isCrossDomain;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String toString() {
		return "Menu ["
		+"id=" + id +","
		+"name=" + name +","
		+"link=" + link +","
		+"parentId=" + parentId +","
		+"level=" + level +","
		+"sn=" + sn +","
		+"modifyTime=" + modifyTime +","
		+"createTime=" + createTime 
		+"]";
	}
}
