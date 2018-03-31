/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月14日
* 
* 类   说   明 ：查询菜单服务
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.application.template.xt.cd;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.doublepoint.common.constant.XTConstant;
import cn.doublepoint.common.domain.model.entity.xt.Menu;
import cn.doublepoint.common.port.adapter.template.persistence.xt.cd.MenuRepository;
import cn.doublepoint.commonutil.domain.model.SnowflakeIdWorker;
import cn.doublepoint.commonutil.domain.model.StringUtil;

@Service("xtcdApplicationService")
public class MenuApplicationService {
	@Resource
	MenuRepository xtcdRepository;
	
	@Resource
	SnowflakeIdWorker idWorker;
	
	/*@Resource
	BaseRepositoryUtil jpaUtil;	*/
/*	public boolean createMenu0(Menu t_XT_CD){
		try {
			if(StringUtil.isNullOrEmpty(t_XT_CD.getCdbs())){
				t_XT_CD.setCdcj(Integer.valueOf(MenuConstant.TREE_ROOT_NODE_CJ));
			}
			else{
				QMenu query = QMenu.t_XT_CD;
				Predicate predicate=query.cdbs.eq(t_XT_CD.getSjcdbs());
				Menu parentCd=xtcdRepository.findOne(predicate);
				t_XT_CD.setCdcj(parentCd.getCdcj()+1);
			}
			t_XT_CD.setCdbs(idWorker.nextId());
			xtcdRepository.save(t_XT_CD);
		} catch (Exception e) {
			return false;
		}
		return true;
	}*/
	
	public boolean createMenu(Menu t_XT_CD){
		try {
			if(StringUtil.isNullOrEmpty(t_XT_CD.getSjcdbs())){
				t_XT_CD.setCdcj(Integer.valueOf(XTConstant.TREE_ROOT_NODE_CJ));
			}
			else{
				Menu parentCd=xtcdRepository.findOne(t_XT_CD.getSjcdbs());
				t_XT_CD.setCdcj(parentCd.getCdcj()+1);
			}
			t_XT_CD.setCdbs(idWorker.nextId());
			t_XT_CD.setCjsj(new Date());
			xtcdRepository.save(t_XT_CD);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	public boolean removeMenu(List<Menu> cdList){
		xtcdRepository.delete(cdList);
		return true;
	}
}
