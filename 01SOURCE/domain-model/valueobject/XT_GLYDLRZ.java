/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-11-17 21:56:767                      
*                                                                 
* 类   说   明 ：     系统管理员登录日志    
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
public class XT_GLYDLRZ extends BaseValueObject {                                              
                                                                  
	@Id                                                              
	@Column (name = "glydlrzbs")                                  
	private Long glydlrzbs; //管理员登录日志标识                                                
	                                                                 
	public Long getGlydlrzbs() {                                            
		return glydlrzbs;                                                     
	}                                                                
                                                                  
	public void setGlydlrzbs(Long glydlrzbs) {                                     
		this.glydlrzbs = glydlrzbs;                                                  
	}                                                                
	@Column (name = "glybs")                                  
	private Long glybs; //管理员标识                                                
	                                                                 
	public Long getGlybs() {                                            
		return glybs;                                                     
	}                                                                
                                                                  
	public void setGlybs(Long glybs) {                                     
		this.glybs = glybs;                                                  
	}                                                                
	@Column (name = "glydlsj")                                  
	private Integer glydlsj; //管理员登录时间                                                
	                                                                 
	public Integer getGlydlsj() {                                            
		return glydlsj;                                                     
	}                                                                
                                                                  
	public void setGlydlsj(Integer glydlsj) {                                     
		this.glydlsj = glydlsj;                                                  
	}                                                                
	@Column (name = "mmsrsfyw")                                  
	private ESFBZ mmsrsfyw; //密码输入是否有误                                                
	                                                                 
	public ESFBZ getMmsrsfyw() {                                            
		return mmsrsfyw;                                                     
	}                                                                
                                                                  
	public void setMmsrsfyw(ESFBZ mmsrsfyw) {                                     
		this.mmsrsfyw = mmsrsfyw;                                                  
	}                                                                
}
