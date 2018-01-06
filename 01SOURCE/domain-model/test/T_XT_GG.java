/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-01-06 09:51:883
 * 
 * 类   说   明 ：用户系统发布站内消息
 * 
 * 修   改   人：          修   改   日   期：
 */
package cn.doublepoint.common.domain.model.entity.xt;;

import java.util.*;
import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name="XT_GG")
public class T_XT_GG implements Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column
	private String ggbs;
	
	@Column
	private String gglb;
	
	@Column
	private String ggnr;
	
	@Column
	private Date cjsj;
	
	@Column
	private Date gxsj;

	public String getGgbs() {
		return ggbs;
	}
	public void setGgbs(String ggbs) {
		this.ggbs = ggbs;
	}
	public String getGglb() {
		return gglb;
	}
	public void setGglb(String gglb) {
		this.gglb = gglb;
	}
	public String getGgnr() {
		return ggnr;
	}
	public void setGgnr(String ggnr) {
		this.ggnr = ggnr;
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
		return "XT_GG [ggbs=" + ggbs + ",gglb=" + gglb + ",ggnr=" + ggnr + ",cjsj=" + cjsj + ",gxsj=" + gxsj + "]";
	}
}
