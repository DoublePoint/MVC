/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月20日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.web.port.adapter.template.service.controller.sys.extendproperty;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.doublepoint.common.application.template.sys.menu.MenuService;
import cn.doublepoint.common.domain.model.entity.sys.Menu;
import cn.doublepoint.commonutil.StringUtil;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.ajaxmodel.PageInfo;
import cn.doublepoint.commonutil.filter.BodyReaderHttpServletRequestWrapper;
import cn.doublepoint.commonutil.port.adapter.controller.BaseController;

@Controller
@RequestMapping("/template/sys/menu")
public class MenuManagementController extends BaseController {

	@Autowired
	MenuService menuService;

	// 菜单页面
	@RequestMapping("/{actionname}")
	public String cd(HttpServletRequest request, @PathVariable String actionname) {
		return "/template/sys/menu/" + actionname;
	}

	@RequestMapping("/menuDialog")
	public AjaxResponse menuDialog(BodyReaderHttpServletRequestWrapper request, ModelAndView modelAndView,
			AjaxResponse response) {
		String type = request.getParameter("type");
		if ("edit".equals(type)) {
			AjaxDataWrap<Menu> ajaxDataWrap = request.getAjaxDataWrap("dataWrap", Menu.class);
			response.setAjaxParameter("dataWrap", ajaxDataWrap);
		} else {
			String parentMenuId = request.getParameter("parentMenuId");
			if (!StringUtil.isNullOrEmpty(parentMenuId))
				response.setAjaxParameter("parentMenuId", parentMenuId);
			response.setAjaxParameter("type", type);
		}
		response.setViewName("menuDialog");
		return response;
	}

	@RequestMapping("/getMenuName")
	@ResponseBody
	public String getMenuName(BodyReaderHttpServletRequestWrapper request) {
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
	public AjaxResponse retrieve(BodyReaderHttpServletRequestWrapper request) {
		AjaxDataWrap<Menu> dataWrap = request.getAjaxDataWrap("dataWrap", Menu.class);
		if (dataWrap == null)
			return null;
		Menu menuQuery = null;
		if (dataWrap.getDataList() != null && dataWrap.getDataList().size() > 0) {
			menuQuery = dataWrap.getDataList().get(0);
		}

		if (menuQuery != null) {
			List<Menu> list = menuService.findChildrenMenu(menuQuery, dataWrap.getPageInfo());
			dataWrap.setDataList(list);
		}

		AjaxResponse ajaxResponse = new AjaxResponse();
		ajaxResponse.setAjaxParameter("dataWrap", dataWrap);
		return ajaxResponse;
	}

	@RequestMapping("/datalistajaxdatawrap")
	@ResponseBody
	public AjaxDataWrap<Menu> menuDataListDataWrap(BodyReaderHttpServletRequestWrapper request,
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
	public AjaxResponse add(BodyReaderHttpServletRequestWrapper request) {
		AjaxDataWrap<Menu> addDataWrap = request.getAjaxDataWrap("addDataWrap", Menu.class);
		if (addDataWrap == null)
			return null;
		Menu menu = addDataWrap.getDataList().get(0);
		menuService.saveOrUpdate(menu);
		return new AjaxResponse();
	}

	@RequestMapping("/delete")
	@ResponseBody
	public AjaxResponse delete(BodyReaderHttpServletRequestWrapper request, AjaxResponse responseData) {
		AjaxDataWrap<Menu> deleteDataWrap = request.getAjaxDataWrap("deleteDataWrap", Menu.class);
		if (deleteDataWrap == null)
			return null;
		List<Menu> menuList = deleteDataWrap.getDataList();
		menuService.removeMenu(menuList);
		responseData.setAjaxParameter("deleteState", true);
		return responseData;
	}
}