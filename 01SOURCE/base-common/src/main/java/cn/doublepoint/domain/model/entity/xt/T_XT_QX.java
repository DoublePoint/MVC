/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-11-17 21:56:764                      
*                                                                 
* 类   说   明 ：     系统权限    
*                                                                 
* 修   改   人：          修   改   日   期：                     
*/                                                                
package cn.doublepoint.domain.model.entity.xt;  
                                                                  
                                                                  
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.doublepoint.domain.model.entity.BaseEntity;
    
@Entity                                                           
@Table(name="XT_QX")                                                   
public class T_XT_QX  extends BaseEntity{                                              
	/**                                                                  
	 *                                                                    
	 */                                                                  
     private static final long serialVersionUID = 1L;                                                             
                                                                  
                                                                  
	@Id                                                              
	@Column (name = "qxbs")                                  
	private Long qxbs; //权限标识                                                
	                                                                 
	public Long getQxbs() {                                            
		return qxbs;                                                     
	}                                                                
                                                                  
	public void setQxbs(Long qxbs) {                                     
		this.qxbs = qxbs;                                                  
	}                                                                
	@Column (name = "qxmc")                                  
	private Integer qxmc; //权限名称                                                
	                                                                 
	public Integer getQxmc() {                                            
		return qxmc;                                                     
	}                                                                
                                                                  
	public void setQxmc(Integer qxmc) {                                     
		this.qxmc = qxmc;                                                  
	}                                                                
	@Column (name = "qxz")                                  
	private Long qxz; //权限值                                                
	                                                                 
	public Long getQxz() {                                            
		return qxz;                                                     
	}                                                                
                                                                  
	public void setQxz(Long qxz) {                                     
		this.qxz = qxz;                                                  
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
