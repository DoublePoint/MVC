/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年1月4日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.generate.port.adapter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.doublepoint.commonutil.domain.model.StringUtil;

@Controller
public class PageController {
	// 索引页
	@RequestMapping(value = "/generate/{actionname}")
	public String hello(@PathVariable String actionname) {
		if(StringUtil.isNullOrEmpty(actionname))
			return "/generate/index";
		return "/generate/"+actionname;
	}
}
