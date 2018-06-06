/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年6月6日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.web.port.adapter.template.service.controller.sys.publishannouncement;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.port.adapter.controller.BaseController;

@Controller
@RequestMapping("/template/sys/workflow/announcement")
public class PublishAnnouncementController extends BaseController{

	@RequestMapping("apply")
	public AjaxResponse apply(AjaxResponse response) {
		response.setViewName("announcementApply");
		return response;
	}
	
	@RequestMapping("aduit")
	public AjaxResponse aduit(AjaxResponse response){
		response.setViewName("announcementAduit");
		return response;
	}
}
