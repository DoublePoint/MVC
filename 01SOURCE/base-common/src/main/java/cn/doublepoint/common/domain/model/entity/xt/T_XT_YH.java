/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-11-17 22:04:228                      
*                                                                 
* 类   说   明 ：     系统用户    
*                                                                 
* 修   改   人：          修   改   日   期：                     
*/                                                                
package cn.doublepoint.common.domain.model.entity.xt;  
                                                                  
                                                                  
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.doublepoint.common.domain.model.entity.BaseEntity;
    
@Entity                                                           
@Table(name="XT_YH")                                                   
public class T_XT_YH  extends BaseEntity{                                              
	/**                                                                  
	 *                                                                    
	 */                                                                  
     private static final long serialVersionUID = 1L;                                                             
                                                                  
                                                                  
	@Id                                                              
	@Column (name = "yhbs")                                  
	private Long yhbs; //用户标识                                                
	                                                                 
	public Long getYhbs() {                                            
		return yhbs;                                                     
	}                                                                
                                                                  
	public void setYhbs(Long yhbs) {                                     
		this.yhbs = yhbs;                                                  
	}                                                                
	@Column (name = "dlzh")                                  
	private String dlzh; //登录账号                                                
	                                                                 
	public String getDlzh() {                                            
		return dlzh;                                                     
	}                                                                
                                                                  
	public void setDlzh(String dlzh) {                                     
		this.dlzh = dlzh;                                                  
	}                                                                
	@Column (name = "email")                                  
	private String email; //邮箱                                                
	                                                                 
	public String getEmail() {                                            
		return email;                                                     
	}                                                                
                                                                  
	public void setEmail(String email) {                                     
		this.email = email;                                                  
	}                                                                
	@Column (name = "mm")                                  
	private String mm; //密码                                                
	                                                                 
	public String getMm() {                                            
		return mm;                                                     
	}                                                                
                                                                  
	public void setMm(String mm) {                                     
		this.mm = mm;                                                  
	}                                                                
	@Column (name = "sjh")                                  
	private String sjh; //手机号                                                
	                                                                 
	public String getSjh() {                                            
		return sjh;                                                     
	}                                                                
                                                                  
	public void setSjh(String sjh) {                                     
		this.sjh = sjh;                                                  
	}                                                                
	@Column (name = "cjsj")                                  
	private Date cjsj; //创建时间                                                
	                                                                 
	public Date getCjsj() {                                            
		return cjsj;                                                     
	}                                                                
                                                                  
	public void setCjsj(Date cjsj) {                                     
		this.cjsj = cjsj;                                                  
	}                                                                
	@Column (name = "xgsj")                                  
	private Date xgsj; //修改时间                                                
	                                                                 
	public Date getXgsj() {                                            
		return xgsj;                                                     
	}                                                                
                                                                  
	public void setXgsj(Date xgsj) {                                     
		this.xgsj = xgsj;                                                  
	}                                                                
}
