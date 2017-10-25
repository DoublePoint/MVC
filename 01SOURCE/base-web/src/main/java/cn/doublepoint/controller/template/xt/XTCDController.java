package cn.doublepoint.controller.template.xt;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.domain.model.entity.xt.T_XT_CD;
import cn.doublepoint.infrastructure.xt.XTCDRepository;

@Controller
@RequestMapping("/template/xt")
public class XTCDController {

	@Resource
	XTCDRepository xtcdRepository;

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
	public List<T_XT_CD> cdDataList() {
		List<T_XT_CD> xtcdList=xtcdRepository.findAll();
		
		return xtcdList;
	}
}
