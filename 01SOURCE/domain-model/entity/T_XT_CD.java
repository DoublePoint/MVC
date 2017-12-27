/**                                                               
* ��   ��   �ˣ� ����                                             
*                                                                 
* ��   ��   ʱ   �� ��2017-12-27 19:11:975                      
*                                                                 
* ��   ˵   �� ��     ϵͳ�˵�    
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
@Table(name="XT_CD")                                                   
public class T_XT_CD  extends BaseEntity{                                              
	/**                                                                  
	 *                                                                    
	 */                                                                  
     private static final long serialVersionUID = 1L;                                                             
                                                                  
                                                                  
	@Id                                                              
	@Column (name = "cdbs")                                  
	private String cdbs; //�˵���ʶ       
	@Column (name = "cdmc")                                  
	private String cdmc; //�˵�����       
	@Column (name = "cdlj")                                  
	private String cdlj; //�˵�����       
	@Column (name = "sjcdbs")                                  
	private String sjcdbs; //�ϼ��˵���ʶ       
	@Column (name = "cdcj")                                  
	private Integer cdcj; //�˵��㼶       
	@Column (name = "cdpx")                                  
	private Integer cdpx; //�˵�����       
	@Column (name = "gxsj")                                  
	private Date gxsj; //����ʱ��       
	@Column (name = "cjsj")                                  
	private Date cjsj; //����ʱ��       
                                                                  
	public void setCdbs(String cdbs) {                                     
		this.cdbs = cdbs;                                                  
	}                                                                
                                                                  
	public void setCdmc(String cdmc) {                                     
		this.cdmc = cdmc;                                                  
	}                                                                
                                                                  
	public void setCdlj(String cdlj) {                                     
		this.cdlj = cdlj;                                                  
	}                                                                
                                                                  
	public void setSjcdbs(String sjcdbs) {                                     
		this.sjcdbs = sjcdbs;                                                  
	}                                                                
                                                                  
	public void setCdcj(Integer cdcj) {                                     
		this.cdcj = cdcj;                                                  
	}                                                                
                                                                  
	public void setCdpx(Integer cdpx) {                                     
		this.cdpx = cdpx;                                                  
	}                                                                
                                                                  
	public void setGxsj(Date gxsj) {                                     
		this.gxsj = gxsj;                                                  
	}                                                                
                                                                  
	public void setCjsj(Date cjsj) {                                     
		this.cjsj = cjsj;                                                  
	}                                                                
	                                                                 
	public String getCdbs() {                                           
		return cdbs;                                                     
	}                                                                
	                                                                 
	public String getCdmc() {                                           
		return cdmc;                                                     
	}                                                                
	                                                                 
	public String getCdlj() {                                           
		return cdlj;                                                     
	}                                                                
	                                                                 
	public String getSjcdbs() {                                           
		return sjcdbs;                                                     
	}                                                                
	                                                                 
	public Integer getCdcj() {                                           
		return cdcj;                                                     
	}                                                                
	                                                                 
	public Integer getCdpx() {                                           
		return cdpx;                                                     
	}                                                                
	                                                                 
	public Date getGxsj() {                                           
		return gxsj;                                                     
	}                                                                
	                                                                 
	public Date getCjsj() {                                           
		return cjsj;                                                     
	}                                                                
}
