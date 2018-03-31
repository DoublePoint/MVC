/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月20日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.web.port.adapter.template.service.controller.xt.cd;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import cn.doublepoint.common.application.template.xt.cd.MenuApplicationService;
import cn.doublepoint.common.application.template.xt.cd.MenuQueryService;
import cn.doublepoint.common.domain.model.entity.xt.Menu;
import cn.doublepoint.common.domain.model.viewmodel.xt.VMenu;
import cn.doublepoint.commonutil.domain.model.AjaxDataWrap;
import cn.doublepoint.commonutil.domain.model.PageInfo;
import cn.doublepoint.commonutil.port.adapter.controller.handle.BaseHandleController;

@Controller
@RequestMapping("/template/xt/cd")
public class MenuHandleController extends BaseHandleController {

	@Autowired
	MenuQueryService xTCDQueryService;

	@Resource
	MenuApplicationService xTCDApplicationService;
	
	@RequestMapping("/datalist")
	@ResponseBody
	public AjaxDataWrap<VMenu> cdDataList(@RequestBody(required=false) AjaxDataWrap<VMenu> dataWrap) {
		if(dataWrap==null)
			return null;
		VMenu cdQuery=null;
		PageInfo pageInfo=dataWrap.getPageInfo();;
		if(dataWrap.getDataList()!=null&&dataWrap.getDataList().size()>0){
			cdQuery=dataWrap.getDataList().get(0);
		}
	
		if(cdQuery!=null){
			dataWrap=xTCDQueryService.findChildrenMenu(cdQuery,pageInfo);
		}
		return dataWrap;
	}
	
	
	@RequestMapping("/datalistajaxdatawrap")
	@ResponseBody
	public AjaxDataWrap<VMenu> cdDataListDataWrap(@RequestBody(required=false) Menu cd) {
		PageInfo pageRequest=new PageInfo(1, 20);
		AjaxDataWrap<VMenu> ajaxDataWrap=new AjaxDataWrap<VMenu>();
		if(cd==null||cd.getCdbs()==null||"".equals(cd.getCdbs())){
			ajaxDataWrap= xTCDQueryService.findAllMenu(pageRequest);
		}
		else{
			VMenu cdQuery=new VMenu();
			cdQuery.setCdbs(cd.getCdbs());
			ajaxDataWrap=xTCDQueryService.findChildrenMenu(cdQuery,pageRequest);
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
	public Menu add(@RequestBody Menu cd) {

		xTCDApplicationService.createMenu(cd);
		Menu cd2 = new Menu();
		return cd2;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public boolean delete(@RequestBody List<Menu> cdList) {
		xTCDApplicationService.removeMenu(cdList);
		return true;
	}
}
