/** 
* 创建人： 刘磊
* 创建时间：2017-9-25 下午11:16:41 
* 类说明 ：
* 修改人：          修改日期：
*/ 
package cn.doublepoint.domain.model.entity.xt;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class XT_YH {

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
