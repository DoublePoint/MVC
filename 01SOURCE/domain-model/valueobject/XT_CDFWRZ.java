/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-10-26 18:38:997                      
*                                                                 
* 类   说   明 ：     系统菜单访问日志    
*                                                                 
* 修   改   人：          修   改   日   期：                     
*/                                                                
package package cn.doublepoint.domain.model.valueobject.xt;  
                                                                  
                                                                  
import javax.persistence.Embeddable;                                  
import javax.persistence.EnumType;                                  
import javax.persistence.Enumerated;                                      
import javax.persistence.Temporal;                                      
import javax.persistence.TemporalType;                                      
import com.haiyisoft.billing.common.CalcType;                                      
@Embeddable                                                           
public class XT_CDFWRZ extends BaseValueObject {                                              
                                                                  
	@Id                                                              
	@Column (name = "cdfwrzbs")                                  
	private int cdfwrzbs; //菜单访问日志标识                                                
	                                                                 
	public int getCdfwrzbs() {                                            
		return cdfwrzbs;                                                     
	}                                                                
                                                                  
	public void setCdfwrzbs(int cdfwrzbs) {                                     
		this.cdfwrzbs = cdfwrzbs;                                                  
	}                                                                
	@Column (name = "cdbs")                                  
	private long cdbs; //菜单标识                                                
	                                                                 
	public long getCdbs() {                                            
		return cdbs;                                                     
	}                                                                
                                                                  
	public void setCdbs(long cdbs) {                                     
		this.cdbs = cdbs;                                                  
	}                                                                
	@Column (name = "fwsj")                                  
	private datetime fwsj; //访问时间                                                
	                                                                 
	public datetime getFwsj() {                                            
		return fwsj;                                                     
	}                                                                
                                                                  
	public void setFwsj(datetime fwsj) {                                     
		this.fwsj = fwsj;                                                  
	}                                                                
	@Column (name = "cjsj")                                  
	private datetime cjsj; //创建时间                                                
	                                                                 
	public datetime getCjsj() {                                            
		return cjsj;                                                     
	}                                                                
                                                                  
	public void setCjsj(datetime cjsj) {                                     
		this.cjsj = cjsj;                                                  
	}                                                                
}
