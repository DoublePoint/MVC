package cn.doublepoint.common.application.template.xt.cd;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.stereotype.Service;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.Predicate;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.core.types.dsl.Expressions;

import cn.doublepoint.common.constant.XTConstant;
import cn.doublepoint.common.domain.model.entity.xt.QT_XT_CD;
import cn.doublepoint.common.domain.model.entity.xt.T_XT_CD;
import cn.doublepoint.common.domain.model.viewmodel.xt.VT_XT_CD;
import cn.doublepoint.common.port.adapter.template.persistence.xt.cd.XTCDRepository;
import cn.doublepoint.commonutil.domain.model.AjaxDataWrap;
import cn.doublepoint.commonutil.domain.model.CommonBeanUtils;
import cn.doublepoint.commonutil.domain.model.PageInfo;
import cn.doublepoint.commonutil.domain.model.StringUtil;
import cn.doublepoint.commonutil.domain.model.entity.BaseEntity;
import cn.doublepoint.commonutil.port.adapter.persistence.QueryParam;
import cn.doublepoint.commonutil.port.adapter.persistence.QueryParamList;

/**
 * 创 建 人： 刘磊
 * 
 * 创 建 时 间 ： 2017年10月14日
 * 
 * 类 说 明 ：查询菜单服务
 * 
 * 修 改 人： 修 改 日 期：
 */
@Service
public class XTCDQueryService {

	// @Resource
	// BaseRepositoryUtil jpaUtil;

	@Resource
	XTCDRepository xtcdRepository;


	/**
	 * 查询最底层菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public AjaxDataWrap<VT_XT_CD> findRootXTCD(PageInfo pageInfo) {
		QT_XT_CD query = QT_XT_CD.t_XT_CD;
		Predicate predicate = query.cdcj.eq(XTConstant.TREE_ROOT_NODE_CJ);
		AjaxDataWrap<T_XT_CD> dataWrap = findAll(T_XT_CD.class, predicate, pageInfo, xtcdRepository);
		AjaxDataWrap<VT_XT_CD> ajaxDataWrap = dataWrap.copy(VT_XT_CD.class);
		return ajaxDataWrap;
	}

	/**
	 * 查询最底层菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public AjaxDataWrap<VT_XT_CD> findChildrenXTCD(VT_XT_CD cd, PageInfo pageInfo) {
		QT_XT_CD query = QT_XT_CD.t_XT_CD;
		BooleanBuilder bb=new BooleanBuilder();
//		if(StringUtil.isNotEmpty(cd.getCdmc()))
//			bb.and(query.cdmc.like("%"+cd.getCdmc()+"%"));
		if(StringUtil.isNotEmpty(cd.getCdbs()))
			bb.and(query.sjcdbs.eq(cd.getCdbs()));
		AjaxDataWrap<T_XT_CD> dataWrap = findAll(T_XT_CD.class, bb.getValue(), pageInfo, xtcdRepository);
		return dataWrap.copy(VT_XT_CD.class);
	}

	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public AjaxDataWrap<VT_XT_CD> findAllXTCD(PageInfo pageInfo) {
		AjaxDataWrap<T_XT_CD> ajaxDataWrap = findAll(T_XT_CD.class, null, pageInfo, xtcdRepository);
		return ajaxDataWrap.copy(VT_XT_CD.class);
	}
	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public AjaxDataWrap<VT_XT_CD> findAllXTCD(VT_XT_CD cd,PageInfo pageInfo) {
		AjaxDataWrap<T_XT_CD> ajaxDataWrap = findAll(T_XT_CD.class, null, pageInfo, xtcdRepository);
		return ajaxDataWrap.copy(VT_XT_CD.class);
	}

	private <T extends BaseEntity> AjaxDataWrap<T> findAll(Class<T> clazz, Predicate predicate, PageInfo pageInfo,
			 QueryDslPredicateExecutor<T> repository) {
		Page<T> page = repository.findAll(predicate, CommonBeanUtils.copyPageInfoToPageable(pageInfo));
		AjaxDataWrap<T> ajaxDataWrap = CommonBeanUtils.copyPageToAjaxDataWrap(page, clazz);
		return ajaxDataWrap;
	}
}
