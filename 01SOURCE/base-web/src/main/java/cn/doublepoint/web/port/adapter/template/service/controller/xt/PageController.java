/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年1月4日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.web.port.adapter.template.service.controller.xt;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
	// 菜单页面
	@RequestMapping("/template/xt/cd/{actionname}")
	public String cd(@PathVariable String actionname) {
		return "/template/xt/cd/" + actionname;
	}
	@RequestMapping("/template/xt/login/{actionname}")
	public String login(@PathVariable String actionname) {
		return "/template/xt/login/" + actionname;
	}
	@RequestMapping("/template/xt/test/{actionname}")
	public String test(@PathVariable String actionname) {
		return "/template/xt/test/" + actionname;
	}
}
