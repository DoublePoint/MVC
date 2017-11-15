/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ：2017-9-25 下午11:16:41 
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.domain.model.entity.xt;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="xt_yh")
public class T_XT_YH {

	@Id
	@Column
	private long bs;
	
	@Column
	private String yhbh;

	public long getBs() {
		return bs;
	}

	public void setBs(long bs) {
		this.bs = bs;
	}

	public String getYhbh() {
		return yhbh;
	}

	public void setYhbh(String yhbh) {
		this.yhbh = yhbh;
	}
}
