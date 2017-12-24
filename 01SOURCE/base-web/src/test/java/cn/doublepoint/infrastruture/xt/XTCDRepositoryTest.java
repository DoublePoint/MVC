/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月14日
* 
* 类   说   明 ：系统菜单仓库测试类
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.infrastruture.xt;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import cn.doublepoint.common.domain.model.entity.xt.CustomerProjection;
import cn.doublepoint.common.domain.model.entity.xt.T_XT_CD;
import cn.doublepoint.common.port.adapter.template.persistence.xt.XTCDRepository;
import cn.doublepoint.common.util.SnowflakeIdWorker;
import config.RepositoryTest;


public class XTCDRepositoryTest extends RepositoryTest{

	@Resource
	XTCDRepository repository;
	@Resource
	SnowflakeIdWorker idworker;

	@Test
	public void testSaveXTCD() {
		for (int i = 0; i < 9; i++) {
			T_XT_CD cd = new T_XT_CD();
			cd.setCdbs(idworker.nextId());
			cd.setCjsj(new Timestamp(100000));
			cd.setGxsj(new Date());
			repository.save(cd);
		}
	}
	
	@Test
	public void testProjection(){
		List<CustomerProjection> list=repository.findReturnProjection();
		System.out.println("123");
	}
}
