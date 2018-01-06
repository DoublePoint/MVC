/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-01-06 09:51:883
 * 
 * 类   说   明 ：系统菜单表，包含了系统的所有菜单信息
 * 
 * 修   改   人：          修   改   日   期：
 */
package cn.doublepoint.common.domain.model.entity.xt;;

import java.util.*;
import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name="XT_CD")
public class T_XT_CD implements Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column
	private String cdbs;
	
	@Column
	private String cdmc;
	
	@Column
	private String cdlj;
	
	@Column
	private String sjcdbs;
	
	@Column
	private Integer cdcj;
	
	@Column
	private Integer cdpx;
	
	@Column
	private Date gxsj;
	
	@Column
	private Date cjsj;

	public String getCdbs() {
		return cdbs;
	}
	public void setCdbs(String cdbs) {
		this.cdbs = cdbs;
	}
	public String getCdmc() {
		return cdmc;
	}
	public void setCdmc(String cdmc) {
		this.cdmc = cdmc;
	}
	public String getCdlj() {
		return cdlj;
	}
	public void setCdlj(String cdlj) {
		this.cdlj = cdlj;
	}
	public String getSjcdbs() {
		return sjcdbs;
	}
	public void setSjcdbs(String sjcdbs) {
		this.sjcdbs = sjcdbs;
	}
	public Integer getCdcj() {
		return cdcj;
	}
	public void setCdcj(Integer cdcj) {
		this.cdcj = cdcj;
	}
	public Integer getCdpx() {
		return cdpx;
	}
	public void setCdpx(Integer cdpx) {
		this.cdpx = cdpx;
	}
	public Date getGxsj() {
		return gxsj;
	}
	public void setGxsj(Date gxsj) {
		this.gxsj = gxsj;
	}
	public Date getCjsj() {
		return cjsj;
	}
	public void setCjsj(Date cjsj) {
		this.cjsj = cjsj;
	}
	public String toString() {
		return "XT_CD [cdbs=" + cdbs + ",cdmc=" + cdmc + ",cdlj=" + cdlj + ",sjcdbs=" + sjcdbs + ",cdcj=" + cdcj + ",cdpx=" + cdpx + ",gxsj=" + gxsj + ",cjsj=" + cjsj + "]";
	}
}
