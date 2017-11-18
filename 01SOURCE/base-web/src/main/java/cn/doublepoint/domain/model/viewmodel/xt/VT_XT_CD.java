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
	private static final Long serialVersionUID = 1L;
	
	@Resource
	XTCDRepository repository;

	private Long cdbs; // 菜单标识

	public Long getCdbs() {
		return cdbs;
	}

	public void setCdbs(Long cdbs) {
		this.cdbs = cdbs;
	}

	private String cdmc; // 菜单名称

	public String getCdmc() {
		return cdmc;
	}

	public void setCdmc(String cdmc) {
		this.cdmc = cdmc;
	}

	private Long sjcdbs; // 上级菜单标识

	public Long getSjcdbs() {
		return sjcdbs;
	}

	public void setSjcdbs(Long sjcdbs) {
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

	private List<VT_XT_CD> childrenCDList;

	public List<VT_XT_CD> getChildrenCDList() {
		return childrenCDList;
	}

	public VT_XT_CD() {
		super();
	}

	public void setChildrenCDList(List<VT_XT_CD> childrenCDList) {
		this.childrenCDList = childrenCDList;
	}
	public VT_XT_CD(T_XT_CD cd) {
		super();
		BeanUtils.copyProperties(cd, this);
	}
	
}
