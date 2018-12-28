/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月20日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.port.adapter.template.controller.role;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.common.port.adapter.template.persistence.sys.role.MenuRoleService;
import cn.doublepoint.common.port.adapter.template.persistence.sys.role.RoleService;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxRequest;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.port.adapter.controller.BaseController;
import cn.doublepoint.dto.domain.model.entity.sys.SysMenuRole;
import cn.doublepoint.dto.domain.model.entity.sys.SysRole;

@Controller
@RequestMapping("sys/role")
public class RoleManagementController extends BaseController {

	@Autowired
	RoleService roleService;
	@Autowired
	MenuRoleService menuRoleService;

	@RequestMapping("/")
	public AjaxResponse role() {
		AjaxResponse response=new AjaxResponse();
		response.setViewName("sys/role/role.html");
		return response;
	}

	@RequestMapping("/{roleId}/bind-menu")
	public AjaxResponse bindMenuJsp(@PathVariable Integer roleId, AjaxResponse response) {
		response.setViewName("/sys/role/bind-menu.html");
		response.setAjaxParameter("roleId", roleId);
		AjaxDataWrap<SysMenuRole> dataWrap = new AjaxDataWrap<SysMenuRole>();
		SysMenuRole query = new SysMenuRole();
		query.setRoleId(roleId);
		dataWrap.setDataList(menuRoleService.find(query, null));
		response.setAjaxParameter("dataWrap", dataWrap);
		return response;
	}

	@RequestMapping("/retrieve")
	@ResponseBody
	public AjaxResponse roleDataList(@RequestBody AjaxRequest request, AjaxResponse response) {
		AjaxDataWrap<SysRole> dataWrap = request.getAjaxDataWrap("dataWrap", SysRole.class);
		if (dataWrap == null)
			return null;
		dataWrap.setDataList(roleService.findAll(dataWrap.getPageInfo()));
		response.setAjaxParameter("dataWrap", dataWrap);
		return response;
	}

	@RequestMapping("/save")
	@ResponseBody
	public boolean save(@RequestBody AjaxRequest request, AjaxResponse response) {
		AjaxDataWrap<SysRole> addDataWrap = request.getAjaxDataWrap("addDataWrap", SysRole.class);
		AjaxDataWrap<SysRole> updateDataWrap = request.getAjaxDataWrap("updateDataWrap", SysRole.class);
		roleService.saveOrUpdate(addDataWrap.getDataList());
		roleService.saveOrUpdate(updateDataWrap.getDataList());
		return true;
	}

	@RequestMapping("/{roleId}/binding")
	@ResponseBody
	public boolean bindMenu(@PathVariable Long roleId,@RequestBody AjaxRequest request, AjaxResponse response) {
		AjaxDataWrap<SysMenuRole> dataWrap = request.getAjaxDataWrap("dataWrap", SysMenuRole.class);
		if (dataWrap == null)
			return true;
		List<SysMenuRole> menus = dataWrap.getDataList();
		menuRoleService.saveOrUpdate(menus);
		return true;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public boolean delete(@RequestBody AjaxRequest request, AjaxResponse response) throws Exception {
		AjaxDataWrap<SysRole> dataWrap = request.getAjaxDataWrap("dataWrap", SysRole.class);
		if (dataWrap == null)
			return true;
		roleService.remove(dataWrap.getDataList());
		return true;
	}

}
