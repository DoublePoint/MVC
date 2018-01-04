package cn.doublepoint.web.port.adapter.template.service.controller.xt.cd;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.doublepoint.common.application.template.xt.XTCDApplicationService;
import cn.doublepoint.common.application.template.xt.XTCDQueryService;
import cn.doublepoint.commonutil.port.adapter.controller.request.BaseRequestController;

@Controller
@RequestMapping("/template/xt")
public class XTCDController extends BaseRequestController{

	@Autowired
	XTCDQueryService xTCDQueryService;

	@Resource
	XTCDApplicationService xTCDApplicationService;

	//菜单页面
	@RequestMapping("/cd")
	public String cdSave() {
		return "/xt/cd/cd";
		
	}

	//菜单管理页面
	@RequestMapping("/cd-management")
	public String cdManagement() {
		return "/xt/cd/cdManagement";
	}

	//菜单弹窗
	@RequestMapping("/cd-dialog")
	public String cdDialog() {
		return "/xt/cd/cdDialog";
	}
	
	@RequestMapping("/cd/tree")
	public String cdTree() {
		return "/xt/cd/cdtree";
	}
	
}
