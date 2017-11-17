/** 
* 创建人： 刘磊
* 创建时间：2017-9-25 下午11:38:56 
* 类说明 ：
* 修改人：          修改日期：
*/ 
package cn.doublepoint.infrastruture.xt;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.doublepoint.domain.model.entity.xt.T_XT_YH;
import cn.doublepoint.port.adapter.template.persistence.xt.XTYHRepository;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations={"classpath:spring-context.xml"})  
public class XTYHRepositoryTest {
	
	@Resource
	XTYHRepository repository;
	@Test
	public void saveXT_RY(){
		T_XT_YH yh=new T_XT_YH();
		yh.setYhbs(2L);
		repository.save(yh);
	}
}
