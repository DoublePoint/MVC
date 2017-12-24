/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-12-23 22:20:268                      
*                                                                 
* 类   说   明 ：     系统管理员登录日志    
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
public class XT_GLYDLRZ extends BaseValueObject {                                              
                                                                  
	@Id                                                              
	@Column (name = "glydlrzbs")                                  
	private String glydlrzbs; //管理员登录日志标识                                                
	                                                                 
	public String getGlydlrzbs() {                                            
		return glydlrzbs;                                                     
	}                                                                
                                                                  
	public void setGlydlrzbs(String glydlrzbs) {                                     
		this.glydlrzbs = glydlrzbs;                                                  
	}                                                                
	@Column (name = "glybs")                                  
	private String glybs; //管理员标识                                                
	                                                                 
	public String getGlybs() {                                            
		return glybs;                                                     
	}                                                                
                                                                  
	public void setGlybs(String glybs) {                                     
		this.glybs = glybs;                                                  
	}                                                                
	@Column (name = "glydlsj")                                  
	private Date glydlsj; //管理员登录时间                                                
	                                                                 
	public Date getGlydlsj() {                                            
		return glydlsj;                                                     
	}                                                                
                                                                  
	public void setGlydlsj(Date glydlsj) {                                     
		this.glydlsj = glydlsj;                                                  
	}                                                                
	@Column (name = "mmsrsfyw")                                  
	private String mmsrsfyw; //密码输入是否有误                                                
	                                                                 
	public String getMmsrsfyw() {                                            
		return mmsrsfyw;                                                     
	}                                                                
                                                                  
	public void setMmsrsfyw(String mmsrsfyw) {                                     
		this.mmsrsfyw = mmsrsfyw;                                                  
	}                                                                
}
