/**                                                               
* 创   建   人： 刘磊                                             
*                                                                 
* 创   建   时   间 ：2017-10-26 17:58:191                      
*                                                                 
* 类   说   明 ：     系统菜单    
*                                                                 
* 修   改   人：          修   改   日   期：                     
*/                                                                
package package cn.doublepoint.domain.model.valueobject.xt;  
                                                                  
                                                                  
import javax.persistence.Embeddable;                                  
import javax.persistence.EnumType;                                  
import javax.persistence.Enumerated;                                      
import javax.persistence.Temporal;                                      
import javax.persistence.TemporalType;                                      
import com.haiyisoft.billing.common.CalcType;                                      
@Embeddable                                                           
public class XT_CD extends BaseValueObject {                                              
                                                                  
	@Id                                                              
	@Column (name = "cdbs")                                  
	private long cdbs; //菜单标识                                                
	                                                                 
	public long getCdbs() {                                            
		return cdbs;                                                     
	}                                                                
                                                                  
	public void setCdbs(long cdbs) {                                     
		this.cdbs = cdbs;                                                  
	}                                                                
	@Column (name = "cdmc")                                  
	private String cdmc; //菜单名称                                                
	                                                                 
	public String getCdmc() {                                            
		return cdmc;                                                     
	}                                                                
                                                                  
	public void setCdmc(String cdmc) {                                     
		this.cdmc = cdmc;                                                  
	}                                                                
	@Column (name = "sjcdbs")                                  
	private long sjcdbs; //上级菜单标识                                                
	                                                                 
	public long getSjcdbs() {                                            
		return sjcdbs;                                                     
	}                                                                
                                                                  
	public void setSjcdbs(long sjcdbs) {                                     
		this.sjcdbs = sjcdbs;                                                  
	}                                                                
	@Column (name = "cdcj")                                  
	private int cdcj; //菜单层级                                                
	                                                                 
	public int getCdcj() {                                            
		return cdcj;                                                     
	}                                                                
                                                                  
	public void setCdcj(int cdcj) {                                     
		this.cdcj = cdcj;                                                  
	}                                                                
	@Column (name = "cdpx")                                  
	private int cdpx; //菜单排序                                                
	                                                                 
	public int getCdpx() {                                            
		return cdpx;                                                     
	}                                                                
                                                                  
	public void setCdpx(int cdpx) {                                     
		this.cdpx = cdpx;                                                  
	}                                                                
	@Column (name = "gxsj")                                  
	private datetime gxsj; //更新时间                                                
	                                                                 
	public datetime getGxsj() {                                            
		return gxsj;                                                     
	}                                                                
                                                                  
	public void setGxsj(datetime gxsj) {                                     
		this.gxsj = gxsj;                                                  
	}                                                                
	@Column (name = "cjsj")                                  
	private datetime cjsj; //创建时间                                                
	                                                                 
	public datetime getCjsj() {                                            
		return cjsj;                                                     
	}                                                                
                                                                  
	public void setCjsj(datetime cjsj) {                                     
		this.cjsj = cjsj;                                                  
	}                                                                
}
