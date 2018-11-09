/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年6月6日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.workflow.port.adapter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxRequest;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.port.adapter.controller.BaseController;
import cn.doublepoint.dto.domain.model.entity.sys.AnnouncementChanged;
import cn.doublepoint.dto.domain.model.entity.sys.Worksheet;
import cn.doublepoint.workflow.constant.WorkflowConstant;
import cn.doublepoint.workflow.port.adapter.service.AnnouncementChangedService;
import cn.doublepoint.workflow.process.WorksheetService;
import cn.doublepoint.workflow.util.WorksheetUtil;

@Controller
@RequestMapping("sys/workflow/announcement")
public class PublishAnnouncementController extends BaseController{
	@Autowired
    private RestTemplate restTemplate;
	@Autowired
	private WorksheetService worksheetService;
	@Autowired
	private AnnouncementChangedService announcementChangedService;
	
	@RequestMapping("apply")
	public AjaxResponse apply(AjaxResponse response) {
		response.setViewName("sys/workflow/announcement/announcementApply.html");
		return response;
	}
	
	@RequestMapping("aduit")
	public AjaxResponse aduit(AjaxResponse response){
		response.setViewName("sys/workflow/announcement/announcementAduit.html");
		return response;
	}
	
	@RequestMapping("findWorksheet")
	@ResponseBody
	public AjaxResponse findWorksheetAndChange(@RequestBody AjaxRequest request,AjaxResponse response){
		String worksheetNo=request.getParameter("worksheetNo");
		Worksheet worksheet=worksheetService.getByWorksheetNo(worksheetNo);
		AjaxDataWrap<Worksheet> worksheetWrap=new AjaxDataWrap<>();
		worksheetWrap.setData(worksheet);
		
		AjaxDataWrap<AnnouncementChanged> annChangedWrap=new AjaxDataWrap<AnnouncementChanged>();
		
		AnnouncementChanged query=new AnnouncementChanged();
		query.setWorksheetNo(worksheetNo);
		List<AnnouncementChanged> list=announcementChangedService.find(query, null);
		if(list!=null&&list.size()>0){
			annChangedWrap.setData(list.get(0));
			response.setAjaxParameter("annChangedWrap", annChangedWrap);
		}
		return response;
	}
	
	@RequestMapping("save")
	@ResponseBody
	public AjaxResponse save(@RequestBody AjaxRequest request,AjaxResponse response){
		AjaxDataWrap<AnnouncementChanged> annChangedWrap=request.getAjaxDataWrap("annChangedWrap",AnnouncementChanged.class);
		
		Worksheet worksheet=new Worksheet();
		worksheet.setClassification(WorkflowConstant.WORKFLOW_CLASSIFICATION);
		String worksheetNo=WorksheetUtil.createAndStart(worksheet.getClassification(), "liulei", worksheet.getDescription());
		
		AnnouncementChanged changed=annChangedWrap.getData();
		changed.setWorksheetNo(worksheetNo);
		announcementChangedService.saveOrUpdate(changed);
		response.setAjaxParameter("worksheetNo", worksheetNo);
		return response;
	}
	
	@RequestMapping("saveAduit/{instanceId}")
	@ResponseBody
	public AjaxResponse save(@PathVariable("instanceId") String instanceId, @RequestBody AjaxRequest request,AjaxResponse response){
		WorksheetUtil.transmit(instanceId);
		response.setAjaxParameter("state", "Y");
		return response;
	}
}
