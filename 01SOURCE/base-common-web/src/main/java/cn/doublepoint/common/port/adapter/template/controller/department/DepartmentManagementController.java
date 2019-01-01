/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年12月31日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.port.adapter.template.controller.department;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.common.port.adapter.template.persistence.sys.department.DepartmentService;
import cn.doublepoint.commonutil.StringUtil;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxRequest;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.annotation.RequestForm;
import cn.doublepoint.commonutil.port.adapter.controller.BaseController;
import cn.doublepoint.dto.domain.model.entity.sys.SysCode;
import cn.doublepoint.dto.domain.model.entity.sys.SysDepartment;
import cn.doublepoint.dto.domain.model.entity.sys.SysMenu;

@Controller
@RequestMapping("/sys/department")
public class DepartmentManagementController extends BaseController {

	@Autowired
	DepartmentService departmentService;

	// 菜单页面
	@RequestMapping("/")
	public String cd(HttpServletRequest request) {
		return "sys/department/department.html";
	}

	@RequestMapping("/departmentDialog")
	public AjaxResponse departmentDialog(@RequestForm(name = "requestForm") AjaxRequest request,AjaxResponse response) {
		String type=request.getParameter("type");
		if ("edit".equals(type)) {
			AjaxDataWrap<SysDepartment> ajaxDataWrap = request.getAjaxDataWrap("dataWrap", SysDepartment.class);
			response.setAjaxParameter("dataWrap", ajaxDataWrap);
		} else {
			String parentDepartmentId = request.getParameter("parentDepartmentId");
			if (!StringUtil.isNullOrEmpty(parentDepartmentId))
				response.setAjaxParameter("parentDepartmentId", parentDepartmentId);
		}
		response.setAjaxParameter("type", type);
		response.setViewName("sys/department/departmentDialog.html");
		return response;
	}

	@RequestMapping("/getDepartmentName")
	@ResponseBody
	public String getDepartmentName(@RequestBody AjaxRequest request) {
		
		String id = request.getParameter("id");
		String departmentName = "";
		try {
			SysDepartment department = departmentService.getById(Integer.valueOf(id));
			if (department != null) {
				departmentName = department.getName();
			}
		} catch (Exception e) {

		}
		return departmentName;
	}
	

	@RequestMapping("/retrieve")
	@ResponseBody
	public AjaxResponse retrieve(@RequestBody AjaxRequest request) {
		AjaxDataWrap<SysDepartment> dataWrap = request.getAjaxDataWrap("dataWrap", SysDepartment.class);
		SysDepartment departmentQuery = dataWrap.getData();
		if (departmentQuery==null) {
			departmentQuery=new SysDepartment();
		}
		if(!StringUtil.isNullOrEmpty(request.getParameter("parentId"))){
			departmentQuery.setId(Integer.valueOf(request.getParameter("parentId")));
		}
		List<SysDepartment> list = departmentService.findChildrenDepartment(departmentQuery, dataWrap.getPageInfo());
		dataWrap.setDataList(list);

		AjaxResponse ajaxResponse = new AjaxResponse();
		ajaxResponse.setAjaxParameter("dataWrap", dataWrap);
		return ajaxResponse;
	}

	@RequestMapping("/save")
	@ResponseBody
	public AjaxResponse save(@RequestBody AjaxRequest request) {
		AjaxDataWrap<SysDepartment> addDataWrap = request.getAjaxDataWrap("addDataWrap", SysDepartment.class);
		AjaxDataWrap<SysDepartment> updateDataWrap = request.getAjaxDataWrap("updateDataWrap", SysDepartment.class);
		departmentService.saveOrUpdate(addDataWrap.getDataList());
		departmentService.saveOrUpdate(updateDataWrap.getDataList());
		return new AjaxResponse();
	}

	@RequestMapping("/add")
	@ResponseBody
	public AjaxResponse add(@RequestBody AjaxRequest request) {
		AjaxDataWrap<SysDepartment> addDataWrap = request.getAjaxDataWrap("dataWrap", SysDepartment.class);
		if (addDataWrap == null)
			return null;
		SysDepartment department = addDataWrap.getData();
		departmentService.saveOrUpdate(department);
		return new AjaxResponse();
	}

	@RequestMapping("/delete")
	@ResponseBody
	public AjaxResponse delete(@RequestBody AjaxRequest request, AjaxResponse responseData) {
		AjaxDataWrap<SysDepartment> deleteDataWrap = request.getAjaxDataWrap("dataWrap", SysDepartment.class);
		if (deleteDataWrap == null)
			return null;
		List<SysDepartment> departmentList = deleteDataWrap.getDataList();
		departmentService.removeDepartment(departmentList);
		responseData.setAjaxParameter("deleteState", true);
		return responseData;
	}
}
