/**                                                               
* ��   ��   �ˣ� ����                                             
*                                                                 
* ��   ��   ʱ   �� ��2017-12-27 19:11:978                      
*                                                                 
* ��   ˵   �� ��     ϵͳ��ɫ    
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
public class XT_JS extends BaseValueObject {                                              
                                                                  
	@Id                                                              
	@Column (name = "jsbs")                                  
	private String jsbs; //��ɫ��ʶ                                                
	                                                                 
	public String getJsbs() {                                            
		return jsbs;                                                     
	}                                                                
                                                                  
	public void setJsbs(String jsbs) {                                     
		this.jsbs = jsbs;                                                  
	}                                                                
	@Column (name = "jsmc")                                  
	private String jsmc; //��ɫ����                                                
	                                                                 
	public String getJsmc() {                                            
		return jsmc;                                                     
	}                                                                
                                                                  
	public void setJsmc(String jsmc) {                                     
		this.jsmc = jsmc;                                                  
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
