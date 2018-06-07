/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-05-14 17:22:935
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
@Table(name="XTCONSTANT")
public class XTCONSTANT extends BaseEntity {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="是否标志Y")
	private Integer 是否标志y;
	
	@Column(name="是否标志X")
	private Integer 是否标志x;


	public Integer get是否标志y() {
		return 是否标志y;
	}
	
	public void set是否标志y(Integer 是否标志y) {
		this.是否标志y = 是否标志y;
	}

	public Integer get是否标志x() {
		return 是否标志x;
	}
	
	public void set是否标志x(Integer 是否标志x) {
		this.是否标志x = 是否标志x;
	}
	public String toString() {
		return "Xtconstant ["
		+"是否标志y=" + 是否标志y +","
		+"是否标志x=" + 是否标志x 
		+"]";
	}
}
