/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年11月18日
* 
* 类   说   明 ：菜单树
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.port.adapter.template.controller.menu;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.common.domain.model.viewmodel.sys.VOMenu;
import cn.doublepoint.common.port.adapter.template.persistence.sys.menu.MenuService;
import cn.doublepoint.commonutil.domain.model.CommonBeanUtil;
import cn.doublepoint.commonutil.port.adapter.controller.request.BaseTreeController;
import cn.doublepoint.dto.domain.model.entity.sys.SysMenu;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;

@Controller
@RequestMapping("/sys")
public class MenuDisplayController extends BaseTreeController {
	// 树根名称
	private final String rooTreeName = "菜单树";

	@Resource
	MenuService menuService;

	@RequestMapping("/menu/display")
	@ResponseBody
	public List<VOMenu> getMenuTree(@RequestParam(required = false) Boolean isHasRoot) {
		List<VOMenu> returnMenuList;
		if (isHasRoot != null && isHasRoot.booleanValue()) {
			VOMenu rootCd = new VOMenu();
			rootCd.setName(rooTreeName);
			returnMenuList = new ArrayList<VOMenu>();
			List<VOMenu> childrenMenuList = getChildrenMenuList(null);
			rootCd.setChildrenMenuList(childrenMenuList);
			returnMenuList.add(rootCd);
		} else {
			returnMenuList = getChildrenMenuList(null);
		}
		return returnMenuList;
	}

	
	private List<VOMenu> getChildrenMenuList(VOMenu cd) {
		PageInfo pageRequest = new PageInfo(1, 999999);
		List<VOMenu> menuList;
		if (cd == null||cd.getId()==null)
			menuList = CommonBeanUtil.copyTo(menuService.findRootMenu(pageRequest), VOMenu.class);
		else{
			SysMenu query=new SysMenu();
			query.setId(cd.getId());
			menuList = CommonBeanUtil.copyTo(menuService.findChildrenMenu(query, pageRequest), VOMenu.class);
		}
		if (menuList == null) {
			return null;
		} else {
			for (int i = 0; i < menuList.size(); i++) {
				menuList.get(i).setChildrenMenuList(getChildrenMenuList(menuList.get(i)));
			}
		}
		return menuList;
	}
}