/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年11月18日
* 
* 类   说   明 ：菜单树
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.port.adapter.template.controller.role;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.common.domain.model.viewmodel.sys.VOMenu;
import cn.doublepoint.common.domain.model.viewmodel.sys.VOMenuRole;
import cn.doublepoint.common.port.adapter.template.persistence.sys.menu.MenuService;
import cn.doublepoint.common.port.adapter.template.persistence.sys.role.MenuRoleService;
import cn.doublepoint.commonutil.ajaxmodel.TreeNodeBean;
import cn.doublepoint.commonutil.domain.model.CommonBeanUtils;
import cn.doublepoint.commonutil.port.adapter.controller.request.BaseTreeController;
import cn.doublepoint.dto.domain.model.entity.sys.Menu;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;

@Controller
@RequestMapping("sys")
public class MenuRoleTreeController extends BaseTreeController {

	@Resource
	MenuService menuService;
	@Resource
	MenuRoleService menuRoleService;
	
	@RequestMapping("/menu-tree/menu-role")
	@ResponseBody
	public List<TreeNodeBean> getMenuTree(@RequestBody(required=false)TreeNodeBean node,
			@RequestParam(required = false) Boolean isHasRoot,
			@RequestParam Long roleId) {
		Long code=null;
		if(node!=null&&node.getCode()!=null)
			code=Long.valueOf(node.getCode());
		List<TreeNodeBean> returnMenuList2 = new ArrayList<TreeNodeBean>();
		if (code==null) {
			List<VOMenuRole> menus = getChildrenMenuRoleList(roleId,0L);
			returnMenuList2 = menus.stream().map(menu -> {
				TreeNodeBean nodeBean = new TreeNodeBean();
				nodeBean.setName(menu.getMenuName());
				if (!isHasChild(menu.getMenuId()))
					nodeBean.setIsLeaf(true);
				else {
					nodeBean.setIsLeaf(false);
				}
				nodeBean.setCode(String.valueOf(menu.getMenuId()));
				nodeBean.setNodeBean(menu);
				return nodeBean;
			}).collect(java.util.stream.Collectors.toList());
		} else {
			List<VOMenuRole> menus = getChildrenMenuRoleList(roleId,code);
			returnMenuList2 = menus.stream().map(menu -> {
				TreeNodeBean nodeBean = new TreeNodeBean();
				nodeBean.setName(menu.getMenuName());
				if (!isHasChild(menu.getMenuId()))
					nodeBean.setIsLeaf(true);
				else {
					nodeBean.setIsLeaf(false);
				}
				nodeBean.setCode(String.valueOf(menu.getMenuId()));
				nodeBean.setNodeBean(menu);
				return nodeBean;
			}).collect(java.util.stream.Collectors.toList());
		}
		return returnMenuList2;
	}

	private boolean isHasChild(Long id) {
		return menuService.getChildrenCount(id) > 0;
	}

	private List<VOMenuRole> getChildrenMenuRoleList(Long roleId,Long parentMenuId) {
		Menu query = new Menu();
		query.setId(parentMenuId);
		return menuRoleService.findChildrenMenuRole(roleId, query);
	}
}
