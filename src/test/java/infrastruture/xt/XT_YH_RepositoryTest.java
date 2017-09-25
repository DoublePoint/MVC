/** 
* 创建人： 刘磊
* 创建时间：2017-9-25 下午11:38:56 
* 类说明 ：
* 修改人：          修改日期：
*/ 
package infrastruture.xt;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.doublepoint.infrastructure.xt.XT_YH_Repository;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations={"classpath:applicationContext.xml"})  
public class XT_YH_RepositoryTest {
	
	
	@Test
	public saveXT_RY(){
		XT_YH_Repository repository=new XT_YH_Repository();
	}
}
