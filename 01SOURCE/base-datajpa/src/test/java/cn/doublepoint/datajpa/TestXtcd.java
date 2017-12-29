/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月29日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.datajpa;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.querydsl.core.types.Predicate;

import cn.doublepoint.datajpa.domain.model.QT_XT_CD;
import cn.doublepoint.datajpa.repository.TXTCDRepository;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/applicationContext.xml")
public class TestXtcd {

	@Resource
	TXTCDRepository repository;

	@Test
	public void test() {
		QT_XT_CD cd = QT_XT_CD.t_XT_CD;
		Predicate predicate = cd.cdbs.eq("393822756359110656");
		repository.findCDDetail(predicate);
	}
}
