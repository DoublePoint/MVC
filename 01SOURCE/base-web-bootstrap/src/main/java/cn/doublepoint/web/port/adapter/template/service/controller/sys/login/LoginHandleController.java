/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年1月6日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.web.port.adapter.template.service.controller.sys.login;

import javax.annotation.Resource;

import cn.doublepoint.common.domain.model.entity.sys.User;
import cn.doublepoint.common.port.adapter.template.persistence.sys.login.UserApplicationService;

public class LoginHandleController {
	
	@Resource
	UserApplicationService userApplicationService;
	public String figureUser(User user){
		
		return "";
	}
}
