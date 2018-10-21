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

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.stereotype.Controller;

@Configuration
@ComponentScan(value = { "org.activiti.rest.editor", "org.activiti.rest.diagram" }, includeFilters = {
		@Filter(type = FilterType.ANNOTATION, value = Controller.class), })
public class ActivitiModolerConfiguration {
	
}
