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
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;

import cn.doublepoint.common.application.template.sys.menu.MenuService;
import cn.doublepoint.common.domain.model.entity.sys.Menu;
import cn.doublepoint.common.domain.model.viewmodel.sys.VOMenu;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxRequest;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.ajaxmodel.PageInfo;
import cn.doublepoint.commonutil.domain.model.BaseModel;
import cn.doublepoint.commonutil.filter.BodyReaderHttpServletRequestWrapper;
import cn.doublepoint.commonutil.port.adapter.controller.handle.BaseHandleController;

@Controller
@RequestMapping("/template/sys/menu")
public class MenuHandleController extends BaseHandleController {

	@Autowired
	MenuService menuService;

	// 菜单页面
	@RequestMapping("/{actionname}")
	public String cd(HttpServletRequest request, @PathVariable String actionname) {
		String aaa = request.getParameter("aaa");
		String sdf = request.getParameter("sdf");
		return "/template/sys/menu/" + actionname;
	}

	@RequestMapping("/menuDialog")
	public AjaxResponse menuDialog(BodyReaderHttpServletRequestWrapper request,
			@RequestParam(required = false) String type, ModelAndView modelAndView, AjaxResponse response) {
		AjaxDataWrap<Menu> ajaxDataWrap = request.getAjaxDataWrap("dataWrap", Menu.class);
		String ss = request.getParameter("type");

		ajaxDataWrap = new AjaxDataWrap<>();
		ajaxDataWrap.setPageInfo(new PageInfo());
		response.setAjaxParameter("dataWrap", ajaxDataWrap);
		response.setViewName("menuDialog");
		return response;
	}

	@RequestMapping("/datalist")
	@ResponseBody
	public AjaxResponse menuDataList(BodyReaderHttpServletRequestWrapper request) {
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
	public void add(BodyReaderHttpServletRequestWrapper request) {
		AjaxDataWrap<Menu> addDataWrap = request.getAjaxDataWrap("addDataWrap", Menu.class);
		if (addDataWrap == null)
			return;
		Menu menu = addDataWrap.getDataList().get(0);
		menuService.saveOrUpdate(menu);
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
