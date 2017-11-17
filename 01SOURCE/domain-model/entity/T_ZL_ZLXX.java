/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-11-17 22:04:219                      
*                                                                 
* 类   说   明 ：     租赁信息    
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
@Table(name="ZL_ZLXX")                                                   
public class T_ZL_ZLXX  extends BaseEntity{                                              
	/**                                                                  
	 *                                                                    
	 */                                                                  
     private static final long serialVersionUID = 1L;                                                             
                                                                  
                                                                  
	@Id                                                              
	@Column (name = "租赁信息标识")                                  
	private Integer 租赁信息标识; //租赁信息标识                                                
	                                                                 
	public Integer get租赁信息标识() {                                            
		return 租赁信息标识;                                                     
	}                                                                
                                                                  
	public void set租赁信息标识(Integer 租赁信息标识) {                                     
		this.租赁信息标识 = 租赁信息标识;                                                  
	}                                                                
	@Column (name = "用户标识")                                  
	private Integer 用户标识; //用户标识                                                
	                                                                 
	public Integer get用户标识() {                                            
		return 用户标识;                                                     
	}                                                                
                                                                  
	public void set用户标识(Integer 用户标识) {                                     
		this.用户标识 = 用户标识;                                                  
	}                                                                
	@Column (name = "房屋面积")                                  
	private Integer 房屋面积; //房屋面积                                                
	                                                                 
	public Integer get房屋面积() {                                            
		return 房屋面积;                                                     
	}                                                                
                                                                  
	public void set房屋面积(Integer 房屋面积) {                                     
		this.房屋面积 = 房屋面积;                                                  
	}                                                                
	@Column (name = "房屋厅室类别")                                  
	private EFWTSLB 房屋厅室类别; //房屋厅室类别                                                
	                                                                 
	public EFWTSLB get房屋厅室类别() {                                            
		return 房屋厅室类别;                                                     
	}                                                                
                                                                  
	public void set房屋厅室类别(EFWTSLB 房屋厅室类别) {                                     
		this.房屋厅室类别 = 房屋厅室类别;                                                  
	}                                                                
	@Column (name = "出租类别")                                  
	private ECZLB 出租类别; //出租类别                                                
	                                                                 
	public ECZLB get出租类别() {                                            
		return 出租类别;                                                     
	}                                                                
                                                                  
	public void set出租类别(ECZLB 出租类别) {                                     
		this.出租类别 = 出租类别;                                                  
	}                                                                
	@Column (name = "家电")                                  
	private Integer 家电; //家电                                                
	                                                                 
	public Integer get家电() {                                            
		return 家电;                                                     
	}                                                                
                                                                  
	public void set家电(Integer 家电) {                                     
		this.家电 = 家电;                                                  
	}                                                                
	@Column (name = "新旧程度")                                  
	private EXJCD 新旧程度; //新旧程度                                                
	                                                                 
	public EXJCD get新旧程度() {                                            
		return 新旧程度;                                                     
	}                                                                
                                                                  
	public void set新旧程度(EXJCD 新旧程度) {                                     
		this.新旧程度 = 新旧程度;                                                  
	}                                                                
}
