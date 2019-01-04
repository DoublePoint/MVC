/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年1月6日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.common.port.adapter.template.controller.login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.commonutil.ajaxmodel.AjaxRequest;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;

@Controller
@RequestMapping("login")
public class LoginController {

	@RequestMapping("/")
	public String init(HttpServletRequest request, AjaxResponse response) {
		return "sys/login/login.html";
	}
	
	@RequestMapping("/figure")
	@ResponseBody
	public AjaxResponse adminJsp(@RequestBody AjaxRequest request) {
		return new AjaxResponse();
	}
}
