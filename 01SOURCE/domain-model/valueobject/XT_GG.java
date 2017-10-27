/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-10-27 13:24:985                      
*                                                                 
* 类   说   明 ：     系统公告    
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
public class XT_GG extends BaseValueObject {                                              
                                                                  
	@Id                                                              
	@Column (name = "ggbs")                                  
	private long ggbs; //公告标识                                                
	                                                                 
	public long getGgbs() {                                            
		return ggbs;                                                     
	}                                                                
                                                                  
	public void setGgbs(long ggbs) {                                     
		this.ggbs = ggbs;                                                  
	}                                                                
	@Column (name = "gglb")                                  
	private EGGLB gglb; //公告类别                                                
	                                                                 
	public EGGLB getGglb() {                                            
		return gglb;                                                     
	}                                                                
                                                                  
	public void setGglb(EGGLB gglb) {                                     
		this.gglb = gglb;                                                  
	}                                                                
	@Column (name = "ggnr")                                  
	private string ggnr; //公告内容                                                
	                                                                 
	public string getGgnr() {                                            
		return ggnr;                                                     
	}                                                                
                                                                  
	public void setGgnr(string ggnr) {                                     
		this.ggnr = ggnr;                                                  
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
