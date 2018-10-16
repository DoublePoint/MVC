/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月22日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.web.port.adapter.template.service.controller.sys.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.common.port.adapter.template.persistence.sys.login.AdminService;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.filter.BodyReaderHttpServletRequestWrapper;
import cn.doublepoint.commonutil.port.adapter.controller.BaseController;
import cn.doublepoint.template.dto.domain.model.entity.sys.Admin;

@Controller
@RequestMapping("sys/admin")
public class AdminController extends BaseController{

	@Autowired
	AdminService adminService;

	@RequestMapping("/admin")
	public String adminJsp(BodyReaderHttpServletRequestWrapper request, AjaxResponse response) {
		return "admin.html";
	}

	@RequestMapping("/admin-dialog")
	public AjaxResponse adminDialog(BodyReaderHttpServletRequestWrapper request, AjaxResponse response) {
		String type = request.getParameter("type");
		if ("edit".equals(type)) {
			String id = request.getParameter("id");
			Admin admin = adminService.getById(Long.valueOf(id));
			response.setAjaxParameter("admin", admin);
		}
		response.setAjaxParameter("type", type);
		response.setViewName("adminDialog");
		return response;
	}

	@RequestMapping("/retrieve")
	@ResponseBody
	public AjaxResponse retrieve(BodyReaderHttpServletRequestWrapper request, AjaxResponse response) {
		AjaxDataWrap<Admin> dataWrap = request.getAjaxDataWrap("dataWrap", Admin.class);
		Admin query = dataWrap.getDataList().get(0);
		List<Admin> resultList = adminService.find(query, dataWrap.getPageInfo());
		dataWrap.setDataList(resultList);
		response.setAjaxParameter("dataWrap", dataWrap);
		response.setViewName("adminDialog");
		return response;
	}

	@RequestMapping("/save")
	@ResponseBody
	public boolean save(BodyReaderHttpServletRequestWrapper request, AjaxResponse response) {
		AjaxDataWrap<Admin> dataWrap = request.getAjaxDataWrap("dataWrap", Admin.class);
		if (dataWrap == null)
			return false;
		return adminService.saveOrUpdate(dataWrap.getDataList());
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public boolean delete(BodyReaderHttpServletRequestWrapper request, AjaxResponse response) {
		AjaxDataWrap<Admin> dataWrap = request.getAjaxDataWrap("dataWrap", Admin.class);
		if (dataWrap == null)
			return false;
		return adminService.remove(dataWrap.getDataList());
	}

}
