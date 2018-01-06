/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-01-06 09:51:883
 * 
 * 类   说   明 ：对系统管理员进行角色分类，以便分配不同的权限。例如：”管理角色“拥有对系统后台的操作权限，“”
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
