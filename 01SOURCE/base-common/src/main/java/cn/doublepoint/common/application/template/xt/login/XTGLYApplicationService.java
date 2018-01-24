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
import com.querydsl.core.types.Projections;

import cn.doublepoint.common.constant.XTConstant;
import cn.doublepoint.common.domain.model.entity.xt.QT_XT_GLY;
import cn.doublepoint.common.domain.model.entity.xt.T_XT_GLY;
import cn.doublepoint.common.port.adapter.template.persistence.xt.cd.XTCDRepository;
import cn.doublepoint.common.port.adapter.template.persistence.xt.gly.XTGLYRepository;
import cn.doublepoint.commonutil.domain.model.AjaxDataWrap;

@Service
public class XTGLYApplicationService {

	@Resource
	XTGLYRepository repository;

	public AjaxDataWrap<T_XT_GLY> validateGLY(T_XT_GLY queryGLY) {
		AjaxDataWrap<T_XT_GLY> ajaxDataWrap = new AjaxDataWrap<>();

		QT_XT_GLY query = QT_XT_GLY.t_XT_GLY;
		Predicate predicate = query.dlzh.eq(queryGLY.getDlzh());
		T_XT_GLY gly = repository.findOne(predicate);

		if (gly == null) {
			ajaxDataWrap.setError(XTConstant.GLY_NAME_NULL_CODE, XTConstant.GLY_NAME_NULL_CONTENT);
		} else if (!gly.getDlmm().equals(queryGLY.getDlmm())) {
			ajaxDataWrap.setError(XTConstant.GLY_PASSWORD_ERROR_CODE, XTConstant.GLY_PASSWORD_ERROR_CONTENT);
		}
		
		return ajaxDataWrap;
	}

}
