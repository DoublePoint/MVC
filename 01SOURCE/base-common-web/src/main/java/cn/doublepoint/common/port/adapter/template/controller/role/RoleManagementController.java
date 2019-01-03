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
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataPacket;
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
		AjaxDataPacket<SysMenuRole> dataPacket = new AjaxDataPacket<SysMenuRole>();
		SysMenuRole query = new SysMenuRole();
		query.setRoleId(roleId);
		dataPacket.setDataList(menuRoleService.find(query, null));
		response.setAjaxParameter("dataPacket", dataPacket);
		return response;
	}

	@RequestMapping("/retrieve")
	@ResponseBody
	public AjaxResponse roleDataList(@RequestBody AjaxRequest request, AjaxResponse response) {
		AjaxDataPacket<SysRole> dataPacket = request.getAjaxDataPacket("dataPacket", SysRole.class);
		if (dataPacket == null)
			return null;
		dataPacket.setDataList(roleService.findAll(dataPacket.getPageInfo()));
		response.setAjaxParameter("dataPacket", dataPacket);
		return response;
	}

	@RequestMapping("/save")
	@ResponseBody
	public boolean save(@RequestBody AjaxRequest request, AjaxResponse response) {
		AjaxDataPacket<SysRole> addDataPacket = request.getAjaxDataPacket("addDataPacket", SysRole.class);
		AjaxDataPacket<SysRole> updateDataPacket = request.getAjaxDataPacket("updateDataPacket", SysRole.class);
		roleService.saveOrUpdate(addDataPacket.getDataList());
		roleService.saveOrUpdate(updateDataPacket.getDataList());
		return true;
	}

	@RequestMapping("/{roleId}/binding")
	@ResponseBody
	public boolean bindMenu(@PathVariable Long roleId,@RequestBody AjaxRequest request, AjaxResponse response) {
		AjaxDataPacket<SysMenuRole> dataPacket = request.getAjaxDataPacket("dataPacket", SysMenuRole.class);
		if (dataPacket == null)
			return true;
		List<SysMenuRole> menus = dataPacket.getDataList();
		menuRoleService.saveOrUpdate(menus);
		return true;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public boolean delete(@RequestBody AjaxRequest request, AjaxResponse response) throws Exception {
		AjaxDataPacket<SysRole> dataPacket = request.getAjaxDataPacket("dataPacket", SysRole.class);
		if (dataPacket == null)
			return true;
		roleService.remove(dataPacket.getDataList());
		return true;
	}

}
