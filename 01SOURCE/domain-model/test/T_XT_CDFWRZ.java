/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-01-06 09:51:883
 * 
 * 类   说   明 ：菜单访问统计信息，用来记录用户的每次点击操作。
 * 
 * 修   改   人：          修   改   日   期：
 */
package cn.doublepoint.common.domain.model.entity.xt;;

import java.util.*;
import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name="XT_CDFWRZ")
public class T_XT_CDFWRZ implements Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column
	private String cdfwrzbs;
	
	@Column
	private String cdbs;
	
	@Column
	private Date fwsj;
	
	@Column
	private Date cjsj;

	public String getCdfwrzbs() {
		return cdfwrzbs;
	}
	public void setCdfwrzbs(String cdfwrzbs) {
		this.cdfwrzbs = cdfwrzbs;
	}
	public String getCdbs() {
		return cdbs;
	}
	public void setCdbs(String cdbs) {
		this.cdbs = cdbs;
	}
	public Date getFwsj() {
		return fwsj;
	}
	public void setFwsj(Date fwsj) {
		this.fwsj = fwsj;
	}
	public Date getCjsj() {
		return cjsj;
	}
	public void setCjsj(Date cjsj) {
		this.cjsj = cjsj;
	}
	public String toString() {
		return "XT_CDFWRZ [cdfwrzbs=" + cdfwrzbs + ",cdbs=" + cdbs + ",fwsj=" + fwsj + ",cjsj=" + cjsj + "]";
	}
}
