/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年1月4日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.port.adapter.template.controller;

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
	
	
	@RequestMapping("sys/login/{actionname}")
	public String login(@PathVariable String actionname) {
		return "sys/login/" + actionname+".html";
	}
	
	@RequestMapping("sys/register/{actionname}")
	public String register(@PathVariable String actionname) {
		return "sys/register/" + actionname+".html";
	}
	
	@RequestMapping("sys/test/{actionname}")
	public String test(@PathVariable String actionname) {
		return "sys/test/" + actionname+".html";
	}
	
	@RequestMapping("sys/bootstrap/{actionname}")
	public String bootstrap(@PathVariable String actionname) {
		return "sys/bootstrap/" + actionname+".html";
	}
	@RequestMapping("sys/assistant/{actionname}")
	public String assistant(@PathVariable String actionname) {
		return "sys/assistant/" + actionname+".html";
	}

	@RequestMapping("sys/config/{actionname}")
	public String config(@PathVariable String actionname) {
		return "sys/config/" + actionname+".html";
	}
	@RequestMapping("sys/commonpage/{actionname}")
	public String commonpage(@PathVariable String actionname) {
		return "sys/commonpage/" + actionname+".html";
	}
}
