/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-12-23 22:20:266                      
*                                                                 
* 类   说   明 ：     系统权限    
*                                                                 
* 修   改   人：          修   改   日   期：                     
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
	private String qxbs; //权限标识       
	@Column (name = "qxmc")                                  
	private String qxmc; //权限名称       
	@Column (name = "qxz")                                  
	private Long qxz; //权限值       
	@Column (name = "cjsj")                                  
	private Date cjsj; //创建时间       
	@Column (name = "gxsj")                                  
	private Date gxsj; //更新时间       
                                                                  
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
