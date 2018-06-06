/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月20日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.web.port.adapter.template.service.controller.sys.menu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.common.domain.model.entity.sys.Menu;
import cn.doublepoint.common.domain.model.entity.sys.MenuVisitLog;
import cn.doublepoint.common.port.adapter.template.persistence.sys.menuvisitlog.MenuVisitLogService;
import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.filter.BodyReaderHttpServletRequestWrapper;
import cn.doublepoint.commonutil.port.adapter.controller.BaseController;

@Controller
@RequestMapping("/template/sys/menu-visit/")
public class MenuVisitController extends BaseController{
	@Autowired
	private MenuVisitLogService menuVisitLogService;
	
	// 菜单页面
	@RequestMapping("add-log")
	@ResponseBody
	public void cd(BodyReaderHttpServletRequestWrapper request) {
		AjaxDataWrap<Menu> dataWrap=request.getAjaxDataWrap("dataWrap", Menu.class);
		MenuVisitLog newLog=new MenuVisitLog();
		newLog.setMenuId(dataWrap.getDataList().get(0).getId());
		newLog.setVisitTime(DateTimeUtil.getCurrentDate());
		menuVisitLogService.saveOrUpdate(newLog);
	}

	public MenuVisitLogService getMenuVisitLogService() {
		return menuVisitLogService;
	}

	public void setMenuVisitLogService(MenuVisitLogService menuVisitLogService) {
		this.menuVisitLogService = menuVisitLogService;
	}
	
}
