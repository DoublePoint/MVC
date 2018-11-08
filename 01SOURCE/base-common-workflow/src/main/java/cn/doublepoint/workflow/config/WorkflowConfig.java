package cn.doublepoint.workflow.config;
/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月14日
* 
* 类   说   明 ：配置文件
* 
* 修   改   人：          修   改   日   期：
*//*
package cn.doublepoint.common.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

@Configuration
@ConfigurationProperties(prefix="Mybar")
public class WorkflowConfig {
	
	
//	<!-- 配置RestTemplate 调用RestFul服务相关 -->
	@Bean
	public SimpleClientHttpRequestFactory getSimpleClientHttpRequestFactory() {
		SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
		factory.setConnectTimeout(10000);
		factory.setReadTimeout(10000);
		return factory;
	}

	@Bean
	public RestTemplate restTemplate(SimpleClientHttpRequestFactory factory) {
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.setRequestFactory(factory);
		return restTemplate;
	}
	
	
}
*/