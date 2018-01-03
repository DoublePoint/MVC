/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月20日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.web.port.adapter.template.service.controller.xt.cd;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import cn.doublepoint.common.application.template.xt.XTCDApplicationService;
import cn.doublepoint.common.application.template.xt.XTCDQueryService;
import cn.doublepoint.common.domain.model.entity.xt.T_XT_CD;
import cn.doublepoint.common.domain.model.viewmodel.xt.VT_XT_CD;
import cn.doublepoint.commonutil.domain.model.AjaxDataWrap;
import cn.doublepoint.commonutil.domain.model.PageInfo;
import cn.doublepoint.commonutil.port.adapter.controller.handle.BaseHandleController;

@Controller
@RequestMapping("/template/xt/cd")
public class XTCDHandleController implements BaseHandleController {

	@Autowired
	XTCDQueryService xTCDQueryService;

	@Resource
	XTCDApplicationService xTCDApplicationService;
	
	@RequestMapping("/datalist")
	@ResponseBody
	public AjaxDataWrap<VT_XT_CD> cdDataList(@RequestBody(required=false) AjaxDataWrap<VT_XT_CD> dataWrap) {
		VT_XT_CD cd=null;
		if(dataWrap!=null){
			if(dataWrap.getDataList()!=null&&dataWrap.getDataList().size()>0){
				cd=dataWrap.getDataList().get(0);
			}
		}
		else{
			dataWrap=new AjaxDataWrap<VT_XT_CD>();
			dataWrap.getPageInfo().setPageSize(20);
		}
		if(cd==null||cd.getCdbs()==null||"".equals(cd.getCdbs())){
			dataWrap= xTCDQueryService.findAllXTCD(dataWrap.getPageInfo());
		}
		else{
			VT_XT_CD cdQuery=new VT_XT_CD();
			cdQuery.setCdbs(cd.getCdbs());
			dataWrap=xTCDQueryService.findChildrenXTCD(cdQuery,dataWrap.getPageInfo());
		}
		if (dataWrap == null)
			dataWrap = new AjaxDataWrap<VT_XT_CD>();
		return dataWrap;
	}
	
	
	@RequestMapping("/datalistajaxdatawrap")
	@ResponseBody
	public AjaxDataWrap<VT_XT_CD> cdDataListDataWrap(@RequestBody(required=false) T_XT_CD cd) {
		PageInfo pageRequest=new PageInfo(1, 20);
		AjaxDataWrap<VT_XT_CD> ajaxDataWrap=new AjaxDataWrap<VT_XT_CD>();
		if(cd==null||cd.getCdbs()==null||"".equals(cd.getCdbs())){
			ajaxDataWrap= xTCDQueryService.findAllXTCD(pageRequest);
		}
		else{
			VT_XT_CD cdQuery=new VT_XT_CD();
			cdQuery.setCdbs(cd.getCdbs());
			ajaxDataWrap=xTCDQueryService.findChildrenXTCD(cdQuery,pageRequest);
		}
//		AjaxDataWrap<VT_XT_CD> ajaxDataWrap=new AjaxDataWrap<VT_XT_CD>();
//		ajaxDataWrap.setData(xtcdLists);
//		Pager pager=new Pager();
//		pager.setCurrentPageNum(1);
//		pager.setPageCount(4);
//		pager.setPageSize(2);
//		pager.setTotalCount(5000);
//		ajaxDataWrap.setPager(pager);
//		ajaxDataWrap.setCode(200);
		ObjectMapper mapper = new ObjectMapper();  
		 try {
			String jsonStr = mapper.writeValueAsString(ajaxDataWrap);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}  
		return ajaxDataWrap;
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public T_XT_CD add(@RequestBody T_XT_CD cd) {

		xTCDApplicationService.createXTCD(cd);
		T_XT_CD cd2 = new T_XT_CD();
		return cd2;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public boolean delete(@RequestBody List<T_XT_CD> cdList) {
		xTCDApplicationService.removeXTCD(cdList);
		return true;
	}
}
