/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-01-06 09:51:883
 * 
 * 类   说   明 ：系统的权限信息，包含了，人员的所有权限，包括菜单的访问，页面的增删改查等权限。设置了所有菜单的权限，不存在的视为无权限
 * 
 * 修   改   人：          修   改   日   期：
 */
package cn.doublepoint.common.domain.model.entity.xt;;

import java.util.*;
import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name="XT_QX")
public class T_XT_QX implements Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column
	private String qxbs;
	
	@Column
	private String qxmc;
	
	@Column
	private long qxz;
	
	@Column
	private Date cjsj;
	
	@Column
	private Date gxsj;

	public String getQxbs() {
		return qxbs;
	}
	public void setQxbs(String qxbs) {
		this.qxbs = qxbs;
	}
	public String getQxmc() {
		return qxmc;
	}
	public void setQxmc(String qxmc) {
		this.qxmc = qxmc;
	}
	public long getQxz() {
		return qxz;
	}
	public void setQxz(long qxz) {
		this.qxz = qxz;
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
		return "XT_QX [qxbs=" + qxbs + ",qxmc=" + qxmc + ",qxz=" + qxz + ",cjsj=" + cjsj + ",gxsj=" + gxsj + "]";
	}
}
