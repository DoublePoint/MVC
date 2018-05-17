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

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.doublepoint.common.domain.model.entity.sys.MySQLTables;
import cn.doublepoint.common.port.adapter.template.persistence.sys.common.DataBaseMetaDataUtil;
import cn.doublepoint.commonutil.domain.model.StringUtil;
import cn.doublepoint.commonutil.port.adapter.controller.request.BaseRequestController;

@Controller
public class PageController extends BaseRequestController{
	private String testParam;
	private String aaa;
	// 索引页
	@RequestMapping(value = "/template/sys/index/{actionname}")
	public String hello(@PathVariable String actionname) {
		if(StringUtil.isNullOrEmpty(actionname))
			return "/template/sys/index/index";
		return "/template/sys/index/"+actionname;
	}
	@RequestMapping(value = "/index/{actionname}")
	public String index(@PathVariable String actionname) {
		return "/template/sys/index/"+actionname;
	}
	// 菜单页面
	@RequestMapping("/template/sys/menu/{actionname}")
	public String cd(@PathVariable String actionname) {
		return "/template/sys/menu/" + actionname;
	}

	@RequestMapping("/template/sys/login/{actionname}")
	public String login(@PathVariable String actionname) {
		return "/template/sys/login/" + actionname;
	}
	
	@RequestMapping("/template/sys/register/{actionname}")
	public String register(@PathVariable String actionname) {
		return "/template/sys/register/" + actionname;
	}
	
	@RequestMapping("/template/sys/role/{actionname}")
	public String role(@PathVariable String actionname) {
		return "/template/sys/role/" + actionname;
	}

	@RequestMapping("/template/sys/test/{actionname}")
	public String test(@PathVariable String actionname) {
		return "/template/sys/test/" + actionname;
	}
	
	@RequestMapping("/template/sys/bootstrap/{actionname}")
	public String bootstrap(@PathVariable String actionname) {
		return "/template/sys/bootstrap/" + actionname;
	}
	@RequestMapping("/template/sys/assistant/{actionname}")
	public String assistant(@PathVariable String actionname) {
//		List<MySQLTables> list = DataBaseMetaDataUtil.getTables();
//		responseData.setAjaxParameter("test111", list);
		return "/template/sys/assistant/" + actionname;
	}
	@RequestMapping("/template/sys/config/{actionname}")
	public String config(@PathVariable String actionname) {
		return "/template/sys/config/" + actionname;
	}
}
