/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-10-26 18:38:12                      
*                                                                 
* 类   说   明 ：     系统管理员登录日志    
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
public class XT_GLYDLRZ extends BaseValueObject {                                              
                                                                  
	@Id                                                              
	@Column (name = "glydlrzbs")                                  
	private long glydlrzbs; //管理员登录日志标识                                                
	                                                                 
	public long getGlydlrzbs() {                                            
		return glydlrzbs;                                                     
	}                                                                
                                                                  
	public void setGlydlrzbs(long glydlrzbs) {                                     
		this.glydlrzbs = glydlrzbs;                                                  
	}                                                                
	@Column (name = "glybs")                                  
	private long glybs; //管理员标识                                                
	                                                                 
	public long getGlybs() {                                            
		return glybs;                                                     
	}                                                                
                                                                  
	public void setGlybs(long glybs) {                                     
		this.glybs = glybs;                                                  
	}                                                                
	@Column (name = "glydlsj")                                  
	private int glydlsj; //管理员登录时间                                                
	                                                                 
	public int getGlydlsj() {                                            
		return glydlsj;                                                     
	}                                                                
                                                                  
	public void setGlydlsj(int glydlsj) {                                     
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
