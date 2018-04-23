package cn.doublepoint.common.application.template.sys.entity;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.stereotype.Service;

import com.querydsl.core.types.Predicate;

import cn.doublepoint.common.application.template.sys.BaseQueryService;
import cn.doublepoint.common.domain.model.entity.sys.EntityFilter;
import cn.doublepoint.common.port.adapter.template.persistence.sys.entity.EntityFilterRepository;
import cn.doublepoint.commonutil.domain.model.AjaxDataWrap;
import cn.doublepoint.commonutil.domain.model.CommonBeanUtils;
import cn.doublepoint.commonutil.domain.model.PageInfo;
import cn.doublepoint.commonutil.domain.model.entity.BaseEntity;

/**
 * 创 建 人： 刘磊
 * 
 * 创 建 时 间 ： 2017年10月14日
 * 
 * 类 说 明 ：
 * 
 * 修 改 人： 修 改 日 期：
 */
@Service
public class EntityFilterQueryService extends BaseQueryService{

	@Resource
	EntityFilterRepository repository;

	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public AjaxDataWrap<EntityFilter> findAllEntityFilter(PageInfo pageInfo) {
		AjaxDataWrap<EntityFilter> ajaxDataWrap = findAll(EntityFilter.class, null, pageInfo, repository);
		return ajaxDataWrap.copy(EntityFilter.class);
	}
	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public AjaxDataWrap<EntityFilter> findAllEntityFilter(EntityFilter menu,PageInfo pageInfo) {
		AjaxDataWrap<EntityFilter> ajaxDataWrap = findAll(EntityFilter.class, null, pageInfo, repository);
		return ajaxDataWrap.copy(EntityFilter.class);
	}

	private <T extends BaseEntity> AjaxDataWrap<T> findAll(Class<T> clazz, Predicate predicate, PageInfo pageInfo,
			 QueryDslPredicateExecutor<T> repository) {
		Page<T> page = repository.findAll(predicate, CommonBeanUtils.copyPageInfoToPageable(pageInfo));
		AjaxDataWrap<T> ajaxDataWrap = CommonBeanUtils.copyPageToAjaxDataWrap(page, clazz);
		return ajaxDataWrap;
	}
	
}

