/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2017-10-11 下午10:02:29
 * 
 * 类   说   明 ：
 * 
 * ******************修改日志***********************************
 * 
 * 修改人： 修改日期： 修改内容：
 * 
 * 修改人： 修改日期： 修改内容：
*/ 
package cn.doublepoint.web.port.adapter.template.service.controller.xt.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.doublepoint.base.common.port.adapter.controller.request.BaseRequestController;

@Controller
public class MainPageController implements BaseRequestController {

	@RequestMapping(value="/index")
	public String hello(){
		return "/xt/index/index";
	}

}
