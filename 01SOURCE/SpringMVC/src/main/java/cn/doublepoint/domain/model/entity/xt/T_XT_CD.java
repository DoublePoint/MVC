/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-10-14 09:14:434                      
*                                                                 
* 类   说   明 ：     系统菜单：系统菜单表，包含了系统的所有菜单信息    
*                                                                 
* 修   改   人：          修   改   日   期：                     
*/                                                                
package cn.doublepoint.domain.model.entity.xt;                    
                                                                  
import javax.persistence.Column;                                  
import javax.persistence.Entity;                                  
import javax.persistence.Id;
import javax.persistence.Table;                                      
                                                                  
@Entity
@Table(name="XT_CD")
public class T_XT_CD {                                              
                                                                  
	@Id                                                              
	@Column                                                          
	private long cdbs;                                                 
	                                                                 
	public long getCdbs() {                                            
		return cdbs;                                                     
	}                                                                
                                                                  
	public void setCdbs(long cdbs) {                                     
		this.cdbs = cdbs;                                                  
	}                                                                
	@Column                                                          
	private String cdmc;                                                 
	                                                                 
	public String getCdmc() {                                            
		return cdmc;                                                     
	}                                                                
                                                                  
	public void setCdmc(String cdmc) {                                     
		this.cdmc = cdmc;                                                  
	}                                                                
	@Column                                                          
	private long sjcdbs;                                                 
	                                                                 
	public long getSjcdbs() {                                            
		return sjcdbs;                                                     
	}                                                                
                                                                  
	public void setSjcdbs(long sjcdbs) {                                     
		this.sjcdbs = sjcdbs;                                                  
	}                                                                
	@Column                                                          
	private int cdpx;                                                 
	                                                                 
	public long getCdpx() {                                            
		return cdpx;                                                     
	}                                                                
                                                                  
	public void setCdpx(int cdpx) {                                     
		this.cdpx = cdpx;                                                  
	}                                                                
	@Column                                                          
	private int gxsj;                                                 
	                                                                 
	public long getGxsj() {                                            
		return gxsj;                                                     
	}                                                                
                                                                  
	public void setGxsj(int gxsj) {                                     
		this.gxsj = gxsj;                                                  
	}                                                                
	@Column                                                          
	private int cjsj;                                                 
	                                                                 
	public long getCjsj() {                                            
		return cjsj;                                                     
	}                                                                
                                                                  
	public void setCjsj(int cjsj) {                                     
		this.cjsj = cjsj;                                                  
	}                                                                
}