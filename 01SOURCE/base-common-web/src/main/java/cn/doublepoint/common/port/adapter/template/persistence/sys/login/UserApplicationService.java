/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年1月6日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.common.port.adapter.template.persistence.sys.login;

import org.springframework.stereotype.Service;

import cn.doublepoint.commonutil.ajaxmodel.AjaxDataPacket;
import cn.doublepoint.dto.domain.model.entity.sys.SysUser;

@Service
public class UserApplicationService {

	public AjaxDataPacket<SysUser> validateGLY(SysUser queryUser) {
		AjaxDataPacket<SysUser> ajaxDataPacket = new AjaxDataPacket<>();

//		QUser query = QUser.user;
//		Predicate predicate = query.loginAccountNo.eq(queryUser.getLoginAccountNo());
//		SysUser gly = repository.findOne(predicate);
//
//		if (gly == null) {
//			ajaxDataPacket.setError(XTConstant.GLY_NAME_NULL_CODE, XTConstant.GLY_NAME_NULL_CONTENT);
//		} else if (!gly.getLoginPassword().equals(queryUser.getLoginPassword())) {
//			ajaxDataPacket.setError(XTConstant.GLY_PASSWORD_ERROR_CODE, XTConstant.GLY_PASSWORD_ERROR_CONTENT);
//		}
		
		return ajaxDataPacket;
	}
}
