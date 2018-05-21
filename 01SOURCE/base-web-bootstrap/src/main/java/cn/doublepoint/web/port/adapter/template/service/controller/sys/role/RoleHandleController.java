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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.common.application.template.sys.role.RoleService;
import cn.doublepoint.common.domain.model.entity.sys.Role;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.filter.BodyReaderHttpServletRequestWrapper;
import cn.doublepoint.commonutil.port.adapter.controller.handle.BaseHandleController;

@Controller
@RequestMapping("/template/sys/role")
public class RoleHandleController extends BaseHandleController {

	@Autowired
	RoleService roleService;
	
	@RequestMapping("/{actionname}")
	public String role(@PathVariable String actionname) {
		return actionname;
	}
	

	@RequestMapping("/search")
	@ResponseBody
	public AjaxResponse roleDataList(BodyReaderHttpServletRequestWrapper request,AjaxResponse response) {
		AjaxDataWrap<Role> dataWrap=request.getAjaxDataWrap("dataWrap", Role.class);
		if(dataWrap==null)
			return null;
		dataWrap.setDataList(roleService.findAll(dataWrap.getPageInfo()));
		response.setAjaxParameter("dataWrap", dataWrap);
		return response;
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public boolean save(BodyReaderHttpServletRequestWrapper request,AjaxResponse response) {
		AjaxDataWrap<Role> dataWrap=request.getAjaxDataWrap("dataWrap", Role.class);
		if(dataWrap==null)
			return true;
		
		roleService.saveOrUpdate(dataWrap.getDataList());
		return true;
	}

	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}
	
}
