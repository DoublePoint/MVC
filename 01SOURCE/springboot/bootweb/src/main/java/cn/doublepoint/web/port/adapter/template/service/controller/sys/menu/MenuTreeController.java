/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年11月18日
* 
* 类   说   明 ：菜单树
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.web.port.adapter.template.service.controller.sys.menu;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.common.domain.model.viewmodel.sys.VOMenu;
import cn.doublepoint.common.port.adapter.template.persistence.sys.menu.MenuService;
import cn.doublepoint.commonutil.StringUtil;
import cn.doublepoint.commonutil.ajaxmodel.PageInfo;
import cn.doublepoint.commonutil.ajaxmodel.TreeNodeBean;
import cn.doublepoint.commonutil.domain.model.CommonBeanUtils;
import cn.doublepoint.commonutil.filter.BodyReaderHttpServletRequestWrapper;
import cn.doublepoint.commonutil.port.adapter.controller.request.BaseTreeController;
import cn.doublepoint.template.dto.domain.model.entity.sys.Menu;

@Controller
@RequestMapping("/template/sys")
public class MenuTreeController extends BaseTreeController {
	// 树根名称
	private final String rooTreeName = "菜单树";

	@Resource
	MenuService menuService;

	@RequestMapping("/menu/menu-tree/datalist")
	@ResponseBody
	public List<TreeNodeBean> getMenuTree(BodyReaderHttpServletRequestWrapper request, @RequestParam(required = false) Boolean isHasRoot) {
		List<TreeNodeBean> returnMenuList2 = new ArrayList<TreeNodeBean>();
		String codeStr=request.getParameter("code");
		if (StringUtil.isNullOrEmpty(codeStr)) {
			if (isHasRoot != null && isHasRoot.booleanValue()) {
				TreeNodeBean treeNode = new TreeNodeBean();
				treeNode.setName(rooTreeName);
				treeNode.setCode("0");
				treeNode.setIsParent(true);
				returnMenuList2.add(treeNode);
			}
			else{
				List<VOMenu> menus = getChildrenMenuList(0L);
				returnMenuList2 = menus.stream().map(menu -> {
					TreeNodeBean nodeBean = new TreeNodeBean();
					nodeBean.setName(menu.getName());
					if(!isHasChild(menu.getId()))
						nodeBean.setIsParent(false);
					nodeBean.setCode(String.valueOf(menu.getId()));
					return nodeBean;
				}).collect(java.util.stream.Collectors.toList());
			}
		} else {
			Long code=Long.valueOf(codeStr);
			List<VOMenu> menus = getChildrenMenuList(code);
			returnMenuList2 = menus.stream().map(menu -> {
				TreeNodeBean nodeBean = new TreeNodeBean();
				nodeBean.setName(menu.getName());
				if(!isHasChild(menu.getId()))
					nodeBean.setIsParent(false);
				nodeBean.setCode(String.valueOf(menu.getId()));
				return nodeBean;
			}).collect(java.util.stream.Collectors.toList());
		}
		return returnMenuList2;
	}

	private boolean isHasChild(Long id){
		return menuService.getChildrenCount(id)>0;
	}
	
	private List<VOMenu> getChildrenMenuList(Long id) {
		PageInfo pageRequest = new PageInfo(1, 999999);
		List<VOMenu> menuList;
		Menu query = new Menu();
		query.setId(id);
		menuList = CommonBeanUtils.copyTo(menuService.findChildrenMenu(query, pageRequest), VOMenu.class);
		return menuList;
	}
}
