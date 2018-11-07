/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月14日
* 
* 类   说   明 ：配置文件
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration("workflowAutoConfig")
public class WorkflowAutoConfig {
	
	@Value("workflow.url")
	private String url;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	
}
