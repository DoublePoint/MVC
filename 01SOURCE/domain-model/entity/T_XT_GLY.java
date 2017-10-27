/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-10-27 13:24:974                      
*                                                                 
* 类   说   明 ：     系统管理员    
*                                                                 
* 修   改   人：          修   改   日   期：                     
*/                                                                
package cn.doublepoint.domain.model.entity.xt;  
                                                                  
                                                                  
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
	private long glybs; //管理员标识                                                
	                                                                 
	public long getGlybs() {                                            
		return glybs;                                                     
	}                                                                
                                                                  
	public void setGlybs(long glybs) {                                     
		this.glybs = glybs;                                                  
	}                                                                
	@Column (name = "dlzh")                                  
	private string dlzh; //登录账号                                                
	                                                                 
	public string getDlzh() {                                            
		return dlzh;                                                     
	}                                                                
                                                                  
	public void setDlzh(string dlzh) {                                     
		this.dlzh = dlzh;                                                  
	}                                                                
	@Column (name = "dlmm")                                  
	private string dlmm; //登录密码                                                
	                                                                 
	public string getDlmm() {                                            
		return dlmm;                                                     
	}                                                                
                                                                  
	public void setDlmm(string dlmm) {                                     
		this.dlmm = dlmm;                                                  
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
