package cn.doublepoint.web.port.adapter.template.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.common.BaseController;
import cn.doublepoint.common.application.template.xt.XTCDApplicationService;
import cn.doublepoint.common.application.template.xt.XTCDQueryService;
import cn.doublepoint.common.domain.model.entity.xt.T_XT_CD;
import cn.doublepoint.common.domain.model.viewmodel.xt.VT_XT_CD;
import cn.doublepoint.common.port.adapter.template.persistence.xt.XTCDRepository;

@Controller
@RequestMapping("/template/xt")
public class XTCDController   implements BaseController{

	@Resource
	XTCDRepository xTCDRepository;

	@Autowired
	XTCDQueryService xTCDQueryService;

	@Resource
	XTCDApplicationService xtcdApplicationService;

	/**
	 * 菜单添加修改弹窗
	 * 
	 * @return 返回系统菜单
	 */
	@RequestMapping("/cd")
	public String cdSave() {
		return "/xt/cd/cd";
	}

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

	/**
	 * 菜单管理
	 * 
	 * @return 返回系统菜单
	 */
	@RequestMapping("/cd-management")
	public String cdManagement() {
		return "/xt/cd/cdManagement";
	}

	/**
	 * 菜单管理
	 * 
	 * @return 返回系统菜单
	 */
	@RequestMapping("/cdDialog")
	public String cdDialog() {
		return "/xt/cd/cdDialog";
	}

	@RequestMapping("/cd/add")
	@ResponseBody
	public T_XT_CD add(@RequestBody T_XT_CD cd) {

		xtcdApplicationService.createXTCD(cd);
		T_XT_CD cd2 = new T_XT_CD();
		return cd2;
	}

	@RequestMapping("/cd/cdDelete")
	@ResponseBody
	public boolean delete(@RequestBody List<T_XT_CD> cdList) {
		xtcdApplicationService.removeXTCD(cdList);
		return true;
	}
	
}
