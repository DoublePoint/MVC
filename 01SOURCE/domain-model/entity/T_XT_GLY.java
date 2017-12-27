/**                                                               
* ��   ��   �ˣ� ����                                             
*                                                                 
* ��   ��   ʱ   �� ��2017-12-27 19:11:967                      
*                                                                 
* ��   ˵   �� ��     ϵͳ����Ա    
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
@Table(name="XT_GLY")                                                   
public class T_XT_GLY  extends BaseEntity{                                              
	/**                                                                  
	 *                                                                    
	 */                                                                  
     private static final long serialVersionUID = 1L;                                                             
                                                                  
                                                                  
	@Id                                                              
	@Column (name = "glybs")                                  
	private String glybs; //����Ա��ʶ       
	@Column (name = "dlzh")                                  
	private String dlzh; //��¼�˺�       
	@Column (name = "dlmm")                                  
	private String dlmm; //��¼����       
	@Column (name = "cjsj")                                  
	private Date cjsj; //����ʱ��       
	@Column (name = "gxsj")                                  
	private Date gxsj; //����ʱ��       
                                                                  
	public void setGlybs(String glybs) {                                     
		this.glybs = glybs;                                                  
	}                                                                
                                                                  
	public void setDlzh(String dlzh) {                                     
		this.dlzh = dlzh;                                                  
	}                                                                
                                                                  
	public void setDlmm(String dlmm) {                                     
		this.dlmm = dlmm;                                                  
	}                                                                
                                                                  
	public void setCjsj(Date cjsj) {                                     
		this.cjsj = cjsj;                                                  
	}                                                                
                                                                  
	public void setGxsj(Date gxsj) {                                     
		this.gxsj = gxsj;                                                  
	}                                                                
	                                                                 
	public String getGlybs() {                                           
		return glybs;                                                     
	}                                                                
	                                                                 
	public String getDlzh() {                                           
		return dlzh;                                                     
	}                                                                
	                                                                 
	public String getDlmm() {                                           
		return dlmm;                                                     
	}                                                                
	                                                                 
	public Date getCjsj() {                                           
		return cjsj;                                                     
	}                                                                
	                                                                 
	public Date getGxsj() {                                           
		return gxsj;                                                     
	}                                                                
}
