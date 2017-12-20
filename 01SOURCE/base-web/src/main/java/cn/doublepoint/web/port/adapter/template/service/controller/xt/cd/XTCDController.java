package cn.doublepoint.web.port.adapter.template.service.controller.xt.cd;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.doublepoint.base.common.port.adapter.controller.request.BaseRequestController;
import cn.doublepoint.common.application.template.xt.XTCDApplicationService;
import cn.doublepoint.common.application.template.xt.XTCDQueryService;
import cn.doublepoint.common.port.adapter.template.persistence.xt.XTCDRepository;

@Controller
@RequestMapping("/template/xt")
public class XTCDController   implements BaseRequestController{

	@Resource
	XTCDRepository xTCDRepository;

	@Autowired
	XTCDQueryService xTCDQueryService;

	@Resource
	XTCDApplicationService xTCDApplicationService;

	/**
	 * 菜单添加修改弹窗
	 * 
	 * @return 返回系统菜单
	 */
	@RequestMapping("/cd")
	public String cdSave() {
		return "/xt/cd/cd";
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
	/**
	 * 菜单管理
	 * 
	 * @return 返回系统菜单
	 */
	@RequestMapping("/cdTreeController")
	public String cdTree() {
		return "/xt/cd/cdtree";
	}
	
}
