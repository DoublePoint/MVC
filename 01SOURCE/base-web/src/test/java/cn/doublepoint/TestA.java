/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月23日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.doublepoint.common.config.AutoConfiguration;
import config.ConfigurationTest;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-context.xml"}) 
public class TestA {
	@Test
	public void test1(){
		
	}
}
