/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-01-05 23:06:350
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
@Table(name="XT_GLY")
public class T_XT_GLY implements Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column
	private String glybs;
	
	@Column
	private String dlzh;
	
	@Column
	private String dlmm;
	
	@Column
	private Date cjsj;
	
	@Column
	private Date gxsj;

	public String getGlybs() {
		return glybs;
	}
	public void setGlybs(String glybs) {
		this.glybs = glybs;
	}
	public String getDlzh() {
		return dlzh;
	}
	public void setDlzh(String dlzh) {
		this.dlzh = dlzh;
	}
	public String getDlmm() {
		return dlmm;
	}
	public void setDlmm(String dlmm) {
		this.dlmm = dlmm;
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
		return "XT_GLY [glybs=" + glybs + ",dlzh=" + dlzh + ",dlmm=" + dlmm + ",cjsj=" + cjsj + ",gxsj=" + gxsj + "]";
	}
}
