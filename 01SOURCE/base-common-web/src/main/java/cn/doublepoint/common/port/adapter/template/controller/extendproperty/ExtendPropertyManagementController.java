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
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataPacket;
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
		AjaxDataPacket<SysExtendProperty> dataPacket = request.getAjaxDataPacket("dataPacket", SysExtendProperty.class);
		SysExtendProperty menuQuery = dataPacket.getData();
		List<SysExtendProperty> list = service.find(menuQuery, dataPacket.getPageInfo());
		dataPacket.setDataList(list);
		AjaxResponse ajaxResponse = new AjaxResponse();
		ajaxResponse.setAjaxParameter("dataPacket", dataPacket);
		return ajaxResponse;
	}

	@RequestMapping("/save")
	@ResponseBody
	public AjaxResponse add(@RequestBody AjaxRequest request) {
		AjaxDataPacket<SysExtendProperty> addDataPacket = request.getAjaxDataPacket("addDataPacket", SysExtendProperty.class);
		AjaxDataPacket<SysExtendProperty> updateDataPacket = request.getAjaxDataPacket("updateDataPacket", SysExtendProperty.class);
		service.saveOrUpdate(addDataPacket.getDataList());
		service.saveOrUpdate(updateDataPacket.getDataList());
		return new AjaxResponse();
	}

	@RequestMapping("/delete")
	@ResponseBody
	public AjaxResponse delete(@RequestBody AjaxRequest request, AjaxResponse responseData) {
		AjaxDataPacket<SysExtendProperty> deleteDataPacket = request.getAjaxDataPacket("dataPacket", SysExtendProperty.class);
		if (deleteDataPacket == null)
			return null;
		List<SysExtendProperty> menuList = deleteDataPacket.getDataList();
		service.remove(menuList);
		responseData.setAjaxParameter("deleteState", true);
		return responseData;
	}
}
