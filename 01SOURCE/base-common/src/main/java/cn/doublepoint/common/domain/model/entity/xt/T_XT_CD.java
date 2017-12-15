/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-11-17 21:56:763                      
*                                                                 
* 类   说   明 ：     系统菜单    
*                                                                 
* 修   改   人：          修   改   日   期：                     
*/                                                                
package cn.doublepoint.common.domain.model.entity.xt;  
                                                                  
                                                                  
import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.doublepoint.common.domain.model.entity.BaseEntity;
    
@Entity                                                           
@Table(name="XT_CD")                                                   
public class T_XT_CD  extends BaseEntity implements Serializable{                                              
	/**                                                                  
	 *                                                                    
	 */                                                                  
     private static final long serialVersionUID = 1L;                                                             
                                                                  
                                                                  
	@Id                                                              
	@Column (name = "cdbs")                                  
	private String cdbs; //菜单标识                                                
	                                                                 
	public String getCdbs() {                                            
		return cdbs;                                                     
	}                                                                
                                                                  
	public void setCdbs(String cdbs) {                                     
		this.cdbs = cdbs;                                                  
	}                                                                
	@Column (name = "cdmc")                                  
	private String cdmc; //菜单名称                                                
	                                                                 
	public String getCdmc() {                                            
		return cdmc;                                                     
	}                                                                
                                                                  
	public void setCdmc(String cdmc) {                                     
		this.cdmc = cdmc;                                                  
	}                                                                
	@Column (name = "cdlj")                                  
	private Integer cdlj; //菜单链接                                                
	                                                                 
	public Integer getCdlj() {                                            
		return cdlj;                                                     
	}                                                                
                                                                  
	public void setCdlj(Integer cdlj) {                                     
		this.cdlj = cdlj;                                                  
	}                                                                
	@Column (name = "sjcdbs")                                  
	private String sjcdbs; //上级菜单标识                                                
	                                                                 
	public String getSjcdbs() {                                            
		return sjcdbs;                                                     
	}                                                                
                                                                  
	public void setSjcdbs(String sjcdbs) {                                     
		this.sjcdbs = sjcdbs;                                                  
	}                                                                
	@Column (name = "cdcj")                                  
	private Integer cdcj; //菜单层级                                                
	                                                                 
	public Integer getCdcj() {                                            
		return cdcj;                                                     
	}                                                                
                                                                  
	public void setCdcj(Integer cdcj) {                                     
		this.cdcj = cdcj;                                                  
	}                                                                
	@Column (name = "cdpx")                                  
	private Integer cdpx; //菜单排序                                                
	                                                                 
	public Integer getCdpx() {                                            
		return cdpx;                                                     
	}                                                                
                                                                  
	public void setCdpx(Integer cdpx) {                                     
		this.cdpx = cdpx;                                                  
	}                                                                
	@Column (name = "gxsj")                                  
	private Date gxsj; //更新时间                                                
	                                                                 
	public Date getGxsj() {                                            
		return gxsj;                                                     
	}                                                                
                                                                  
	public void setGxsj(Date gxsj) {                                     
		this.gxsj = gxsj;                                                  
	}                                                                
	@Column (name = "cjsj")                                  
	private Date cjsj; //创建时间                                                
	                                                                 
	public Date getCjsj() {                                            
		return cjsj;                                                     
	}                                                                
                                                                  
	public void setCjsj(Date cjsj) {                                     
		this.cjsj = cjsj;                                                  
	}

	public T_XT_CD() {
		super();
	}             
	
}
