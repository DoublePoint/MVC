/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-10-27 13:24:981                      
*                                                                 
* 类   说   明 ：     系统菜单    
*                                                                 
* 修   改   人：          修   改   日   期：                     
*/                                                                
package cn.doublepoint.domain.model.entity.xt;  
                                                                  
                                                                  
import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.doublepoint.domain.model.entity.BaseEntity;
    
@Entity                                                           
@Table(name="XT_CD")                                                   
public class T_XT_CD  extends BaseEntity{                                              
	/**                                                                  
	 *                                                                    
	 */                                                                  
     private static final long serialVersionUID = 1L;                                                             
                                                                  
                                                                  
	@Id                                                              
	@Column (name = "cdbs")                                  
	private long cdbs; //菜单标识                                                
	                                                                 
	public long getCdbs() {                                            
		return cdbs;                                                     
	}                                                                
                                                                  
	public void setCdbs(long cdbs) {                                     
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
	@Column (name = "sjcdbs")                                  
	private long sjcdbs; //上级菜单标识                                                
	                                                                 
	public long getSjcdbs() {                                            
		return sjcdbs;                                                     
	}                                                                
                                                                  
	public void setSjcdbs(long sjcdbs) {                                     
		this.sjcdbs = sjcdbs;                                                  
	}                                                                
	@Column (name = "cdcj")                                  
	private int cdcj; //菜单层级                                                
	                                                                 
	public int getCdcj() {                                            
		return cdcj;                                                     
	}                                                                
                                                                  
	public void setCdcj(int cdcj) {                                     
		this.cdcj = cdcj;                                                  
	}                                                                
	@Column (name = "cdpx")                                  
	private int cdpx; //菜单排序                                                
	                                                                 
	public int getCdpx() {                                            
		return cdpx;                                                     
	}                                                                
                                                                  
	public void setCdpx(int cdpx) {                                     
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
	private Timestamp cjsj; //创建时间                                                
	                                                                 
	public Timestamp getCjsj() {                                            
		return cjsj;                                                     
	}                                                                
                                                                  
	public void setCjsj(Timestamp cjsj) {                                     
		this.cjsj = cjsj;                                                  
	}                                                                
}
