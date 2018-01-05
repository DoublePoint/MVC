/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-01-05 23:06:596
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
@Table(name="XT_JS")
public class T_XT_JS implements Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column
	private String jsbs;
	
	@Column
	private String jsmc;
	
	@Column
	private Date cjsj;
	
	@Column
	private Date gxsj;

	public String getJsbs() {
		return jsbs;
	}
	public void setJsbs(String jsbs) {
		this.jsbs = jsbs;
	}
	public String getJsmc() {
		return jsmc;
	}
	public void setJsmc(String jsmc) {
		this.jsmc = jsmc;
	}
	public Date getCjsj() {
		return cjsj;
	}
	public void setCjsj(Date cjsj) {
		this.cjsj = cjsj;
	}
	public Date getGxsj() {
		return gxsj;
	}
	public void setGxsj(Date gxsj) {
		this.gxsj = gxsj;
	}
	public String toString() {
		return "XT_JS [jsbs=" + jsbs + ",jsmc=" + jsmc + ",cjsj=" + cjsj + ",gxsj=" + gxsj + "]";
	}
}
