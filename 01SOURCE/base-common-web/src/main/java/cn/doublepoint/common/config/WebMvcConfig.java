package cn.doublepoint.common.config;

import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodReturnValueHandler;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import cn.doublepoint.commonutil.interceptor.ControllerReturnIntecerptor;
import cn.doublepoint.commonutil.log.Log4jUtil;

/***
 * 返回值句柄配置
 * @author Administrator
 *
 */
@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {
	
	public WebMvcConfig() {
		Log4jUtil.debug("ControllerReturnIntecerptor 注册成功！");
	}

	@Override
	public void addReturnValueHandlers(List<HandlerMethodReturnValueHandler> returnValueHandlers) {
		ControllerReturnIntecerptor returnHandler = new ControllerReturnIntecerptor();
		returnValueHandlers.add(returnHandler);
		super.addReturnValueHandlers(returnValueHandlers);
	}
}