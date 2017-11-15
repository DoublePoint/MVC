package cn.doublepoint.port.adapter.template.service.xt;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.fabric.xmlrpc.base.Array;

import cn.doublepoint.application.template.xt.XTCDQueryService;
import cn.doublepoint.domain.model.viewmodel.xt.VT_XT_CD;
import cn.doublepoint.port.adapter.template.persistence.xt.XTCDRepository;

@Controller
@RequestMapping("/template/xt")
public class XTCDController {

	@Resource
	XTCDRepository xtcdRepository;

	@Resource 
	XTCDQueryService  XTCDQueryService;
	/**
	 * 获取系统菜单
	 * 
	 * @return 返回系统菜单
	 */
	@RequestMapping("/cd")
	public String cd(Map<String, Object> model) {
		model.put("cd", xtcdRepository.findAll());
		return "/xt/cd";
	}

	@RequestMapping("/cdDataList")
	@ResponseBody
	public List<VT_XT_CD> cdDataList() {
		List<VT_XT_CD> xtcdLists=XTCDQueryService.loadXTCD();
		if(xtcdLists==null)
			xtcdLists=new ArrayList<VT_XT_CD>();
		return xtcdLists;
	}
}
