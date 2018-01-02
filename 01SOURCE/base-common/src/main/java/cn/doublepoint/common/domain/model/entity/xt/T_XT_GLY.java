/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-12-18 17:30:914                      
*                                                                 
* 类   说   明 ：     系统管理员    
*                                                                 
* 修   改   人：          修   改   日   期：                     
*/                                                                
package cn.doublepoint.common.domain.model.entity.xt;  
                                                                  
                                                                  
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.doublepoint.commonutil.domain.model.entity.BaseEntity;
    
@Entity                                                           
@Table(name="XT_GLY")                                                   
public class T_XT_GLY  extends BaseEntity{                                           
	/**                                                                  
	 *                                                                    
	 */                                                                  
     private static final long serialVersionUID = 1L;                                                             
                                                                  
                                                                  
	@Id                                                              
	@Column (name = "glybs")                                  
	private String glybs; //管理员标识                                                
	                                                                 
	public String getGlybs() {                                            
		return glybs;                                                     
	}                                                                
                                                                  
	public void setGlybs(String glybs) {                                     
		this.glybs = glybs;                                                  
	}                                                                
	@Column (name = "dlzh")                                  
	private String dlzh; //登录账号                                                
	                                                                 
	public String getDlzh() {                                            
		return dlzh;                                                     
	}                                                                
                                                                  
	public void setDlzh(String dlzh) {                                     
		this.dlzh = dlzh;                                                  
	}                                                                
	@Column (name = "dlmm")                                  
	private String dlmm; //登录密码                                                
	                                                                 
	public String getDlmm() {                                            
		return dlmm;                                                     
	}                                                                
                                                                  
	public void setDlmm(String dlmm) {                                     
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
