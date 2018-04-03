/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年1月6日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.common.application.template.sys.login;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.querydsl.core.types.Predicate;

import cn.doublepoint.common.constant.XTConstant;
import cn.doublepoint.common.domain.model.entity.sys.QUser;
import cn.doublepoint.common.domain.model.entity.sys.User;
import cn.doublepoint.common.port.adapter.template.persistence.sys.user.UserRepository;
import cn.doublepoint.commonutil.domain.model.AjaxDataWrap;

@Service
public class UserApplicationService {

	@Resource
	UserRepository repository;
	
	public AjaxDataWrap<User> validateGLY(User queryUser) {
		AjaxDataWrap<User> ajaxDataWrap = new AjaxDataWrap<>();

		QUser query = QUser.user;
		Predicate predicate = query.loginAccountNo.eq(queryUser.getLoginAccountNo());
		User gly = repository.findOne(predicate);

		if (gly == null) {
			ajaxDataWrap.setError(XTConstant.GLY_NAME_NULL_CODE, XTConstant.GLY_NAME_NULL_CONTENT);
		} else if (!gly.getLoginPassword().equals(queryUser.getLoginPassword())) {
			ajaxDataWrap.setError(XTConstant.GLY_PASSWORD_ERROR_CODE, XTConstant.GLY_PASSWORD_ERROR_CONTENT);
		}
		
		return ajaxDataWrap;
	}
}
