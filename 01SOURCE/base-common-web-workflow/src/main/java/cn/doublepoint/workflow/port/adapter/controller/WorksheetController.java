/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年6月10日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.workflow.port.adapter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxRequest;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.dto.domain.model.entity.sys.Worksheet;
import cn.doublepoint.dto.domain.model.vo.workflow.VOTask;
import cn.doublepoint.workflow.process.InstanceService;
import cn.doublepoint.workflow.process.WorksheetService;

@Controller
@RequestMapping("sys/worksheet")
public class WorksheetController {
	@Autowired
	private InstanceService instanceService;
	@Autowired
	private WorksheetService worksheetService;

	@RequestMapping("query")
	public AjaxResponse query(AjaxResponse response){
		response.setViewName("sys/worksheet/worksheetQuery.html");
		return response;
	}
	@RequestMapping("historicTaskList")
	public AjaxResponse historicTaskList(AjaxResponse response){
		response.setViewName("historicTaskList");
		List<VOTask> list=instanceService.getHistoricTasks("10001");
		AjaxDataWrap<VOTask> dataWrap=new AjaxDataWrap<VOTask>();
		dataWrap.setDataList(list);
		response.setAjaxParameter("dataWrap", dataWrap);
		return response;
	}
	
	@RequestMapping("retrieve")
	@ResponseBody
	public AjaxResponse retrieve(@RequestBody AjaxRequest request,AjaxResponse response){
		AjaxDataWrap<Worksheet> queryDataWrap=request.getAjaxDataWrap("queryDataWrap", Worksheet.class);
		AjaxDataWrap<Worksheet> dataWrap=request.getAjaxDataWrap("worksheetDataWrap", Worksheet.class);
		
		Worksheet query=queryDataWrap.getData();
		List<Worksheet> list=worksheetService.find(query, dataWrap.getPageInfo());
		dataWrap.setDataList(list);
		response.setAjaxParameter("dataWrap", dataWrap);
		return response;
	}
}
