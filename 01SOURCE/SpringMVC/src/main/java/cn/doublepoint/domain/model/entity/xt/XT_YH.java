/** 
* �����ˣ� ����
* ����ʱ�䣺2017-9-25 ����11:16:41 
* ��˵�� ��
* �޸��ˣ�          �޸����ڣ�
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
