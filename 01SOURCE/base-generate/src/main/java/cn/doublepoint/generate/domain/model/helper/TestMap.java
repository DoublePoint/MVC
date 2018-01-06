/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年1月6日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.generate.domain.model.helper;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;

public class TestMap {
	
	@Test
	public void testMap(){
		Map<String, Integer> map = new HashMap<String, Integer>();  
        Integer it = map.put("id", new Integer(1));  
        Integer it1 = map.put("id", new Integer(333));  
        // 在放入第一个 id 元素的时候，因为之前没有 id，所以返回值为 null  
        // 在第二次放入 id 的时候，因为之前已经有了一个 id 了，所以在放入新元素之前需要将原来的元素给返回给调用者  
        
        System.out.println(it);  
        System.out.println(it1);  
        System.out.println(map.get("id"));
	}
}
