/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-10-26 18:38:997                      
*                                                                 
* 类   说   明 ：     系统管理员    
*                                                                 
* 修   改   人：          修   改   日   期：                     
*/                                                                
package package cn.doublepoint.domain.model.entity.xt;  
                                                                  
                                                                  
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
	private datetime cjsj; //创建时间                                                
	                                                                 
	public datetime getCjsj() {                                            
		return cjsj;                                                     
	}                                                                
                                                                  
	public void setCjsj(datetime cjsj) {                                     
		this.cjsj = cjsj;                                                  
	}                                                                
	@Column (name = "gxsj")                                  
	private datetime gxsj; //更新时间                                                
	                                                                 
	public datetime getGxsj() {                                            
		return gxsj;                                                     
	}                                                                
                                                                  
	public void setGxsj(datetime gxsj) {                                     
		this.gxsj = gxsj;                                                  
	}                                                                
}
