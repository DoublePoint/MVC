/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-11-17 22:04:229                      
*                                                                 
* 类   说   明 ：     足迹    
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
@Table(name="ZL_ZJ")                                                   
public class T_ZL_ZJ  extends BaseEntity{                                              
	/**                                                                  
	 *                                                                    
	 */                                                                  
     private static final long serialVersionUID = 1L;                                                             
                                                                  
                                                                  
	@Id                                                              
	@Column (name = "足迹标识")                                  
	private Integer 足迹标识; //足迹标识                                                
	                                                                 
	public Integer get足迹标识() {                                            
		return 足迹标识;                                                     
	}                                                                
                                                                  
	public void set足迹标识(Integer 足迹标识) {                                     
		this.足迹标识 = 足迹标识;                                                  
	}                                                                
	@Column (name = "用户标识")                                  
	private Integer 用户标识; //用户标识                                                
	                                                                 
	public Integer get用户标识() {                                            
		return 用户标识;                                                     
	}                                                                
                                                                  
	public void set用户标识(Integer 用户标识) {                                     
		this.用户标识 = 用户标识;                                                  
	}                                                                
	@Column (name = "浏览类型")                                  
	private Integer 浏览类型; //浏览类型                                                
	                                                                 
	public Integer get浏览类型() {                                            
		return 浏览类型;                                                     
	}                                                                
                                                                  
	public void set浏览类型(Integer 浏览类型) {                                     
		this.浏览类型 = 浏览类型;                                                  
	}                                                                
	@Column (name = "信息标识")                                  
	private Integer 信息标识; //信息标识                                                
	                                                                 
	public Integer get信息标识() {                                            
		return 信息标识;                                                     
	}                                                                
                                                                  
	public void set信息标识(Integer 信息标识) {                                     
		this.信息标识 = 信息标识;                                                  
	}                                                                
}
