/**                                                               
* ��   ��   �ˣ� ����                                             
*                                                                 
* ��   ��   ʱ   �� ��2017-12-27 19:11:979                      
*                                                                 
* ��   ˵   �� ��     ϵͳ����Ա��¼��־    
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
public class XT_GLYDLRZ extends BaseValueObject {                                              
                                                                  
	@Id                                                              
	@Column (name = "glydlrzbs")                                  
	private String glydlrzbs; //����Ա��¼��־��ʶ                                                
	                                                                 
	public String getGlydlrzbs() {                                            
		return glydlrzbs;                                                     
	}                                                                
                                                                  
	public void setGlydlrzbs(String glydlrzbs) {                                     
		this.glydlrzbs = glydlrzbs;                                                  
	}                                                                
	@Column (name = "glybs")                                  
	private String glybs; //����Ա��ʶ                                                
	                                                                 
	public String getGlybs() {                                            
		return glybs;                                                     
	}                                                                
                                                                  
	public void setGlybs(String glybs) {                                     
		this.glybs = glybs;                                                  
	}                                                                
	@Column (name = "glydlsj")                                  
	private Date glydlsj; //����Ա��¼ʱ��                                                
	                                                                 
	public Date getGlydlsj() {                                            
		return glydlsj;                                                     
	}                                                                
                                                                  
	public void setGlydlsj(Date glydlsj) {                                     
		this.glydlsj = glydlsj;                                                  
	}                                                                
	@Column (name = "mmsrsfyw")                                  
	private String mmsrsfyw; //���������Ƿ�����                                                
	                                                                 
	public String getMmsrsfyw() {                                            
		return mmsrsfyw;                                                     
	}                                                                
                                                                  
	public void setMmsrsfyw(String mmsrsfyw) {                                     
		this.mmsrsfyw = mmsrsfyw;                                                  
	}                                                                
}
