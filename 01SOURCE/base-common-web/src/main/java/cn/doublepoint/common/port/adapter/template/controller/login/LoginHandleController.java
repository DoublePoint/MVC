/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年1月6日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.common.port.adapter.template.controller.login;

import javax.annotation.Resource;

import cn.doublepoint.common.port.adapter.template.persistence.sys.login.UserApplicationService;
import cn.doublepoint.dto.domain.model.entity.sys.SysUser;

public class LoginHandleController {
	
	@Resource
	UserApplicationService userApplicationService;
	public String figureUser(SysUser user){
		
		return "";
	}
}
