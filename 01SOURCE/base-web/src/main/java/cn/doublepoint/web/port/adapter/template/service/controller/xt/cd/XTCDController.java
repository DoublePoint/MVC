package cn.doublepoint.web.port.adapter.template.service.controller.xt.cd;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.doublepoint.common.application.template.xt.cd.XTCDApplicationService;
import cn.doublepoint.common.application.template.xt.cd.XTCDQueryService;
import cn.doublepoint.commonutil.port.adapter.controller.request.BaseRequestController;

@Controller 
@RequestMapping("")
public class XTCDController extends BaseRequestController{

	@Autowired
	XTCDQueryService xTCDQueryService;

	@Resource
	XTCDApplicationService xTCDApplicationService;

	
}
