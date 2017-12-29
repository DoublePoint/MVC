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

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import cn.doublepoint.common.domain.model.entity.xt.T_XT_CD;
import cn.doublepoint.common.port.adapter.template.persistence.xt.XTCDRepository;
import cn.doublepoint.commonutil.domain.model.SnowflakeIdWorker;
import cn.doublepoint.commonutil.domain.model.StringUtil;
import cn.doublepoint.commonutil.domain.model.XTCDConstant;
import cn.doublepoint.commonutil.port.adapter.persistence.BaseRepositoryUtil;
import cn.doublepoint.jdbc.util.JDBCUtil;

@Service("xtcdApplicationService")
public class XTCDApplicationService {
	@Resource
	XTCDRepository xtcdRepository;
	
	@Resource
	SnowflakeIdWorker idWorker;
	
	@Resource
	BaseRepositoryUtil jpaUtil;	
	public boolean createXTCD0(T_XT_CD t_XT_CD){
		try {
			if(StringUtil.isNullOrEmpty(t_XT_CD.getCdbs())){
				t_XT_CD.setCdcj(Integer.valueOf(XTCDConstant.TREE_ROOT_NODE_CJ));
			}
			else{
				T_XT_CD parentCd=xtcdRepository.findByCdbs(t_XT_CD.getSjcdbs());
				t_XT_CD.setCdcj(parentCd.getCdcj()+1);
			}
			t_XT_CD.setCdbs(idWorker.nextId());
			xtcdRepository.save(t_XT_CD);
//			xtcdRepository.save(new ArrayList<>());
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	public boolean createXTCD(T_XT_CD t_XT_CD){
		
		
		
		try {
			if(StringUtil.isNullOrEmpty(t_XT_CD.getCdbs())){
				t_XT_CD.setCdcj(Integer.valueOf(XTCDConstant.TREE_ROOT_NODE_CJ));
			}
			else{
				T_XT_CD parentCd=xtcdRepository.findByCdbs(t_XT_CD.getSjcdbs());
				t_XT_CD.setCdcj(parentCd.getCdcj()+1);
			}
			t_XT_CD.setCdbs(idWorker.nextId());
			xtcdRepository.save(t_XT_CD);
//			xtcdRepository.saveAll(new ArrayList<>());
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	public boolean removeXTCD(List<T_XT_CD> cdList){
		for (T_XT_CD t_XT_CD : cdList) {
//			xtcdRepository.deleteById(Long.valueOf(t_XT_CD.getCdbs()));
		}
		
		return true;
	}
}
