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

import cn.doublepoint.common.domain.model.entity.sys.Menu;
import cn.doublepoint.common.util.SequenceUtil;


public class SequenceThread extends Thread {

	@Override
	public void run() {
		System.out.println(SequenceUtil.getNextVal(Menu.class));
	}
}
