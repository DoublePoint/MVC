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
}
