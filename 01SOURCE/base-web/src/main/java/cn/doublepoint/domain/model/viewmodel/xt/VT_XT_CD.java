/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-10-27 13:24:981                      
*                                                                 
* 类   说   明 ：     系统菜单续表    
*                                                                 
* 修   改   人：          修   改   日   期：                     
*/
package cn.doublepoint.domain.model.viewmodel.xt;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;

import cn.doublepoint.domain.model.entity.BaseEntity;
import cn.doublepoint.domain.model.entity.xt.T_XT_CD;
import cn.doublepoint.port.adapter.template.persistence.xt.XTCDRepository;

@Component
public class VT_XT_CD extends BaseEntity {
	

	/**                                                                  
	 *                                                                    
	 */
	private static final long serialVersionUID = 1L;
	
	@Resource
	XTCDRepository repository;

	private long cdbs; // 菜单标识

	public long getCdbs() {
		return cdbs;
	}

	public void setCdbs(long cdbs) {
		this.cdbs = cdbs;
	}

	private String cdmc; // 菜单名称

	public String getCdmc() {
		return cdmc;
	}

	public void setCdmc(String cdmc) {
		this.cdmc = cdmc;
	}

	private long sjcdbs; // 上级菜单标识

	public long getSjcdbs() {
		return sjcdbs;
	}

	public void setSjcdbs(long sjcdbs) {
		this.sjcdbs = sjcdbs;
	}

	private int cdcj; // 菜单层级

	public int getCdcj() {
		return cdcj;
	}

	public void setCdcj(int cdcj) {
		this.cdcj = cdcj;
	}

	private int cdpx; // 菜单排序

	public int getCdpx() {
		return cdpx;
	}

	public void setCdpx(int cdpx) {
		this.cdpx = cdpx;
	}

	private Date gxsj; // 更新时间

	public Date getGxsj() {
		return gxsj;
	}

	public void setGxsj(Date gxsj) {
		this.gxsj = gxsj;
	}

	private Timestamp cjsj; // 创建时间

	public Timestamp getCjsj() {
		return cjsj;
	}

	public void setCjsj(Timestamp cjsj) {
		this.cjsj = cjsj;
	}

	private List<VT_XT_CD> childrenMenuList;

	public List<VT_XT_CD> getChildrenMenuList() {
		return childrenMenuList;
	}

	public VT_XT_CD() {
		super();
	}

	public void setChildrenMenuList(List<VT_XT_CD> childrenMenuList) {
		this.childrenMenuList = childrenMenuList;
	}
	public VT_XT_CD(T_XT_CD cd) {
		super();
		BeanUtils.copyProperties(cd, this);
	}
	
}
