/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月20日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.web.port.adapter.template.service.controller.sys.menu;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.common.application.template.sys.droplist.ExtendPropertyService;
import cn.doublepoint.common.domain.model.entity.sys.ExtendProperty;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.ajaxmodel.PageInfo;
import cn.doublepoint.commonutil.filter.BodyReaderHttpServletRequestWrapper;
import cn.doublepoint.commonutil.port.adapter.controller.BaseController;

@Controller
@RequestMapping("/template/sys/extendproperty")
public class ExtendPropertyManagementController extends BaseController {

	@Autowired
	ExtendPropertyService service;

	// 菜单页面
	@RequestMapping("/extendproperty")
	public String cd(HttpServletRequest request) {
		return "extendProperty";
	}

	@RequestMapping("/retrieve")
	@ResponseBody
	public AjaxResponse retrieve(BodyReaderHttpServletRequestWrapper request) {
		AjaxDataWrap<ExtendProperty> dataWrap = request.getAjaxDataWrap("dataWrap", ExtendProperty.class);
		if (dataWrap == null)
			return null;
		ExtendProperty menuQuery = null;
		if (dataWrap.getDataList() != null && dataWrap.getDataList().size() > 0) {
			menuQuery = dataWrap.getDataList().get(0);
		}

		if (menuQuery != null) {
			List<ExtendProperty> list = service.find(menuQuery, dataWrap.getPageInfo());
			dataWrap.setDataList(list);
		}

		AjaxResponse ajaxResponse = new AjaxResponse();
		ajaxResponse.setAjaxParameter("dataWrap", dataWrap);
		return ajaxResponse;
	}

	@RequestMapping("/add")
	@ResponseBody
	public AjaxResponse add(BodyReaderHttpServletRequestWrapper request) {
		AjaxDataWrap<ExtendProperty> addDataWrap = request.getAjaxDataWrap("dataWrap", ExtendProperty.class);
		if (addDataWrap == null)
			return null;
		service.saveOrUpdate(addDataWrap.getDataList());
		return new AjaxResponse();
	}

	@RequestMapping("/delete")
	@ResponseBody
	public AjaxResponse delete(BodyReaderHttpServletRequestWrapper request, AjaxResponse responseData) {
		AjaxDataWrap<ExtendProperty> deleteDataWrap = request.getAjaxDataWrap("deleteDataWrap", ExtendProperty.class);
		if (deleteDataWrap == null)
			return null;
		List<ExtendProperty> menuList = deleteDataWrap.getDataList();
		service.remove(menuList);
		responseData.setAjaxParameter("deleteState", true);
		return responseData;
	}
}
