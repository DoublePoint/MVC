/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-10-26 18:38:997                      
*                                                                 
* 类   说   明 ：     系统权限    
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
@Table(name="XT_QX")                                                   
public class T_XT_QX  extends BaseEntity{                                              
	/**                                                                  
	 *                                                                    
	 */                                                                  
     private static final long serialVersionUID = 1L;                                                             
                                                                  
                                                                  
	@Id                                                              
	@Column (name = "qxbs")                                  
	private long qxbs; //权限标识                                                
	                                                                 
	public long getQxbs() {                                            
		return qxbs;                                                     
	}                                                                
                                                                  
	public void setQxbs(long qxbs) {                                     
		this.qxbs = qxbs;                                                  
	}                                                                
	@Column (name = "qxmc")                                  
	private int qxmc; //权限名称                                                
	                                                                 
	public int getQxmc() {                                            
		return qxmc;                                                     
	}                                                                
                                                                  
	public void setQxmc(int qxmc) {                                     
		this.qxmc = qxmc;                                                  
	}                                                                
	@Column (name = "qxz")                                  
	private long qxz; //权限值                                                
	                                                                 
	public long getQxz() {                                            
		return qxz;                                                     
	}                                                                
                                                                  
	public void setQxz(long qxz) {                                     
		this.qxz = qxz;                                                  
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
