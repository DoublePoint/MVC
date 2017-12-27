/**                                                               
* ��   ��   �ˣ� ����                                             
*                                                                 
* ��   ��   ʱ   �� ��2017-12-27 19:11:980                      
*                                                                 
* ��   ˵   �� ��     ϵͳ����    
*                                                                 
* ��   ��   �ˣ�          ��   ��   ��   �ڣ�                     
*/                                                                
package cn.doublepoint.common.domain.model.valueobject.xt;   
                                                                  
                                                                  
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
	private String ggbs; //�����ʶ                                                
	                                                                 
	public String getGgbs() {                                            
		return ggbs;                                                     
	}                                                                
                                                                  
	public void setGgbs(String ggbs) {                                     
		this.ggbs = ggbs;                                                  
	}                                                                
	@Column (name = "gglb")                                  
	private String gglb; //�������                                                
	                                                                 
	public String getGglb() {                                            
		return gglb;                                                     
	}                                                                
                                                                  
	public void setGglb(String gglb) {                                     
		this.gglb = gglb;                                                  
	}                                                                
	@Column (name = "ggnr")                                  
	private String ggnr; //��������                                                
	                                                                 
	public String getGgnr() {                                            
		return ggnr;                                                     
	}                                                                
                                                                  
	public void setGgnr(String ggnr) {                                     
		this.ggnr = ggnr;                                                  
	}                                                                
	@Column (name = "cjsj")                                  
	private Date cjsj; //����ʱ��                                                
	                                                                 
	public Date getCjsj() {                                            
		return cjsj;                                                     
	}                                                                
                                                                  
	public void setCjsj(Date cjsj) {                                     
		this.cjsj = cjsj;                                                  
	}                                                                
	@Column (name = "gxsj")                                  
	private Date gxsj; //����ʱ��                                                
	                                                                 
	public Date getGxsj() {                                            
		return gxsj;                                                     
	}                                                                
                                                                  
	public void setGxsj(Date gxsj) {                                     
		this.gxsj = gxsj;                                                  
	}                                                                
}
