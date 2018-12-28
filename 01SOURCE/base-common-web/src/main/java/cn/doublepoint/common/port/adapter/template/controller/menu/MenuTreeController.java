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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.common.domain.model.viewmodel.sys.VOMenu;
import cn.doublepoint.common.port.adapter.template.persistence.sys.menu.MenuService;
import cn.doublepoint.commonutil.ajaxmodel.TreeNodeBean;
import cn.doublepoint.commonutil.domain.model.CommonBeanUtils;
import cn.doublepoint.commonutil.port.adapter.controller.request.BaseTreeController;
import cn.doublepoint.dto.domain.model.entity.sys.SysMenu;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;

@Controller
@RequestMapping("sys")
public class MenuTreeController extends BaseTreeController {

	@Resource
	MenuService menuService;
	
	@RequestMapping("/menu/label")
	@ResponseBody
	public String getMenuTree(@RequestParam(required=true)String code) {
		try{
			SysMenu menu = menuService.getById(Long.valueOf(code));
			return menu.getName();
		}
		catch(Exception e){
			return code;
		}
	}

	@RequestMapping("/menu-tree/menus")
	@ResponseBody
	public List<TreeNodeBean> getMenuTree(@RequestBody(required=false)TreeNodeBean node,
			@RequestParam(required = false) Boolean isHasRoot) {
		Integer code=null;
		if(node!=null&&node.getCode()!=null)
			code=Integer.valueOf(node.getCode());
		List<TreeNodeBean> returnMenuList2 = new ArrayList<TreeNodeBean>();
		if (code==null) {
			List<VOMenu> menus = getChildrenMenuList(0);
			returnMenuList2 = menus.stream().map(menu -> {
				TreeNodeBean nodeBean = new TreeNodeBean();
				nodeBean.setName(menu.getName());
				if (!isHasChild(menu.getId()))
					nodeBean.setIsLeaf(true);
				else {
					nodeBean.setIsLeaf(false);
				}
				nodeBean.setCode(String.valueOf(menu.getId()));
				nodeBean.setNodeBean(menu);
				return nodeBean;
			}).collect(java.util.stream.Collectors.toList());
		} else {
			List<VOMenu> menus = getChildrenMenuList(code);
			returnMenuList2 = menus.stream().map(menu -> {
				TreeNodeBean nodeBean = new TreeNodeBean();
				nodeBean.setName(menu.getName());
				if (!isHasChild(menu.getId()))
					nodeBean.setIsLeaf(true);
				else {
					nodeBean.setIsLeaf(false);
				}
				nodeBean.setCode(String.valueOf(menu.getId()));
				nodeBean.setNodeBean(menu);
				return nodeBean;
			}).collect(java.util.stream.Collectors.toList());
		}
		return returnMenuList2;
	}

	private boolean isHasChild(Integer id) {
		return menuService.getChildrenCount(id) > 0;
	}

	private List<VOMenu> getChildrenMenuList(Integer id) {
		PageInfo pageRequest = new PageInfo(1, 999999);
		List<VOMenu> menuList;
		SysMenu query = new SysMenu();
		query.setId(id);
		menuList = CommonBeanUtils.copyTo(menuService.findChildrenMenu(query, pageRequest), VOMenu.class);
		return menuList;
	}
}
