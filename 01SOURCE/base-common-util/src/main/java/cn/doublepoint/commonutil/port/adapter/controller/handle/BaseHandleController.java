/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月20日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.commonutil.port.adapter.controller.handle;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.commonutil.domain.model.AjaxDataWrap;
import cn.doublepoint.commonutil.domain.model.PageInfo;
import cn.doublepoint.commonutil.port.adapter.controller.BaseController;

@Controller
@RequestMapping("/llcommon/")
public class BaseHandleController implements BaseController{
	
	@RequestMapping("/datalist")
	@ResponseBody
	public AjaxDataWrap<DropBean> droplist(@RequestBody(required=false) AjaxDataWrap<DropBean> dataWrap) {
		if(dataWrap==null)
			return null;
		DropBean cdQuery=null;
		PageInfo pageInfo=dataWrap.getPageInfo();;
		if(dataWrap.getDataList()!=null&&dataWrap.getDataList().size()>0){
			cdQuery=dataWrap.getDataList().get(0);
		}
	
		if(cdQuery!=null){
			dataWrap=xTCDQueryService.findChildrenXTCD(cdQuery,pageInfo);
		}
		return dataWrap;
	}
}
