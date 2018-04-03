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
import cn.doublepoint.common.domain.model.entity.sys.Admin;
import cn.doublepoint.common.domain.model.entity.sys.QAdmin;
import cn.doublepoint.common.port.adapter.template.persistence.sys.admin.AdminRepository;
import cn.doublepoint.commonutil.domain.model.AjaxDataWrap;

@Service
public class AdminApplicationService {

	@Resource
	AdminRepository repository;

	public AjaxDataWrap<Admin> validateGLY(Admin queryGLY) {
		AjaxDataWrap<Admin> ajaxDataWrap = new AjaxDataWrap<>();

		QAdmin query = QAdmin.admin;
		Predicate predicate = query.loginAccountNo.eq(queryGLY.getLoginAccountNo());
		Admin gly = repository.findOne(predicate);

		if (gly == null) {
			ajaxDataWrap.setError(XTConstant.GLY_NAME_NULL_CODE, XTConstant.GLY_NAME_NULL_CONTENT);
		} else if (!gly.getLoginPassword().equals(queryGLY.getLoginPassword())) {
			ajaxDataWrap.setError(XTConstant.GLY_PASSWORD_ERROR_CODE, XTConstant.GLY_PASSWORD_ERROR_CONTENT);
		}
		
		return ajaxDataWrap;
	}

}
