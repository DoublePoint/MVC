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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.common.port.adapter.template.persistence.sys.admin.AdminRoleService;
import cn.doublepoint.common.port.adapter.template.persistence.sys.admin.AdminService;
import cn.doublepoint.common.port.adapter.template.persistence.sys.role.RoleService;
import cn.doublepoint.commonutil.StringUtil;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
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

	@RequestMapping("/bind-role")
	public AjaxResponse adminDialog(@RequestForm AjaxRequest request, AjaxResponse response) {
		AjaxDataWrap<SysAdminRole> dataWrap = new AjaxDataWrap<SysAdminRole>();
		String id = request.getParameter("id");
		List<SysAdminRole> adminRoles = adminRoleService.findRolesByAdminId(Integer.valueOf(id), dataWrap.getPageInfo());
		dataWrap.setDataList(adminRoles);
		response.setViewName("sys/admin/bind-role.html");
		response.setAjaxParameter("roleAdminDataWrap", dataWrap);
		
		AjaxDataWrap<SysRole> roleDataWrap = new AjaxDataWrap<SysRole>();
		List<SysRole> roles = roleService.findAll(null);
		roleDataWrap.setDataList(roles);
		response.setAjaxParameter("roleDataWrap",roleDataWrap);
		return response;
	}

	@RequestMapping("/retrieve")
	@ResponseBody
	public AjaxResponse retrieve(@RequestBody AjaxRequest request, AjaxResponse response) {
		AjaxDataWrap<SysAdmin> dataWrap = request.getAjaxDataWrap("dataWrap", SysAdmin.class);
		SysAdmin query = dataWrap.getData();
		if(!StringUtil.isNullOrEmpty(request.getParameter("departmentId"))){
			query.setDepartmentId(Integer.valueOf(request.getParameter("departmentId")));
		}
		List<SysAdmin> resultList = adminService.find(query, dataWrap.getPageInfo());
		dataWrap.setDataList(resultList);
		response.setAjaxParameter("dataWrap", dataWrap);
		response.setViewName("adminDialog");
		return response;
	}

	@RequestMapping("/save")
	@ResponseBody
	public boolean save(@RequestBody AjaxRequest request, AjaxResponse response) {
		AjaxDataWrap<SysAdmin> dataWrap = request.getAjaxDataWrap("dataWrap", SysAdmin.class);
		if (dataWrap == null)
			return false;
		return adminService.saveOrUpdate(dataWrap.getDataList());
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public boolean delete(@RequestBody AjaxRequest request, AjaxResponse response) {
		AjaxDataWrap<SysAdmin> dataWrap = request.getAjaxDataWrap("dataWrap", SysAdmin.class);
		if (dataWrap == null)
			return false;
		return adminService.remove(dataWrap.getDataList());
	}

}
