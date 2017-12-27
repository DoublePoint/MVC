/**                                                               
* ��   ��   �ˣ� ����                                             
*                                                                 
* ��   ��   ʱ   �� ��2017-12-27 19:11:977                      
*                                                                 
* ��   ˵   �� ��     ϵͳ�˵�������־    
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
public class XT_CDFWRZ extends BaseValueObject {                                              
                                                                  
	@Id                                                              
	@Column (name = "cdfwrzbs")                                  
	private String cdfwrzbs; //�˵�������־��ʶ                                                
	                                                                 
	public String getCdfwrzbs() {                                            
		return cdfwrzbs;                                                     
	}                                                                
                                                                  
	public void setCdfwrzbs(String cdfwrzbs) {                                     
		this.cdfwrzbs = cdfwrzbs;                                                  
	}                                                                
	@Column (name = "cdbs")                                  
	private String cdbs; //�˵���ʶ                                                
	                                                                 
	public String getCdbs() {                                            
		return cdbs;                                                     
	}                                                                
                                                                  
	public void setCdbs(String cdbs) {                                     
		this.cdbs = cdbs;                                                  
	}                                                                
	@Column (name = "fwsj")                                  
	private Date fwsj; //����ʱ��                                                
	                                                                 
	public Date getFwsj() {                                            
		return fwsj;                                                     
	}                                                                
                                                                  
	public void setFwsj(Date fwsj) {                                     
		this.fwsj = fwsj;                                                  
	}                                                                
	@Column (name = "cjsj")                                  
	private Date cjsj; //����ʱ��                                                
	                                                                 
	public Date getCjsj() {                                            
		return cjsj;                                                     
	}                                                                
                                                                  
	public void setCjsj(Date cjsj) {                                     
		this.cjsj = cjsj;                                                  
	}                                                                
}
