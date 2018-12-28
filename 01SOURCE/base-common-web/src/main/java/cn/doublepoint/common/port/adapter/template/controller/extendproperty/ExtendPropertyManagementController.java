/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月20日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.port.adapter.template.controller.extendproperty;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.common.port.adapter.template.persistence.sys.droplist.ExtendPropertyService;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxRequest;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.port.adapter.controller.BaseController;
import cn.doublepoint.dto.domain.model.entity.sys.SysExtendProperty;

@Controller
@RequestMapping("sys/extendproperty")
public class ExtendPropertyManagementController extends BaseController {

	@Autowired
	ExtendPropertyService service;

	// 菜单页面
	@RequestMapping("/")
	public String cd(HttpServletRequest request) {
		return "sys/extendproperty/extendProperty.html";
	}

	@RequestMapping("/retrieve")
	@ResponseBody
	public AjaxResponse retrieve(@RequestBody AjaxRequest request) {
		AjaxDataWrap<SysExtendProperty> dataWrap = request.getAjaxDataWrap("dataWrap", SysExtendProperty.class);
		SysExtendProperty menuQuery = dataWrap.getData();
		List<SysExtendProperty> list = service.find(menuQuery, dataWrap.getPageInfo());
		dataWrap.setDataList(list);
		AjaxResponse ajaxResponse = new AjaxResponse();
		ajaxResponse.setAjaxParameter("dataWrap", dataWrap);
		return ajaxResponse;
	}

	@RequestMapping("/save")
	@ResponseBody
	public AjaxResponse add(@RequestBody AjaxRequest request) {
		AjaxDataWrap<SysExtendProperty> addDataWrap = request.getAjaxDataWrap("addDataWrap", SysExtendProperty.class);
		AjaxDataWrap<SysExtendProperty> updateDataWrap = request.getAjaxDataWrap("updateDataWrap", SysExtendProperty.class);
		service.saveOrUpdate(addDataWrap.getDataList());
		service.saveOrUpdate(updateDataWrap.getDataList());
		return new AjaxResponse();
	}

	@RequestMapping("/delete")
	@ResponseBody
	public AjaxResponse delete(@RequestBody AjaxRequest request, AjaxResponse responseData) {
		AjaxDataWrap<SysExtendProperty> deleteDataWrap = request.getAjaxDataWrap("dataWrap", SysExtendProperty.class);
		if (deleteDataWrap == null)
			return null;
		List<SysExtendProperty> menuList = deleteDataWrap.getDataList();
		service.remove(menuList);
		responseData.setAjaxParameter("deleteState", true);
		return responseData;
	}
}
