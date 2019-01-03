/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月22日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.port.adapter.template.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.common.domain.model.viewmodel.sys.VOAdminRole;
import cn.doublepoint.common.port.adapter.template.persistence.sys.admin.AdminRoleService;
import cn.doublepoint.common.port.adapter.template.persistence.sys.admin.AdminService;
import cn.doublepoint.common.port.adapter.template.persistence.sys.role.RoleService;
import cn.doublepoint.commonutil.StringUtil;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataPacket;
import cn.doublepoint.commonutil.ajaxmodel.AjaxRequest;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.annotation.RequestForm;
import cn.doublepoint.commonutil.port.adapter.controller.BaseController;
import cn.doublepoint.dto.domain.model.entity.sys.SysAdmin;
import cn.doublepoint.dto.domain.model.entity.sys.SysAdminRole;
import cn.doublepoint.dto.domain.model.entity.sys.SysRole;

@Controller
@RequestMapping("sys/admin")
public class AdminManagerController extends BaseController{

	@Autowired
	AdminService adminService;
	@Autowired
	AdminRoleService adminRoleService;
	@Autowired
	RoleService roleService;

	@RequestMapping("/")
	public String adminJsp(HttpServletRequest request, AjaxResponse response) {
		return "sys/admin/admin.html";
	}
	@RequestMapping("/{adminId}/detail")
	public AjaxResponse detail(@RequestForm AjaxRequest request,@PathVariable Integer adminId, AjaxResponse response) {
		SysAdmin admin = adminService.getById(adminId);
		AjaxDataPacket<SysAdmin> dataPacket = new AjaxDataPacket<SysAdmin>();
		dataPacket.setData(admin);
		response.setAjaxParameter("dataPacket", dataPacket);
		response.setAjaxParameter("pageType", "modify");
		response.setViewName("sys/admin/detail.html");
		return response;
	}

	@RequestMapping("/bind-role")
	public AjaxResponse adminDialog(@RequestForm AjaxRequest request, AjaxResponse response) {
		AjaxDataPacket<VOAdminRole> dataPacket = new AjaxDataPacket<VOAdminRole>();
		String id = request.getParameter("id");
		List<VOAdminRole> adminRoles = adminRoleService.findRolesByAdminId(Integer.valueOf(id), dataPacket.getPageInfo());
		dataPacket.setDataList(adminRoles);
		response.setViewName("sys/admin/bind-role.html");
		response.setAjaxParameter("roleAdminDataPacket", dataPacket);
		
		AjaxDataPacket<SysRole> roleDataPacket = new AjaxDataPacket<SysRole>();
		List<SysRole> roles = adminRoleService.findRolesNotAdminId(Integer.valueOf(id));
		roleDataPacket.setDataList(roles);
		response.setAjaxParameter("roleDataPacket",roleDataPacket);
		response.setAjaxParameter("adminId", id);
		return response;
	}
	

	@RequestMapping("/{adminId}/admin-role")
	@ResponseBody
	public AjaxResponse saveAdminRole(@PathVariable Integer adminId,@RequestBody AjaxRequest request, AjaxResponse response) {
		AjaxDataPacket<SysAdminRole> dataPacket = request.getAjaxDataPacket("dataPacket", SysAdminRole.class);
		adminRoleService.removeByAdminId(adminId);
		adminRoleService.saveOrUpdate(dataPacket.getDataList());
		return response;
	}

	@RequestMapping("/retrieve")
	@ResponseBody
	public AjaxResponse retrieve(@RequestBody AjaxRequest request, AjaxResponse response) {
		AjaxDataPacket<SysAdmin> dataPacket = request.getAjaxDataPacket("dataPacket", SysAdmin.class);
		SysAdmin query = dataPacket.getData();
		if(query==null)
			query=new SysAdmin();
		if(!StringUtil.isNullOrEmpty(request.getParameter("departmentId"))){
			query.setDepartmentId(Integer.valueOf(request.getParameter("departmentId")));
		}
		List<SysAdmin> resultList = adminService.find(query, dataPacket.getPageInfo());
		dataPacket.setDataList(resultList);
		response.setAjaxParameter("dataPacket", dataPacket);
		response.setViewName("adminDialog");
		return response;
	}

	@RequestMapping("/save")
	@ResponseBody
	public AjaxResponse save(@RequestBody AjaxRequest request, AjaxResponse response) {
		AjaxDataPacket<SysAdmin> addDataPacket = request.getAjaxDataPacket("addDataPacket", SysAdmin.class);
		AjaxDataPacket<SysAdmin> updateDataPacket = request.getAjaxDataPacket("updateDataPacket", SysAdmin.class);
		adminService.saveOrUpdate(addDataPacket.getDataList());
		adminService.saveOrUpdate(updateDataPacket.getDataList());
		return new AjaxResponse();
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public boolean delete(@RequestBody AjaxRequest request, AjaxResponse response) {
		AjaxDataPacket<SysAdmin> dataPacket = request.getAjaxDataPacket("dataPacket", SysAdmin.class);
		if (dataPacket == null)
			return false;
		return adminService.remove(dataPacket.getDataList());
	}

}
