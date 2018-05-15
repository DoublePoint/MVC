/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月14日
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

@ContextConfiguration(classes = { TestConfiguration.class })
@RunWith(SpringJUnit4ClassRunner.class)
public class TestSequenceThread {

	@Test
	public void testSequest() {
		for (int i = 0; i < 100; i++) {
			SequenceThread sequenceThread1 = new SequenceThread();
			SequenceThread sequenceThread2 = new SequenceThread();
			SequenceThread sequenceThread3 = new SequenceThread();
			SequenceThread sequenceThread4 = new SequenceThread();
			sequenceThread1.run();
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			sequenceThread2.run();
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			sequenceThread3.run();
			sequenceThread4.run();
			
		}
	}

}
