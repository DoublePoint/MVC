/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月20日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.common.util;

import org.springframework.context.ApplicationContext;

import cn.doublepoint.common.util.config.AppConfig;

public class ApplicationUtil {
	private static ApplicationContext applicationContext;
	  
	  public static AppConfig getAppConfig()
	  {
	    return (AppConfig)getCtx().getBean("appConfig");
	  }
	  
	  public static Object getBean(String beanName)
	  {
	    return getCtx().getBean(beanName);
	  }
	  
	  public static void setApplicationContext(ApplicationContext ctx)
	  {
	    applicationContext = ctx;
	  }
	  
	  private static ApplicationContext getCtx()
	  {
	    return applicationContext;
	  }
}
