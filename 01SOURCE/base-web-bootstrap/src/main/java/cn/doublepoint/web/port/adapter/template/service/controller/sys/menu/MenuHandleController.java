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

import cn.doublepoint.common.application.template.sys.menu.MenuService;
import cn.doublepoint.common.domain.model.entity.sys.Menu;
import cn.doublepoint.common.domain.model.viewmodel.sys.VOMenu;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxRequest;
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
	public String cd(HttpServletRequest request,@PathVariable String actionname) {
		String aaa=request.getParameter("aaa");
		String sdf=request.getParameter("sdf");
		return "/template/sys/menu/" + actionname;
	}
	
	@RequestMapping("/menuDialog")
	public String menuDialog(BodyReaderHttpServletRequestWrapper request,@RequestParam(required=false) String type) {
		AjaxDataWrap ajaxDataWrap=request.getAjaxDataWrap("dataWrap",Menu.class);
		String ss=request.getParameter("type");
		responseData.setAjaxParameter("dataWrap", ajaxDataWrap);
		return "/template/sys/menu/menuDialog";
	}

	@RequestMapping("/datalist")
	@ResponseBody
	public void menuDataList(@RequestBody AjaxDataWrap<Menu> dataWrap) {
		if (dataWrap == null)
			return;
		Menu menuQuery = null;
		if (dataWrap.getDataList() != null && dataWrap.getDataList().size() > 0) {
			menuQuery = dataWrap.getDataList().get(0);
		}

		if (menuQuery != null) {
			List<Menu> list = menuService.findChildrenMenu(menuQuery, dataWrap.getPageInfo());
			dataWrap.setDataList(list);
		}
		responseData.setAjaxParameter("dataWrap", dataWrap);
	}

	@RequestMapping("/datalistajaxdatawrap")
	@ResponseBody
	public AjaxDataWrap<Menu> menuDataListDataWrap(@RequestBody(required = false) Menu menu,@RequestBody AjaxDataWrap<Menu> dataWrap) {
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
	public void add(BodyReaderHttpServletRequestWrapper request, @RequestBody AjaxRequest ajaxRequest) {
		AjaxDataWrap<Menu> aa=request.getAjaxDataWrap("addDataWrap", Menu.class);
		AjaxDataWrap<Menu> addDataWrap=ajaxRequest.getAjaxDataWrap("addDataWrap",Menu.class);
		if (addDataWrap == null)
			return;
		Menu menu = addDataWrap.getDataList().get(0);
		menuService.saveOrUpdate(menu);
	}

	@RequestMapping("/delete")
	@ResponseBody
	public void delete(@RequestBody AjaxDataWrap<Menu> deleteDataWrap) {
		if (deleteDataWrap == null)
			return;
		List<Menu> menuList = deleteDataWrap.getDataList();
		menuService.removeMenu(menuList);
		responseData.setAjaxParameter("deleteState", true);
	}
}
