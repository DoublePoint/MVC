/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-11-17 21:56:765                      
*                                                                 
* 类   说   明 ：     系统菜单访问日志    
*                                                                 
* 修   改   人：          修   改   日   期：                     
*/                                                                
package cn.doublepoint.domain.model.valueobject.xt;  
                                                                  
                                                                  
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
	private Integer cdfwrzbs; //菜单访问日志标识                                                
	                                                                 
	public Integer getCdfwrzbs() {                                            
		return cdfwrzbs;                                                     
	}                                                                
                                                                  
	public void setCdfwrzbs(Integer cdfwrzbs) {                                     
		this.cdfwrzbs = cdfwrzbs;                                                  
	}                                                                
	@Column (name = "cdbs")                                  
	private Long cdbs; //菜单标识                                                
	                                                                 
	public Long getCdbs() {                                            
		return cdbs;                                                     
	}                                                                
                                                                  
	public void setCdbs(Long cdbs) {                                     
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
