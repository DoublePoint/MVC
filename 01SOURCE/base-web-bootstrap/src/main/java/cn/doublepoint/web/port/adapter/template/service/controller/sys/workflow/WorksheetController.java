/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年6月10日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.web.port.adapter.template.service.controller.sys.workflow;

import java.util.List;

import org.hibernate.boot.registry.classloading.internal.ClassLoaderServiceImpl.Work;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.common.port.adapter.template.persistence.sys.worksheet.InstanceService;
import cn.doublepoint.common.port.adapter.template.persistence.sys.worksheet.WorksheetService;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.filter.BodyReaderHttpServletRequestWrapper;
import cn.doublepoint.template.dto.domain.model.entity.sys.Worksheet;

@Controller
@RequestMapping("/template/sys/worksheet")
public class WorksheetController {
	@Autowired
	private InstanceService instanceService;
	@Autowired
	private WorksheetService worksheetService;

	@RequestMapping("query")
	public AjaxResponse query(BodyReaderHttpServletRequestWrapper request,AjaxResponse response){
		response.setViewName("worksheetQuery");
		return response;
	}
	@RequestMapping("historicTaskList")
	public AjaxResponse historicTaskList(BodyReaderHttpServletRequestWrapper request,AjaxResponse response){
		response.setViewName("historicTaskList");
		return response;
	}
	
	@RequestMapping("retrieve")
	@ResponseBody
	public AjaxResponse retrieve(BodyReaderHttpServletRequestWrapper request,AjaxResponse response){
		AjaxDataWrap<Worksheet> queryDataWrap=request.getAjaxDataWrap("queryDataWrap", Worksheet.class);
		AjaxDataWrap<Worksheet> dataWrap=request.getAjaxDataWrap("dataWrap", Worksheet.class);
		
		Worksheet query=queryDataWrap.getData();
		List<Worksheet> list=worksheetService.find(query, dataWrap.getPageInfo());
		dataWrap.setDataList(list);
		response.setAjaxParameter("dataWrap", dataWrap);
		return response;
	}
}
