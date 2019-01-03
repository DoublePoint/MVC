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

import cn.doublepoint.commonutil.ajaxmodel.AjaxDataPacket;
import cn.doublepoint.commonutil.ajaxmodel.AjaxRequest;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.port.adapter.controller.BaseController;
import cn.doublepoint.dto.domain.model.entity.sys.SysAnnouncementChanged;
import cn.doublepoint.dto.domain.model.entity.sys.SysWorksheet;
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
		SysWorksheet worksheet=worksheetService.getByWorksheetNo(worksheetNo);
		AjaxDataPacket<SysWorksheet> worksheetPacket=new AjaxDataPacket<>();
		worksheetPacket.setData(worksheet);
		
		AjaxDataPacket<SysAnnouncementChanged> annChangedPacket=new AjaxDataPacket<SysAnnouncementChanged>();
		
		SysAnnouncementChanged query=new SysAnnouncementChanged();
		query.setWorksheetNo(worksheetNo);
		List<SysAnnouncementChanged> list=announcementChangedService.find(query, null);
		if(list!=null&&list.size()>0){
			annChangedPacket.setData(list.get(0));
			response.setAjaxParameter("annChangedPacket", annChangedPacket);
		}
		return response;
	}
	
	@RequestMapping("save")
	@ResponseBody
	public AjaxResponse save(@RequestBody AjaxRequest request,AjaxResponse response){
		AjaxDataPacket<SysAnnouncementChanged> annChangedPacket=request.getAjaxDataPacket("annChangedPacket",SysAnnouncementChanged.class);
		
		SysWorksheet worksheet=new SysWorksheet();
		worksheet.setClassification(WorkflowConstant.WORKFLOW_CLASSIFICATION);
		String worksheetNo=WorksheetUtil.createAndStart(worksheet.getClassification(), 123, worksheet.getDescription());
		
		SysAnnouncementChanged changed=annChangedPacket.getData();
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
