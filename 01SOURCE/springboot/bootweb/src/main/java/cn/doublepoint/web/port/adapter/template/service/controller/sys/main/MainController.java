/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年6月10日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.web.port.adapter.template.service.controller.sys.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;

@Controller
@RequestMapping("sys/index")
public class MainController {
	/*@Autowired
	private InstanceService instanceService;*/
	
	@RequestMapping("main")
	public AjaxResponse hello(AjaxResponse response) {
		/*AjaxDataWrap<Worksheet> worksheetDataWrap=new AjaxDataWrap<Worksheet>();
		Worksheet query=new Worksheet();
		List<Worksheet> list=instanceService.getPersonalWorksheetList(query, worksheetDataWrap.getPageInfo());
		
		worksheetDataWrap.setDataList(list);
		response.setAjaxParameter("worksheetDataWrap", worksheetDataWrap);*/
		response.setViewName("sys/index/main.html");
		return response;
	}
	
}
