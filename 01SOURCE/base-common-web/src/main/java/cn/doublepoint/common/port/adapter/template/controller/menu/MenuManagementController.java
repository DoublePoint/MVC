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
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxRequest;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.annotation.RequestForm;
import cn.doublepoint.commonutil.port.adapter.controller.BaseController;
import cn.doublepoint.dto.domain.model.entity.sys.Menu;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;

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
/*	public AjaxResponse menuDialog(@RequestBody AjaxRequest request, ModelAndView modelAndView,
			AjaxResponse response) {*/
	public AjaxResponse menuDialog(@RequestForm(name = "requestForm") AjaxRequest request,AjaxResponse response) {
		String type=request.getParameter("type");
		if ("edit".equals(type)) {
			AjaxDataWrap<Menu> ajaxDataWrap = request.getAjaxDataWrap("dataWrap", Menu.class);
			response.setAjaxParameter("dataWrap", ajaxDataWrap);
		} else {
			String parentMenuId = request.getParameter("parentMenuId");
			if (!StringUtil.isNullOrEmpty(parentMenuId))
				response.setAjaxParameter("parentMenuId", parentMenuId);
			response.setAjaxParameter("type", type);
		}
		response.setViewName("sys/menu/menuDialog.html");
		return response;
	}

	@RequestMapping("/getMenuName")
	@ResponseBody
	public String getMenuName(@RequestBody AjaxRequest request) {
		
		String id = request.getParameter("id");
		String menuName = "";
		try {
			Menu menu = menuService.getById(Long.valueOf(id));
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
		AjaxDataWrap<Menu> dataWrap = request.getAjaxDataWrap("dataWrap", Menu.class);
		Menu menuQuery = dataWrap.getData();
		if (menuQuery==null) {
			menuQuery=new Menu();
		}
		if(!StringUtil.isNullOrEmpty(request.getParameter("parentId"))){
			menuQuery.setId(Long.valueOf(request.getParameter("parentId")));
		}
		List<Menu> list = menuService.findChildrenMenu(menuQuery, dataWrap.getPageInfo());
		dataWrap.setDataList(list);

		AjaxResponse ajaxResponse = new AjaxResponse();
		ajaxResponse.setAjaxParameter("dataWrap", dataWrap);
		return ajaxResponse;
	}

	@RequestMapping("/datalistajaxdatawrap")
	@ResponseBody
	public AjaxDataWrap<Menu> menuDataListDataWrap(@RequestBody AjaxRequest request,
			@RequestBody(required = false) Menu menu) {
		AjaxDataWrap<Menu> dataWrap = request.getAjaxDataWrap("dataWrap", Menu.class);
		PageInfo pageRequest = new PageInfo(1, 10);
		AjaxDataWrap<Menu> ajaxDataWrap = new AjaxDataWrap<Menu>();
		if (menu == null || menu.getId() == null || "".equals(menu.getId())) {
			ajaxDataWrap.setDataList(menuService.findAll(pageRequest));
		} else {
			Menu menuQuery = new Menu();
			menuQuery.setId(menu.getId());
			List<Menu> list = menuService.findChildrenMenu(menuQuery, pageRequest);
			dataWrap.setDataList(list);
		}

		return ajaxDataWrap;
	}

	@RequestMapping("/add")
	@ResponseBody
	public AjaxResponse add(@RequestBody AjaxRequest request) {
		AjaxDataWrap<Menu> addDataWrap = request.getAjaxDataWrap("addDataWrap", Menu.class);
		if (addDataWrap == null)
			return null;
		Menu menu = addDataWrap.getData();
		menuService.saveOrUpdate(menu);
		return new AjaxResponse();
	}

	@RequestMapping("/delete")
	@ResponseBody
	public AjaxResponse delete(@RequestBody AjaxRequest request, AjaxResponse responseData) {
		AjaxDataWrap<Menu> deleteDataWrap = request.getAjaxDataWrap("deleteDataWrap", Menu.class);
		if (deleteDataWrap == null)
			return null;
		List<Menu> menuList = deleteDataWrap.getDataList();
		menuService.removeMenu(menuList);
		responseData.setAjaxParameter("deleteState", true);
		return responseData;
	}
}
