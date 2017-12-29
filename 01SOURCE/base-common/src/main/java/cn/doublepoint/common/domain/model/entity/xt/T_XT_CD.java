/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-12-21 17:51:703                      
*                                                                 
* 类   说   明 ：     系统菜单    
*                                                                 
* 修   改   人：          修   改   日   期：                     
*/
package cn.doublepoint.common.domain.model.entity.xt;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.doublepoint.commonutil.domain.model.entity.BaseEntity;

@Entity
@Table(name = "XT_CD")
public class T_XT_CD extends BaseEntity {
	/**                                                                  
	 *                                                                    
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "cdbs")
	private String cdbs; // 菜单标识
	@Column(name = "cdmc")
	private String cdmc; // 菜单名称
	@Column(name = "cdlj")
	private String cdlj; // 菜单链接
	@Column(name = "sjcdbs")
	private String sjcdbs; // 上级菜单标识
	@Column(name = "cdcj")
	private Integer cdcj; // 菜单层级
	@Column(name = "cdpx")
	private Integer cdpx; // 菜单排序
	@Column(name = "gxsj")
	private Date gxsj; // 更新时间
	@Column(name = "cjsj")
	private Date cjsj; // 创建时间

	public void setCdbs(String cdbs) {
		this.cdbs = cdbs;
	}

	public void setCdmc(String cdmc) {
		this.cdmc = cdmc;
	}

	public void setCdlj(String cdlj) {
		this.cdlj = cdlj;
	}

	public void setSjcdbs(String sjcdbs) {
		this.sjcdbs = sjcdbs;
	}

	public void setCdcj(Integer cdcj) {
		this.cdcj = cdcj;
	}

	public void setCdpx(Integer cdpx) {
		this.cdpx = cdpx;
	}

	public void setGxsj(Date gxsj) {
		this.gxsj = gxsj;
	}

	public void setCjsj(Date cjsj) {
		this.cjsj = cjsj;
	}

	public String getCdbs() {
		return cdbs;
	}

	public String getCdmc() {
		return cdmc;
	}

	public String getCdlj() {
		return cdlj;
	}

	public String getSjcdbs() {
		return sjcdbs;
	}

	public Integer getCdcj() {
		return cdcj;
	}

	public Integer getCdpx() {
		return cdpx;
	}

	public Date getGxsj() {
		return gxsj;
	}

	public Date getCjsj() {
		return cjsj;
	}
}
