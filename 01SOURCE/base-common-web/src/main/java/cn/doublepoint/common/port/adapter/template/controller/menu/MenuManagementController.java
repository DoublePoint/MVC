/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月20日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.port.adapter.template.controller.menu;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.common.port.adapter.template.persistence.sys.menu.MenuService;
import cn.doublepoint.commonutil.StringUtil;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataPacket;
import cn.doublepoint.commonutil.ajaxmodel.AjaxRequest;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.annotation.RequestForm;
import cn.doublepoint.commonutil.port.adapter.controller.BaseController;
import cn.doublepoint.dto.domain.model.entity.sys.SysMenu;

@Controller
@RequestMapping("/sys/menu")
public class MenuManagementController extends BaseController {

	@Autowired
	MenuService menuService;

	// 菜单页面
	@RequestMapping("/")
	public String cd(HttpServletRequest request) {
		return "sys/menu/menu.html";
	}

	@RequestMapping("/menuDialog")
	public AjaxResponse menuDialog(@RequestForm(name = "requestForm") AjaxRequest request,AjaxResponse response) {
		String type=request.getParameter("type");
		if ("edit".equals(type)) {
			AjaxDataPacket<SysMenu> ajaxDataPacket = request.getAjaxDataPacket("dataPacket", SysMenu.class);
			response.setAjaxParameter("dataPacket", ajaxDataPacket);
		} else {
			String parentMenuId = request.getParameter("parentMenuId");
			if (!StringUtil.isNullOrEmpty(parentMenuId))
				response.setAjaxParameter("parentMenuId", parentMenuId);
		}
		response.setAjaxParameter("type", type);
		response.setViewName("sys/menu/menuDialog.html");
		return response;
	}

	@RequestMapping("/getMenuName")
	@ResponseBody
	public String getMenuName(@RequestBody AjaxRequest request) {
		
		String id = request.getParameter("id");
		String menuName = "";
		try {
			SysMenu menu = menuService.getById(Integer.valueOf(id));
			if (menu != null) {
				menuName = menu.getName();
			}
		} catch (Exception e) {

		}
		return menuName;
	}

	@RequestMapping("/retrieve")
	@ResponseBody
	public AjaxResponse retrieve(@RequestBody AjaxRequest request) {
		AjaxDataPacket<SysMenu> dataPacket = request.getAjaxDataPacket("dataPacket", SysMenu.class);
		SysMenu menuQuery = dataPacket.getData();
		if (menuQuery==null) {
			menuQuery=new SysMenu();
		}
		if(!StringUtil.isNullOrEmpty(request.getParameter("parentId"))){
			menuQuery.setId(Integer.valueOf(request.getParameter("parentId")));
		}
		List<SysMenu> list = menuService.findChildrenMenu(menuQuery, dataPacket.getPageInfo());
		dataPacket.setDataList(list);

		AjaxResponse ajaxResponse = new AjaxResponse();
		ajaxResponse.setAjaxParameter("dataPacket", dataPacket);
		return ajaxResponse;
	}

	@RequestMapping("/save")
	@ResponseBody
	public AjaxResponse menuDataListDataPacket(@RequestBody AjaxRequest request) {
		AjaxDataPacket<SysMenu> dataPacket = request.getAjaxDataPacket("dataPacket", SysMenu.class);
		List<SysMenu> list = dataPacket.getDataList();
		menuService.saveOrUpdate(list);
		return new AjaxResponse();
	}

	@RequestMapping("/add")
	@ResponseBody
	public AjaxResponse add(@RequestBody AjaxRequest request) {
		AjaxDataPacket<SysMenu> addDataPacket = request.getAjaxDataPacket("dataPacket", SysMenu.class);
		if (addDataPacket == null)
			return null;
		SysMenu menu = addDataPacket.getData();
		menuService.saveOrUpdate(menu);
		return new AjaxResponse();
	}

	@RequestMapping("/delete")
	@ResponseBody
	public AjaxResponse delete(@RequestBody AjaxRequest request, AjaxResponse responseData) {
		AjaxDataPacket<SysMenu> deleteDataPacket = request.getAjaxDataPacket("dataPacket", SysMenu.class);
		if (deleteDataPacket == null)
			return null;
		List<SysMenu> menuList = deleteDataPacket.getDataList();
		menuService.removeMenu(menuList);
		responseData.setAjaxParameter("deleteState", true);
		return responseData;
	}
}
