/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月20日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.port.adapter.template.controller.menu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.common.port.adapter.template.persistence.sys.menuvisitlog.MenuVisitLogService;
import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxRequest;
import cn.doublepoint.commonutil.port.adapter.controller.BaseController;
import cn.doublepoint.dto.domain.model.entity.sys.SysMenu;
import cn.doublepoint.dto.domain.model.entity.sys.SysMenuVisitLog;

@Controller
@RequestMapping("sys/menu-visit/")
public class MenuVisitController extends BaseController{
	@Autowired
	private MenuVisitLogService menuVisitLogService;
	
	// 菜单页面
	@RequestMapping("add-log")
	@ResponseBody
	public void cd(@RequestBody AjaxRequest request) {
		AjaxDataWrap<SysMenu> dataWrap=request.getAjaxDataWrap("dataWrap", SysMenu.class);
		SysMenuVisitLog newLog=new SysMenuVisitLog();
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
