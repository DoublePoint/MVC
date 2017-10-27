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

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.doublepoint.domain.model.entity.xt.T_XT_CD;
import cn.doublepoint.infrastructure.xt.XTCDRepository;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations={"classpath:spring-context.xml"})  
public class XTCDRepositoryTest {
	
	@Resource
	XTCDRepository repository;
	
	@Test
	public void testSaveXTCD(){
		T_XT_CD cd=new T_XT_CD();
		cd.setCdbs(2);
		cd.setCjsj(new Timestamp(100000));
		cd.setGxsj(new Date());
		repository.save(cd);
	}
}
