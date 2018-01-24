/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年1月6日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.common.application.template.xt.login;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.querydsl.core.types.Predicate;

import cn.doublepoint.common.constant.XTConstant;
import cn.doublepoint.common.domain.model.entity.xt.QT_XT_YH;
import cn.doublepoint.common.domain.model.entity.xt.T_XT_YH;
import cn.doublepoint.common.port.adapter.template.persistence.xt.gly.XTGLYRepository;
import cn.doublepoint.common.port.adapter.template.persistence.xt.yh.XTYHRepository;
import cn.doublepoint.commonutil.domain.model.AjaxDataWrap;

@Service
public class XTYHApplicationService {

	@Resource
	XTYHRepository repository;
	
	public AjaxDataWrap<T_XT_YH> validateGLY(T_XT_YH queryGLY) {
		AjaxDataWrap<T_XT_YH> ajaxDataWrap = new AjaxDataWrap<>();

		QT_XT_YH query = QT_XT_YH.t_XT_YH;
		Predicate predicate = query.dlzh.eq(queryGLY.getDlzh());
		T_XT_YH gly = repository.findOne(predicate);

		if (gly == null) {
			ajaxDataWrap.setError(XTConstant.GLY_NAME_NULL_CODE, XTConstant.GLY_NAME_NULL_CONTENT);
		} else if (!gly.getMm().equals(queryGLY.getMm())) {
			ajaxDataWrap.setError(XTConstant.GLY_PASSWORD_ERROR_CODE, XTConstant.GLY_PASSWORD_ERROR_CONTENT);
		}
		
		return ajaxDataWrap;
	}
}
