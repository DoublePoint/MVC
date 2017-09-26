/** 
* 创建人： 刘磊
* 创建时间：2017-9-25 下午11:38:56 
* 类说明 ：
* 修改人：          修改日期：
*/ 
package infrastruture.xt;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.doublepoint.domain.model.entity.xt.XT_YH;
import cn.doublepoint.infrastructure.xt.XT_YH_Repository;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations={"classpath:spring-context.xml"})  
public class XT_YH_RepositoryTest {
	
	@Resource
	XT_YH_Repository repository;
	@Test
	public void saveXT_RY(){
		XT_YH yh=new XT_YH();
		yh.setBs(1);
		yh.setYhbh("2");
		repository.save(yh);
	}
}
