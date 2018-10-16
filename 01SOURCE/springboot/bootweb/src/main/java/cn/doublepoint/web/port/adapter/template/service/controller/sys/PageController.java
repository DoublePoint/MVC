/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年1月4日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.web.port.adapter.template.service.controller.sys;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.doublepoint.commonutil.port.adapter.controller.request.BaseRequestController;

@Controller
public class PageController extends BaseRequestController{
	// 索引页
	@RequestMapping(value = "sys/index")
	public String hello() {
		return "sys/index/index.html";
	}
	@RequestMapping(value = "/sys/index/main")
	public String main() {
		return "sys/index/main.html";
	}
	
	@RequestMapping("sys/login/{actionname}")
	public String login(@PathVariable String actionname) {
		return "sys/login/" + actionname;
	}
	
	@RequestMapping("sys/register/{actionname}")
	public String register(@PathVariable String actionname) {
		return "sys/register/" + actionname;
	}
	
	@RequestMapping("sys/test/{actionname}")
	public String test(@PathVariable String actionname) {
		return "sys/test/" + actionname;
	}
	
	@RequestMapping("sys/bootstrap/{actionname}")
	public String bootstrap(@PathVariable String actionname) {
		return "sys/bootstrap/" + actionname;
	}
	@RequestMapping("sys/assistant/{actionname}")
	public String assistant(@PathVariable String actionname) {
		return "sys/assistant/" + actionname;
	}
	@RequestMapping("sys/config/{actionname}")
	public String config(@PathVariable String actionname) {
		return "sys/config/" + actionname;
	}
}
