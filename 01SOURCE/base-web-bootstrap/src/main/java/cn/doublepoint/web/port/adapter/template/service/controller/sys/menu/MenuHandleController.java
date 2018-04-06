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

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import cn.doublepoint.common.application.template.sys.menu.MenuApplicationService;
import cn.doublepoint.common.application.template.sys.menu.MenuQueryService;
import cn.doublepoint.common.domain.model.entity.sys.Menu;
import cn.doublepoint.common.domain.model.viewmodel.sys.VOMenu;
import cn.doublepoint.commonutil.domain.model.AjaxDataWrap;
import cn.doublepoint.commonutil.domain.model.PageInfo;
import cn.doublepoint.commonutil.port.adapter.controller.handle.BaseHandleController;

@Controller
@RequestMapping("/template/sys/menu")
public class MenuHandleController extends BaseHandleController {

	@Autowired
	MenuQueryService menuQueryService;

	@Resource
	MenuApplicationService menuApplicationService;
	
	@RequestMapping("/datalist")
	@ResponseBody
	public AjaxDataWrap<VOMenu> menuDataList(@RequestBody(required=false) AjaxDataWrap<VOMenu> dataWrap) {
		if(dataWrap==null)
			return null;
		VOMenu menuQuery=null;
		PageInfo pageInfo=dataWrap.getPageInfo();
		if(dataWrap.getDataList()!=null&&dataWrap.getDataList().size()>0){
			menuQuery=dataWrap.getDataList().get(0);
		}
	
		if(menuQuery!=null){
			dataWrap=menuQueryService.findChildrenMenu(menuQuery,pageInfo);
		}
		return dataWrap;
	}
	
	
	@RequestMapping("/datalistajaxdatawrap")
	@ResponseBody
	public AjaxDataWrap<VOMenu> menuDataListDataWrap(@RequestBody(required=false) Menu menu) {
		PageInfo pageRequest=new PageInfo(1, 20);
		AjaxDataWrap<VOMenu> ajaxDataWrap=new AjaxDataWrap<VOMenu>();
		if(menu==null||menu.getId()==null||"".equals(menu.getId())){
			ajaxDataWrap= menuQueryService.findAllMenu(pageRequest);
		}
		else{
			VOMenu menuQuery=new VOMenu();
			menuQuery.setId(menu.getId());
			ajaxDataWrap=menuQueryService.findChildrenMenu(menuQuery,pageRequest);
		}

		ObjectMapper mapper = new ObjectMapper();  
		 try {
			String jsonStr = mapper.writeValueAsString(ajaxDataWrap);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}  
		return ajaxDataWrap;
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public Menu add(@RequestBody Menu menu) {

		menuApplicationService.createMenu(menu);
		Menu menu2 = new Menu();
		return menu2;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public boolean delete(@RequestBody List<Menu> menuList) {
		menuApplicationService.removeMenu(menuList);
		return true;
	}
}
