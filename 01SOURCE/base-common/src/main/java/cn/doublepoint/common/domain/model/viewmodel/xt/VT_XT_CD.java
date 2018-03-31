/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-10-27 13:24:981                      
*                                                                 
* 类   说   明 ：     系统菜单续表    
*                                                                 
* 修   改   人：          修   改   日   期：                     
*/
package cn.doublepoint.common.domain.model.viewmodel.xt;

import java.util.Date;
import java.util.List;

import org.springframework.beans.BeanUtils;

import cn.doublepoint.common.domain.model.entity.xt.Menu;
import cn.doublepoint.commonutil.annotations.domain.model.DateConvertor;
import cn.doublepoint.commonutil.domain.model.entity.BaseEntity;

public class VMenu extends BaseEntity {

	private String cdbs; // 菜单标识

	public String getCdbs() {
		return cdbs;
	}

	public void setCdbs(String cdbs) {
		this.cdbs = cdbs;
	}

	private String cdmc; // 菜单名称

	public String getCdmc() {
		return cdmc;
	}

	public void setCdmc(String cdmc) {
		this.cdmc = cdmc;
	}

	private String sjcdbs; // 上级菜单标识

	public String getSjcdbs() {
		return sjcdbs;
	}

	public void setSjcdbs(String sjcdbs) {
		this.sjcdbs = sjcdbs;
	}

	private Integer cdcj; // 菜单层级

	public Integer getCdcj() {
		return cdcj;
	}

	public void setCdcj(Integer cdcj) {
		this.cdcj = cdcj;
	}

	private Integer cdpx; // 菜单排序

	public Integer getCdpx() {
		return cdpx;
	}

	public void setCdpx(Integer cdpx) {
		this.cdpx = cdpx;
	}

	private String cdlj; // 菜单链接

	public String getCdlj() {
		return cdlj;
	}

	public void setCdlj(String cdlj) {
		this.cdlj = cdlj;
	}
	
	private Date gxsj; // 更新时间

	public Date getGxsj() {
		return gxsj;
	}

	public void setGxsj(Date gxsj) {
		this.gxsj = gxsj;
	}

	private Date cjsj; // 创建时间

	public Date getCjsj() {
		return cjsj;
	}

	public void setCjsj(Date cjsj) {
		this.cjsj = cjsj;
	}

	private List<VMenu> childrenCDList;

	public List<VMenu> getChildrenCDList() {
		return childrenCDList;
	}

	public VMenu() {
		super();
	}

	public void setChildrenCDList(List<VMenu> childrenCDList) {
		this.childrenCDList = childrenCDList;
	}

	public VMenu(Menu cd) {
		super();
		BeanUtils.copyProperties(cd, this);
	}

	private String zcdmc; // 菜单名称

	public String getZcdmc() {
		return zcdmc;
	}

	public void setZcdmc(String zcdmc) {
		this.zcdmc = zcdmc;
	}
	private String cdtb;
	public String getCdtb() {
		return cdtb;
	}

	public void setCdtb(String cdtb) {
		this.cdtb = cdtb;
	}
}
