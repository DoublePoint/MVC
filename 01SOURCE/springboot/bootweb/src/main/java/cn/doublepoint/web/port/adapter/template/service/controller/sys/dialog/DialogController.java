/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年3月31日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.web.port.adapter.template.service.controller.sys.dialog;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.doublepoint.commonutil.port.adapter.controller.BaseController;

@Controller
public class DialogController extends BaseController {

	// 索引页
	@RequestMapping(value = "sys/dialog/dialog")
	public String hello() {
		return "sys/dialog/dialog.html";
	}

}
