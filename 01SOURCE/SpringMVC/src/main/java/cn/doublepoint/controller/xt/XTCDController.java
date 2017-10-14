package cn.doublepoint.controller.xt;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.data.repository.support.Repositories;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.doublepoint.infrastructure.xt.XTCDRepository;

@Controller
@RequestMapping("/xt")
public class XTCDController {
	
	
	@Resource
	XTCDRepository xtcdRepository;
	/**
	 * 获取系统菜单
	 * @return 返回系统菜单
	 */
	@RequestMapping("/cd")
	public String cd(Map<String, Object> model){
		model.put("cd",xtcdRepository.findAll());
		
		return "/xt/cd";
	}
}
