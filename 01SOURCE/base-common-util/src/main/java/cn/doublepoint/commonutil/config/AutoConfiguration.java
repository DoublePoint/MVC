/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年10月17日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.commonutil.config;

import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import cn.doublepoint.commonutil.argumentresolver.AjaxRequestArgumentsResolver;

@Configuration("commonUtioConfiguration")
public class AutoConfiguration extends WebMvcConfigurerAdapter{

	@Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
        super.addArgumentResolvers(argumentResolvers);
        argumentResolvers.add(new AjaxRequestArgumentsResolver());
    }
}
