/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-01-05 23:06:607
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
@Table(name="XTCONSTANT")
public class T_XTCONSTANT implements Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column
	private Integer 是否标志Y;
	
	@Column
	private Integer 是否标志X;

	public Integer get是否标志Y() {
		return 是否标志Y;
	}
	public void set是否标志Y(Integer 是否标志Y) {
		this.是否标志Y = 是否标志Y;
	}
	public Integer get是否标志X() {
		return 是否标志X;
	}
	public void set是否标志X(Integer 是否标志X) {
		this.是否标志X = 是否标志X;
	}
	public String toString() {
		return "XTCONSTANT [是否标志Y=" + 是否标志Y + ",是否标志X=" + 是否标志X + "]";
	}
}
