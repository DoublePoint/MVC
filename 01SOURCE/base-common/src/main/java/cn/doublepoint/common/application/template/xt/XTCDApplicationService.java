/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月14日
* 
* 类   说   明 ：查询菜单服务
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.application.template.xt;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.doublepoint.common.domain.model.entity.xt.T_XT_CD;
import cn.doublepoint.common.port.adapter.template.persistence.xt.XTCDRepository;
import cn.doublepoint.common.util.SnowflakeIdWorker;

@Service("xtcdApplicationService")
public class XTCDApplicationService {
	@Resource
	XTCDRepository xtcdRepository;
	
	@Resource
	SnowflakeIdWorker idWorker;
	
	public boolean createXTCD(T_XT_CD t_XT_CD){
		try {
			t_XT_CD.setCdbs(idWorker.nextId());
			t_XT_CD.setCdcj(1);
			xtcdRepository.save(t_XT_CD);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	public boolean removeXTCD(List<T_XT_CD> cdList){
		for (T_XT_CD t_XT_CD : cdList) {
			xtcdRepository.delete(t_XT_CD.getCdbs());
		}
		
		return true;
	}
}
