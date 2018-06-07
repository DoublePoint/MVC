/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月20日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.web.port.adapter.template.service.controller.sys.role;

import static java.util.stream.Collectors.toList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.common.port.adapter.template.persistence.sys.role.MenuRoleService;
import cn.doublepoint.common.port.adapter.template.persistence.sys.role.RoleService;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.ajaxmodel.TreeNodeBean;
import cn.doublepoint.commonutil.filter.BodyReaderHttpServletRequestWrapper;
import cn.doublepoint.commonutil.port.adapter.controller.BaseController;
import cn.doublepoint.template.dto.domain.model.entity.sys.MenuRole;
import cn.doublepoint.template.dto.domain.model.entity.sys.Role;

@Controller
@RequestMapping("/template/sys/role")
public class RoleController extends BaseController {

	@Autowired
	RoleService roleService;
	@Autowired
	MenuRoleService menuRoleService;

	@RequestMapping("/{actionname}")
	public String role(@PathVariable String actionname) {
		return actionname;
	}

	@RequestMapping("/bindMenu")
	public AjaxResponse bindMenuJsp(BodyReaderHttpServletRequestWrapper request, AjaxResponse response) {
		String roleId = request.getParameter("roleId");
		response.setViewName("bindMenu");
		response.setAjaxParameter("roleId", roleId);
		AjaxDataWrap<MenuRole> dataWrap = new AjaxDataWrap<MenuRole>();
		MenuRole query = new MenuRole();
		query.setRoleId(Long.valueOf(roleId));
		dataWrap.setDataList(menuRoleService.find(query, null));
		response.setAjaxParameter("dataWrap", dataWrap);
		return response;
	}

	@RequestMapping("/search")
	@ResponseBody
	public AjaxResponse roleDataList(BodyReaderHttpServletRequestWrapper request, AjaxResponse response) {
		AjaxDataWrap<Role> dataWrap = request.getAjaxDataWrap("dataWrap", Role.class);
		if (dataWrap == null)
			return null;
		dataWrap.setDataList(roleService.findAll(dataWrap.getPageInfo()));
		response.setAjaxParameter("dataWrap", dataWrap);
		return response;
	}

	@RequestMapping("/save")
	@ResponseBody
	public boolean save(BodyReaderHttpServletRequestWrapper request, AjaxResponse response) {
		AjaxDataWrap<Role> dataWrap = request.getAjaxDataWrap("dataWrap", Role.class);
		if (dataWrap == null)
			return true;
		roleService.saveOrUpdate(dataWrap.getDataList());
		return true;
	}

	@RequestMapping("/bind-menu")
	@ResponseBody
	public boolean bindMenu(BodyReaderHttpServletRequestWrapper request, AjaxResponse response) {
		AjaxDataWrap<TreeNodeBean> dataWrap = request.getAjaxDataWrap("dataWrap", TreeNodeBean.class);
		String roleId = request.getParameter("roleId");
		if (dataWrap == null)
			return true;
		List<TreeNodeBean> menus = dataWrap.getDataList();
		if (menus == null)
			return false;
		List<MenuRole> list = menus.stream().map(menu -> {
			MenuRole mRole = new MenuRole();
			mRole.setMenuId(Long.valueOf(menu.getCode()));
			mRole.setRoleId(Long.valueOf(roleId));
			return mRole;
		}).collect(toList());
		menuRoleService.saveOrUpdate(list);
		return true;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public boolean delete(BodyReaderHttpServletRequestWrapper request, AjaxResponse response) {
		AjaxDataWrap<Role> dataWrap = request.getAjaxDataWrap("deleteDataWrap", Role.class);
		if (dataWrap == null)
			return true;

		roleService.remove(dataWrap.getDataList());
		return true;
	}

	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public MenuRoleService getMenuRoleService() {
		return menuRoleService;
	}

	public void setMenuRoleService(MenuRoleService menuRoleService) {
		this.menuRoleService = menuRoleService;
	}

}
