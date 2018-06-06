/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-05-26 19:59:658
 * 
 * 类   说   明 ：所有实体类的自增序列
 * 
 * 修   改   人：          修   改   日   期：
 */
package cn.doublepoint.common.domain.model.entity.sys;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.doublepoint.commonutil.domain.model.entity.BaseEntity;

@Entity
@Table(name="SYS_EXTEND_PROPERTY")
public class ExtendProperty extends BaseEntity {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID")
	private Long id;//扩展属性标识
	
	@Column(name="NAME")
	private String name;//扩展属性名称
	
	@Column(name="CODE")
	private String code;//扩展属性代码
	
	@Column(name="QUERY")
	private String query;//扩展属性查询语句
	
	@Column(name="CREATE_TIME")
	private Date createTime;//创建时间
	
	@Column(name="MODIFY_TIME")
	private Date modifyTime;//更新时间

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

	public String getCode() {
		return code;
	}
	
	public void setCode(String code) {
		this.code = code;
	}

	public String getQuery() {
		return query;
	}
	
	public void setQuery(String query) {
		this.query = query;
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
		return "ExtendProperty ["
		+"id=" + id +","
		+"name=" + name +","
		+"code=" + code +","
		+"query=" + query +","
		+"createTime=" + createTime +","
		+"modifyTime=" + modifyTime 
		+"]";
	}
}