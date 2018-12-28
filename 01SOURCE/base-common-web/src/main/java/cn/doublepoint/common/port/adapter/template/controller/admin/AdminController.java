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

import cn.doublepoint.common.port.adapter.template.persistence.sys.login.AdminService;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxRequest;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.port.adapter.controller.BaseController;
import cn.doublepoint.dto.domain.model.entity.sys.SysAdmin;

@Controller
@RequestMapping("sys/SysAdmin")
public class AdminController extends BaseController{

	@Autowired
	AdminService adminService;

	@RequestMapping("/SysAdmin")
	public String adminJsp(HttpServletRequest request, AjaxResponse response) {
		return "SysAdmin.html";
	}

	@RequestMapping("/SysAdmin-dialog")
	public AjaxResponse adminDialog(HttpServletRequest request, AjaxResponse response) {
		String type = request.getParameter("type");
		if ("edit".equals(type)) {
			String id = request.getParameter("id");
			SysAdmin SysAdmin = adminService.getById(Long.valueOf(id));
			response.setAjaxParameter("SysAdmin", SysAdmin);
		}
		response.setAjaxParameter("type", type);
		response.setViewName("adminDialog.html");
		return response;
	}

	@RequestMapping("/retrieve")
	@ResponseBody
	public AjaxResponse retrieve(@RequestBody AjaxRequest request, AjaxResponse response) {
		AjaxDataWrap<SysAdmin> dataWrap = request.getAjaxDataWrap("dataWrap", SysAdmin.class);
		SysAdmin query = dataWrap.getDataList().get(0);
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
