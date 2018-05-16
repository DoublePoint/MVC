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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.common.application.template.sys.menu.MenuService;
import cn.doublepoint.common.domain.model.entity.sys.Menu;
import cn.doublepoint.commonutil.domain.model.AjaxDataWrap;
import cn.doublepoint.commonutil.domain.model.PageInfo;
import cn.doublepoint.commonutil.port.adapter.controller.handle.BaseHandleController;

@Controller
@RequestMapping("/template/sys/menu")
public class MenuHandleController extends BaseHandleController {

	private AjaxDataWrap<Menu> dataWrap;
	private AjaxDataWrap<Menu> deleteDataWrap;
	private AjaxDataWrap<Menu> addDataWrap;

	@Autowired
	MenuService menuService;

	@RequestMapping("/datalist")
	@ResponseBody
	public void menuDataList() {
		if (dataWrap == null)
			return;
		Menu menuQuery = null;
		PageInfo pageInfo = dataWrap.getPageInfo();
		pageInfo.setPageSize(10);
		if (dataWrap.getDataList() != null && dataWrap.getDataList().size() > 0) {
			menuQuery = dataWrap.getDataList().get(0);
		}

		if (menuQuery != null) {
			List<Menu> list = menuService.findChildrenMenu(menuQuery, pageInfo);
			dataWrap.setDataList(list);
		}
		responseData.setAjaxParameter("dataWrap", dataWrap);
	}

	@RequestMapping("/datalistajaxdatawrap")
	@ResponseBody
	public AjaxDataWrap<Menu> menuDataListDataWrap(@RequestBody(required = false) Menu menu) {
		PageInfo pageRequest = new PageInfo(1, 10);
		AjaxDataWrap<Menu> ajaxDataWrap = new AjaxDataWrap<Menu>();
		if (menu == null || menu.getId() == null || "".equals(menu.getId())) {
			ajaxDataWrap.setDataList(menuService.findAllMenu(pageRequest));
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
	public void add() {
		if (addDataWrap == null)
			return;
		Menu menu = addDataWrap.getDataList().get(0);
		menuService.saveOrUpdate(menu);
	}

	@RequestMapping("/delete")
	@ResponseBody
	public void delete() {
		if (deleteDataWrap == null)
			return;
		List<Menu> menuList = deleteDataWrap.getDataList();
		menuService.removeMenu(menuList);
		responseData.setAjaxParameter("deleteState", true);
	}
}
