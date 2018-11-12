package cn.doublepoint.common.config;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.HandlerMethodReturnValueHandler;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import cn.doublepoint.common.handler.AjaxRequestArgumentsResolver;
import cn.doublepoint.commonutil.interceptor.ControllerReturnIntecerptor;
import cn.doublepoint.commonutil.log.Log4jUtil;

/***
 * 返回值句柄配置、请求参数RequestForm句柄配置
 * @author Administrator
 *
 */
@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {
	
	@Autowired
	ControllerReturnIntecerptor controllerReturnIntecerptor;
	
	public WebMvcConfig() {
		Log4jUtil.debug("ControllerReturnIntecerptor 注册成功！");
	}

	@Override
	public void addReturnValueHandlers(List<HandlerMethodReturnValueHandler> returnValueHandlers) {
		//ControllerReturnIntecerptor returnHandler = new ControllerReturnIntecerptor();
		returnValueHandlers.add(controllerReturnIntecerptor);
		super.addReturnValueHandlers(returnValueHandlers);
	}
	
	@Autowired
    private AjaxRequestArgumentsResolver ajaxRequestArgumentsResolver;
	@Override
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
		argumentResolvers.add(ajaxRequestArgumentsResolver);
	}
}