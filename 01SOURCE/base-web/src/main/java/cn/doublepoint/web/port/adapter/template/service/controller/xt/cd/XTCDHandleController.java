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

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.base.common.port.adapter.controller.handle.BaseHandleController;
import cn.doublepoint.common.application.template.xt.XTCDApplicationService;
import cn.doublepoint.common.application.template.xt.XTCDQueryService;
import cn.doublepoint.common.domain.model.AjaxDataWrap;
import cn.doublepoint.common.domain.model.entity.xt.T_XT_CD;
import cn.doublepoint.common.domain.model.viewmodel.xt.VT_XT_CD;
import cn.doublepoint.common.port.adapter.template.persistence.xt.XTCDRepository;

@Controller
@RequestMapping("/template/xt")
public class XTCDHandleController implements BaseHandleController {
	@Resource
	XTCDRepository xTCDRepository;

	@Autowired
	XTCDQueryService xTCDQueryService;

	@Resource
	XTCDApplicationService xTCDApplicationService;
	
	@RequestMapping("/cdDataList")
	@ResponseBody
	public List<VT_XT_CD> cdDataList(@RequestBody(required=false) T_XT_CD cd) {
		List<VT_XT_CD> xtcdLists;
		if(cd==null||cd.getCdbs()==null||"".equals(cd.getCdbs())){
			xtcdLists= xTCDQueryService.findAllXTCD();
		}
		else{
			VT_XT_CD cdQuery=new VT_XT_CD();
			cdQuery.setCdbs(cd.getCdbs());
			xtcdLists=xTCDQueryService.findChildrenXTCD(cdQuery);
		}
		if (xtcdLists == null)
			xtcdLists = new ArrayList<VT_XT_CD>();
		return xtcdLists;
	}
	
	@RequestMapping("/cddatalistajaxdataWrap")
	@ResponseBody
	public AjaxDataWrap<VT_XT_CD> cdDataListDataWrap(@RequestBody(required=false) T_XT_CD cd) {
		List<VT_XT_CD> xtcdLists;
		if(cd==null||cd.getCdbs()==null||"".equals(cd.getCdbs())){
			xtcdLists= xTCDQueryService.findAllXTCD();
		}
		else{
			VT_XT_CD cdQuery=new VT_XT_CD();
			cdQuery.setCdbs(cd.getCdbs());
			xtcdLists=xTCDQueryService.findChildrenXTCD(cdQuery);
		}
		if (xtcdLists == null)
			xtcdLists = new ArrayList<VT_XT_CD>();
		AjaxDataWrap<VT_XT_CD> ajaxDataWrap=new AjaxDataWrap<VT_XT_CD>();
		ajaxDataWrap.setData(xtcdLists);
		ajaxDataWrap.setCode(200);
		return ajaxDataWrap;
	}
	@RequestMapping("/cd/add")
	@ResponseBody
	public T_XT_CD add(@RequestBody T_XT_CD cd) {

		xTCDApplicationService.createXTCD(cd);
		T_XT_CD cd2 = new T_XT_CD();
		return cd2;
	}

	@RequestMapping("/cd/cdDelete")
	@ResponseBody
	public boolean delete(@RequestBody List<T_XT_CD> cdList) {
		xTCDApplicationService.removeXTCD(cdList);
		return true;
	}
}
