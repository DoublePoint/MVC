/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： Oct 15, 2018
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.workflow.config;

import javax.servlet.http.HttpServletRequest;

import org.activiti.rest.common.application.ContentTypeResolver;
import org.activiti.rest.common.application.DefaultContentTypeResolver;
import org.activiti.rest.common.filter.RestAuthenticator;
import org.activiti.rest.service.api.RestResponseFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.stereotype.Controller;

@Configuration
@ComponentScan(value = { "org.activiti.rest" }, includeFilters = {
		@Filter(type = FilterType.ANNOTATION, value = Controller.class), })
public class ActivitiRestConfiguration implements RestAuthenticator {
	// rest service
	@Bean
	public RestResponseFactory restResponseFactory() {
		return new RestResponseFactory();
	}

	@Bean
	public ContentTypeResolver contentTypeResolver() {
		return new DefaultContentTypeResolver();
	}

	@Override
	public boolean requestRequiresAuthentication(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isRequestAuthorized(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return false;
	}

}