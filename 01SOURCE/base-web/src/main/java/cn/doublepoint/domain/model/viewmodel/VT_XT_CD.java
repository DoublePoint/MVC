/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-10-14 09:14:434                      
*                                                                 
* 类   说   明 ：     系统菜单：系统菜单表，包含了系统的所有菜单信息    
*                                                                 
* 修   改   人：          修   改   日   期：                     
*/
package cn.doublepoint.domain.model.viewmodel;

import java.util.List;

public class VT_XT_CD {

	private long cdbs;

	public long getCdbs() {
		return cdbs;
	}

	public void setCdbs(long cdbs) {
		this.cdbs = cdbs;
	}

	private String cdmc;

	public String getCdmc() {
		return cdmc;
	}

	public void setCdmc(String cdmc) {
		this.cdmc = cdmc;
	}

	private long sjcdbs;

	public long getSjcdbs() {
		return sjcdbs;
	}

	public void setSjcdbs(long sjcdbs) {
		this.sjcdbs = sjcdbs;
	}
	
	private int cdpx;

	public long getCdpx() {
		return cdpx;
	}

	public void setCdpx(int cdpx) {
		this.cdpx = cdpx;
	}

	private int gxsj;

	public long getGxsj() {
		return gxsj;
	}

	public void setGxsj(int gxsj) {
		this.gxsj = gxsj;
	}

	private int cjsj;

	public long getCjsj() {
		return cjsj;
	}

	public void setCjsj(int cjsj) {
		this.cjsj = cjsj;
	}

	private List<VT_XT_CD> zcdlb;//子菜单列表

	public List<VT_XT_CD> getZcdlb() {
		return zcdlb;
	}

	public void setZcdlb(List<VT_XT_CD> zcdlb) {
		this.zcdlb = zcdlb;
	}
	
}