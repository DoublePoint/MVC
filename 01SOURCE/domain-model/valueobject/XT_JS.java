/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-11-17 21:56:766                      
*                                                                 
* 类   说   明 ：     系统角色    
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
public class XT_JS extends BaseValueObject {                                              
                                                                  
	@Id                                                              
	@Column (name = "jsbs")                                  
	private Long jsbs; //角色标识                                                
	                                                                 
	public Long getJsbs() {                                            
		return jsbs;                                                     
	}                                                                
                                                                  
	public void setJsbs(Long jsbs) {                                     
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
	private Integer cjsj; //创建时间                                                
	                                                                 
	public Integer getCjsj() {                                            
		return cjsj;                                                     
	}                                                                
                                                                  
	public void setCjsj(Integer cjsj) {                                     
		this.cjsj = cjsj;                                                  
	}                                                                
	@Column (name = "gxsj")                                  
	private Integer gxsj; //更新时间                                                
	                                                                 
	public Integer getGxsj() {                                            
		return gxsj;                                                     
	}                                                                
                                                                  
	public void setGxsj(Integer gxsj) {                                     
		this.gxsj = gxsj;                                                  
	}                                                                
}
