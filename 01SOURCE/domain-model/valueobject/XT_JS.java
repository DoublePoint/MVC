/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-11-16 18:06:805                      
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
	private long jsbs; //角色标识                                                
	                                                                 
	public long getJsbs() {                                            
		return jsbs;                                                     
	}                                                                
                                                                  
	public void setJsbs(long jsbs) {                                     
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
	private int cjsj; //创建时间                                                
	                                                                 
	public int getCjsj() {                                            
		return cjsj;                                                     
	}                                                                
                                                                  
	public void setCjsj(int cjsj) {                                     
		this.cjsj = cjsj;                                                  
	}                                                                
	@Column (name = "gxsj")                                  
	private int gxsj; //更新时间                                                
	                                                                 
	public int getGxsj() {                                            
		return gxsj;                                                     
	}                                                                
                                                                  
	public void setGxsj(int gxsj) {                                     
		this.gxsj = gxsj;                                                  
	}                                                                
}
