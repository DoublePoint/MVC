/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年6月10日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.port.adapter.template.controller.main;

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
		/*AjaxDataPacket<Worksheet> worksheetDataPacket=new AjaxDataPacket<Worksheet>();
		Worksheet query=new Worksheet();
		List<Worksheet> list=instanceService.getPersonalWorksheetList(query, worksheetDataPacket.getPageInfo());
		
		worksheetDataPacket.setDataList(list);
		response.setAjaxParameter("worksheetDataPacket", worksheetDataPacket);*/
		response.setViewName("sys/index/main.html");
		return response;
	}
	
}
