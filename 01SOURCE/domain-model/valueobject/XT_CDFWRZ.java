/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-12-23 22:20:267                      
*                                                                 
* 类   说   明 ：     系统菜单访问日志    
*                                                                 
* 修   改   人：          修   改   日   期：                     
*/                                                                
package cn.doublepoint.common.domain.model.valueobject.xt;   
                                                                  
                                                                  
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
	private String cdfwrzbs; //菜单访问日志标识                                                
	                                                                 
	public String getCdfwrzbs() {                                            
		return cdfwrzbs;                                                     
	}                                                                
                                                                  
	public void setCdfwrzbs(String cdfwrzbs) {                                     
		this.cdfwrzbs = cdfwrzbs;                                                  
	}                                                                
	@Column (name = "cdbs")                                  
	private String cdbs; //菜单标识                                                
	                                                                 
	public String getCdbs() {                                            
		return cdbs;                                                     
	}                                                                
                                                                  
	public void setCdbs(String cdbs) {                                     
		this.cdbs = cdbs;                                                  
	}                                                                
	@Column (name = "fwsj")                                  
	private Date fwsj; //访问时间                                                
	                                                                 
	public Date getFwsj() {                                            
		return fwsj;                                                     
	}                                                                
                                                                  
	public void setFwsj(Date fwsj) {                                     
		this.fwsj = fwsj;                                                  
	}                                                                
	@Column (name = "cjsj")                                  
	private Date cjsj; //创建时间                                                
	                                                                 
	public Date getCjsj() {                                            
		return cjsj;                                                     
	}                                                                
                                                                  
	public void setCjsj(Date cjsj) {                                     
		this.cjsj = cjsj;                                                  
	}                                                                
}
