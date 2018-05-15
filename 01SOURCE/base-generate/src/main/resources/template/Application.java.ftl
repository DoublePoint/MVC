/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： ${datetime}
 * 
 * 类   说   明 ：Spring Data JPA
 * 
 * 修   改   人：          修   改   日   期：
 */

package cn.doublepoint.common.application.template.sys.?;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.doublepoint.common.constant.XTConstant;
import cn.doublepoint.common.domain.model.entity.sys.Menu;
import cn.doublepoint.common.util.SequenceUtil;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;

@Service(" ${entityModel.applicationClassName}")
public class  ${entityModel.applicationClassName} {


	@Autowired
	MenuQueryService menuQueryService;

	/*
	 * @Resource BaseRepositoryUtil jpaUtil;
	 */
	/*
	 * public boolean createMenu0(Menu t_XT_Menu){ try {
	 * if(StringUtil.isNullOrEmpty(t_XT_Menu.getCdbs())){
	 * t_XT_Menu.setCdcj(Integer.valueOf(MenuConstant.TREE_ROOT_NODE_CJ)); }
	 * else{ QMenu query = QMenu.t_XT_Menu; Predicate
	 * predicate=query.menubs.eq(t_XT_Menu.getSjmenubs()); Menu
	 * parentCd=xtmenuRepository.findOne(predicate);
	 * t_XT_Menu.setCdcj(parentCd.getCdcj()+1); }
	 * t_XT_Menu.setCdbs(idWorker.nextId()); xtmenuRepository.save(t_XT_Menu); }
	 * catch (Exception e) { return false; } return true; }
	 */

	public boolean createMenu(Menu menu) {
		if (menu.getParentId() == null) {
			menu.setLevel(Integer.valueOf(XTConstant.TREE_ROOT_NODE_CJ));
			menu.setParentId(0L);
		} else {
			Menu parentCd = menuQueryService.getById(Long.valueOf(menu.getParentId()));
			menu.setLevel(parentCd.getLevel() + 1);
		}
		if (menu.getId() == null)
			menu.setId(SequenceUtil.getNextVal(Menu.class));
		menu.setCreateTime(new Date());
		JPAUtil.saveOrUpdate(menu);
	
		return true;
	}

	public boolean removeMenu(List<Menu> menuList) {
		menuList.stream().forEach(item -> {
			JPAUtil.remove(item);
		});
		return true;
	}
}
