/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年1月4日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.port.adapter.template.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.doublepoint.common.domain.model.viewmodel.sys.VOMenu;
import cn.doublepoint.common.port.adapter.template.persistence.sys.menu.MenuAdminService;
import cn.doublepoint.common.port.adapter.template.persistence.sys.menu.MenuService;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataPacket;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.domain.model.CommonBeanUtils;
import cn.doublepoint.commonutil.port.adapter.controller.request.BaseRequestController;
import cn.doublepoint.dto.domain.model.entity.sys.SysMenu;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;

@Controller
public class PageController extends BaseRequestController {
	@Resource
	MenuService menuService;
	@Resource
	MenuAdminService menuAdminService;

	// 索引页
	@RequestMapping(value = "sys/index")
	public AjaxResponse hello(AjaxResponse response, @RequestParam(required = false) Boolean isHasRoot) {
		String rooTreeName = "菜单树";
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
		AjaxDataPacket<VOMenu> dataPacket = new AjaxDataPacket<>();
		dataPacket.setDataList(returnMenuList);
		response.setAjaxParameter("dataPacket", dataPacket);
		response.setViewName("sys/index/index.html");
		return response;
	}

	private List<VOMenu> getChildrenMenuList(VOMenu cd) {
		PageInfo pageRequest = new PageInfo(1, 999999);
		List<VOMenu> menuList;
		if (cd == null || cd.getId() == null)
			menuList = CommonBeanUtils.copyTo(menuAdminService.findRootMenu(pageRequest), VOMenu.class);
		else {
			SysMenu query = new SysMenu();
			query.setId(cd.getId());
			menuList = CommonBeanUtils.copyTo(menuAdminService.findChildrenMenu(query, pageRequest), VOMenu.class);
		}
		if (menuList == null) {
			return null;
		} else {
			for (int i = 0; i < menuList.size(); i++) {
				menuList.get(i).setChildrenMenuList(getChildrenMenuList(menuList.get(i)));
			}
		}
		return menuList.stream().map(i -> {
			i.setMenuIndex(i.getId().toString());
			return i;
		}).collect(Collectors.toList());
	}

	@RequestMapping("sys/register/{actionname}")
	public String register(@PathVariable String actionname) {
		return "sys/register/" + actionname + ".html";
	}

	@RequestMapping("sys/test/{actionname}")
	public String test(@PathVariable String actionname) {
		return "sys/test/" + actionname + ".html";
	}

	@RequestMapping("sys/bootstrap/{actionname}")
	public String bootstrap(@PathVariable String actionname) {
		return "sys/bootstrap/" + actionname + ".html";
	}

	@RequestMapping("sys/assistant/{actionname}")
	public String assistant(@PathVariable String actionname) {
		return "sys/assistant/" + actionname + ".html";
	}

	@RequestMapping("sys/config/{actionname}")
	public String config(@PathVariable String actionname) {
		return "sys/config/" + actionname + ".html";
	}

	@RequestMapping("sys/commonpage/{actionname}")
	public String commonpage(@PathVariable String actionname) {
		return "sys/commonpage/" + actionname + ".html";
	}
}
