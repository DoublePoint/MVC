/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年4月14日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.commonutil;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

@Service
public class ApplicationContextUtil implements ApplicationContextAware{
	
	// Spring应用上下文环境  
    private static ApplicationContext applicationContext;  
	
	public static Object getBean(String beanName){
		return applicationContext.getBean(beanName);
	}

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		ApplicationContextUtil.applicationContext = applicationContext;  
	}
}
