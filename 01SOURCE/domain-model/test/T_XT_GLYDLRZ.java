/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-01-06 09:51:883
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
@Table(name="XT_GLYDLRZ")
public class T_XT_GLYDLRZ implements Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column
	private String glydlrzbs;
	
	@Column
	private String glybs;
	
	@Column
	private Date glydlsj;
	
	@Column
	private String mmsrsfyw;

	public String getGlydlrzbs() {
		return glydlrzbs;
	}
	public void setGlydlrzbs(String glydlrzbs) {
		this.glydlrzbs = glydlrzbs;
	}
	public String getGlybs() {
		return glybs;
	}
	public void setGlybs(String glybs) {
		this.glybs = glybs;
	}
	public Date getGlydlsj() {
		return glydlsj;
	}
	public void setGlydlsj(Date glydlsj) {
		this.glydlsj = glydlsj;
	}
	public String getMmsrsfyw() {
		return mmsrsfyw;
	}
	public void setMmsrsfyw(String mmsrsfyw) {
		this.mmsrsfyw = mmsrsfyw;
	}
	public String toString() {
		return "XT_GLYDLRZ [glydlrzbs=" + glydlrzbs + ",glybs=" + glybs + ",glydlsj=" + glydlsj + ",mmsrsfyw=" + mmsrsfyw + "]";
	}
}
