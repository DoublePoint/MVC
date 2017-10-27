package cn.doublepoint.port.adapter.template.service.xt;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.common.util.CommonBeanUtils;
import cn.doublepoint.domain.model.entity.xt.T_XT_CD;
import cn.doublepoint.domain.model.viewmodel.xt.VT_XT_CD;
import cn.doublepoint.port.adapter.template.persistence.xt.XTCDRepository;

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
	public List<VT_XT_CD> cdDataList() {
		List<T_XT_CD> xtcdList=xtcdRepository.findRootXTCD();
		
		List<VT_XT_CD> xtcdlists=new ArrayList<VT_XT_CD>();
		for(int i=0;i<xtcdList.size();i++){
			VT_XT_CD vr=new VT_XT_CD();
			BeanUtils.copyProperties(xtcdList.get(i),vr);
			xtcdlists.add(vr);
		}
		xtcdlists=CommonBeanUtils.copyTo(xtcdList, VT_XT_CD.class);
		return xtcdlists;
	}
}
