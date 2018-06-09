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

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import cn.doublepoint.common.application.template.sys.woksheet.WorksheetUtil;
import cn.doublepoint.common.port.adapter.template.persistence.sys.workflowtest.AnnouncementChangedService;
import cn.doublepoint.common.port.adapter.template.persistence.sys.worksheet.WorksheetService;
import cn.doublepoint.common.util.SequenceUtil;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.filter.BodyReaderHttpServletRequestWrapper;
import cn.doublepoint.commonutil.port.adapter.controller.BaseController;
import cn.doublepoint.template.dto.domain.model.entity.sys.AnnouncementChanged;
import cn.doublepoint.template.dto.domain.model.entity.sys.Worksheet;

@Controller
@RequestMapping("/template/sys/workflow/announcement")
public class PublishAnnouncementController extends BaseController{
	@Autowired
    private RestTemplate restTemplate;
	@Autowired
	private WorksheetService worksheetService;
	@Autowired
	private AnnouncementChangedService announcementChangedService;
	
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
	
	@RequestMapping("findWorksheet")
	@ResponseBody
	public AjaxResponse findWorksheetAndChange(BodyReaderHttpServletRequestWrapper request,AjaxResponse response){
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
	public AjaxResponse save(BodyReaderHttpServletRequestWrapper request,AjaxResponse response){
		AjaxDataWrap<AnnouncementChanged> annChangedWrap=request.getAjaxDataWrap("annChangedWrap",AnnouncementChanged.class);
		
		Worksheet worksheet=new Worksheet();
		String worksheetNo=WorksheetUtil.createAndStart(worksheet.getClassification(), "liulei", worksheet.getDescription());
		
		AnnouncementChanged changed=annChangedWrap.getData();
		changed.setWorksheetNo(worksheetNo);
		announcementChangedService.saveOrUpdate(changed);
		response.setAjaxParameter("worksheetNo", worksheetNo);
		return response;
	}
}
