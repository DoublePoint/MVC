package cn.doublepoint.port.adapter.template.service.xt;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.application.template.xt.XTCDApplicationService;
import cn.doublepoint.application.template.xt.XTCDQueryService;
import cn.doublepoint.domain.model.entity.xt.T_XT_CD;
import cn.doublepoint.domain.model.viewmodel.xt.VT_XT_CD;
import cn.doublepoint.port.adapter.template.persistence.xt.XTCDRepository;

@Controller
@RequestMapping("/template/xt")
public class XTCDController {

	@Resource
	XTCDRepository xtcdRepository;

	@Resource 
	XTCDQueryService  xtcdQueryService;
	
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
	public List<VT_XT_CD> cdDataList() {
		List<VT_XT_CD> xtcdLists=xtcdQueryService.loadXTCD();
		if(xtcdLists==null)
			xtcdLists=new ArrayList<VT_XT_CD>();
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
	public T_XT_CD  add(@RequestBody T_XT_CD cd){
		
		xtcdApplicationService.createXTCD(cd);
		return cd;
	}
}