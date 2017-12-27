/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-12-27 19:11:978                      
*                                                                 
* 类   说   明 ：     系统角色    
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
public class XT_JS extends BaseValueObject {                                              
                                                                  
	@Id                                                              
	@Column (name = "jsbs")                                  
	private String jsbs; //角色标识                                                
	                                                                 
	public String getJsbs() {                                            
		return jsbs;                                                     
	}                                                                
                                                                  
	public void setJsbs(String jsbs) {                                     
		this.jsbs = jsbs;                                                  
	}                                                                
	@Column (name = "jsmc")                                  
	private String jsmc; //角色名称                                                
	                                                                 
	public String getJsmc() {                                            
		return jsmc;                                                     
	}                                                                
                                                                  
	public void setJsmc(String jsmc) {                                     
		this.jsmc = jsmc;                                                  
	}                                                                
	@Column (name = "cjsj")                                  
	private Date cjsj; //创建时间                                                
	                                                                 
	public Date getCjsj() {                                            
		return cjsj;                                                     
	}                                                                
                                                                  
	public void setCjsj(Date cjsj) {                                     
		this.cjsj = cjsj;                                                  
	}                                                                
	@Column (name = "gxsj")                                  
	private Date gxsj; //更新时间                                                
	                                                                 
	public Date getGxsj() {                                            
		return gxsj;                                                     
	}                                                                
                                                                  
	public void setGxsj(Date gxsj) {                                     
		this.gxsj = gxsj;                                                  
	}                                                                
}
