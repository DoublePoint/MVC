package cn.doublepoint.application.template.xt;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.doublepoint.domain.model.entity.xt.T_XT_CD;
import cn.doublepoint.port.adapter.template.persistence.xt.XTCDRepository;

/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月14日
* 
* 类   说   明 ：查询菜单服务
* 
* 修   改   人：          修   改   日   期：
*/ 
@Service
public class XTCDQueryService {
	
	@Resource
	XTCDRepository xtcdRepository;
	
	/**
	 * 查询最底层菜单
	 */
	public void findRootXTCD(){
		List<T_XT_CD> xtcdList=xtcdRepository.findRootXTCD();
	}
}
