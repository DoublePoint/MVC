/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月14日
* 
* 类   说   明 ：查询菜单服务
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.application.template.sys.menu;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;

import com.querydsl.jpa.impl.JPAUtil;

import cn.doublepoint.common.constant.XTConstant;
import cn.doublepoint.common.domain.model.entity.sys.Menu;
import cn.doublepoint.common.port.adapter.template.persistence.sys.menu.MenuRepository;
import cn.doublepoint.commonutil.domain.model.SnowflakeIdWorker;
import cn.doublepoint.commonutil.domain.model.StringUtil;

@Service("menuApplicationService")
public class MenuApplicationService {
	@Resource
	MenuRepository menuRepository;
	
	@Resource
	SnowflakeIdWorker idWorker;
	
	/*@Resource
	BaseRepositoryUtil jpaUtil;	*/
/*	public boolean createMenu0(Menu t_XT_Menu){
		try {
			if(StringUtil.isNullOrEmpty(t_XT_Menu.getCdbs())){
				t_XT_Menu.setCdcj(Integer.valueOf(MenuConstant.TREE_ROOT_NODE_CJ));
			}
			else{
				QMenu query = QMenu.t_XT_Menu;
				Predicate predicate=query.menubs.eq(t_XT_Menu.getSjmenubs());
				Menu parentCd=xtmenuRepository.findOne(predicate);
				t_XT_Menu.setCdcj(parentCd.getCdcj()+1);
			}
			t_XT_Menu.setCdbs(idWorker.nextId());
			xtmenuRepository.save(t_XT_Menu);
		} catch (Exception e) {
			return false;
		}
		return true;
	}*/
	
	public boolean createMenu(Menu menu){
		try {
			if(StringUtil.isNullOrEmpty(menu.getParentId())){
				menu.setLevel(Integer.valueOf(XTConstant.TREE_ROOT_NODE_CJ));
			}
			else{
				Menu parentCd=menuRepository.findOne(menu.getParentId());
				menu.setLevel(parentCd.getLevel()+1);
			}
			if(StringUtil.isNullOrEmpty(menu.getId()))
				menu.setId(idWorker.nextId());
			menu.setCreateTime(new Date());
			menuRepository.save(menu);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	public boolean removeMenu(List<Menu> menuList){
		new cn.doublepoint.commonutil.persitence.jpa.JPAUtil().remove(Menu.class,menuList.get(0).getId());
		return true;
	}
}
