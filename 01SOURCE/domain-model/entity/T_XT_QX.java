/**                                                               
* ��   ��   �ˣ� ����                                             
*                                                                 
* ��   ��   ʱ   �� ��2017-12-27 19:11:976                      
*                                                                 
* ��   ˵   �� ��     ϵͳȨ��    
*                                                                 
* ��   ��   �ˣ�          ��   ��   ��   �ڣ�                     
*/                                                                
package cn.doublepoint.common.domain.model.entity.xt;   
                                                                  
                                                                  
import javax.persistence.Column;                                  
import javax.persistence.Entity;                                  
import javax.persistence.Id;                                      
import javax.persistence.Table;                                      
import java.math.BigDecimal;
import java.sql.Timestamp;
    
@Entity                                                           
@Table(name="XT_QX")                                                   
public class T_XT_QX  extends BaseEntity{                                              
	/**                                                                  
	 *                                                                    
	 */                                                                  
     private static final long serialVersionUID = 1L;                                                             
                                                                  
                                                                  
	@Id                                                              
	@Column (name = "qxbs")                                  
	private String qxbs; //Ȩ�ޱ�ʶ       
	@Column (name = "qxmc")                                  
	private String qxmc; //Ȩ������       
	@Column (name = "qxz")                                  
	private Long qxz; //Ȩ��ֵ       
	@Column (name = "cjsj")                                  
	private Date cjsj; //����ʱ��       
	@Column (name = "gxsj")                                  
	private Date gxsj; //����ʱ��       
                                                                  
	public void setQxbs(String qxbs) {                                     
		this.qxbs = qxbs;                                                  
	}                                                                
                                                                  
	public void setQxmc(String qxmc) {                                     
		this.qxmc = qxmc;                                                  
	}                                                                
                                                                  
	public void setQxz(Long qxz) {                                     
		this.qxz = qxz;                                                  
	}                                                                
                                                                  
	public void setCjsj(Date cjsj) {                                     
		this.cjsj = cjsj;                                                  
	}                                                                
                                                                  
	public void setGxsj(Date gxsj) {                                     
		this.gxsj = gxsj;                                                  
	}                                                                
	                                                                 
	public String getQxbs() {                                           
		return qxbs;                                                     
	}                                                                
	                                                                 
	public String getQxmc() {                                           
		return qxmc;                                                     
	}                                                                
	                                                                 
	public Long getQxz() {                                           
		return qxz;                                                     
	}                                                                
	                                                                 
	public Date getCjsj() {                                           
		return cjsj;                                                     
	}                                                                
	                                                                 
	public Date getGxsj() {                                           
		return gxsj;                                                     
	}                                                                
}
