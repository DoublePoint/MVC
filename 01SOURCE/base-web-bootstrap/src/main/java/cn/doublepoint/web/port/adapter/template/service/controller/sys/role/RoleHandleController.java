/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月20日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.web.port.adapter.template.service.controller.sys.role;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.common.application.template.sys.role.RoleApplicationService;
import cn.doublepoint.common.application.template.sys.role.RoleQueryService;
import cn.doublepoint.common.domain.model.entity.sys.Role;
import cn.doublepoint.commonutil.domain.model.AjaxDataWrap;
import cn.doublepoint.commonutil.domain.model.PageInfo;
import cn.doublepoint.commonutil.port.adapter.controller.handle.BaseHandleController;

@Controller
@RequestMapping("/template/sys/role")
public class RoleHandleController extends BaseHandleController {

	@Autowired
	RoleQueryService roleQueryService;

	@Resource
	RoleApplicationService roleApplicationService;
	
	@RequestMapping("/datalist")
	@ResponseBody
	public AjaxDataWrap<Role> roleDataList(@RequestBody(required=false) AjaxDataWrap<Role> dataWrap) {
		if(dataWrap==null)
			return null;
		Role roleQuery=null;
		PageInfo pageInfo=dataWrap.getPageInfo();
		if(dataWrap.getDataList()!=null&&dataWrap.getDataList().size()>0){
			roleQuery=dataWrap.getDataList().get(0);
		}
	
		return dataWrap;
	}
	
	
}
