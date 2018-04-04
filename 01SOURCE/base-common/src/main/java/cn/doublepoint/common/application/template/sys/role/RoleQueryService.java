package cn.doublepoint.common.application.template.sys.role;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.stereotype.Service;

import com.querydsl.core.types.Predicate;

import cn.doublepoint.common.domain.model.entity.sys.Role;
import cn.doublepoint.common.port.adapter.template.persistence.sys.role.RoleRepository;
import cn.doublepoint.commonutil.domain.model.AjaxDataWrap;
import cn.doublepoint.commonutil.domain.model.CommonBeanUtils;
import cn.doublepoint.commonutil.domain.model.PageInfo;
import cn.doublepoint.commonutil.domain.model.entity.BaseEntity;

/**
 * 创 建 人： 刘磊
 * 
 * 创 建 时 间 ： 2017年10月14日
 * 
 * 类 说 明 ：查询权限服务
 * 
 * 修 改 人： 修 改 日 期：
 */
@Service
public class RoleQueryService {

	@Resource
	RoleRepository roleRepository;


	/**
	 * 查询所有权限
	 * 
	 * @return 最底层权限列表
	 */
	public AjaxDataWrap<Role> findAllRole(PageInfo pageInfo) {
		AjaxDataWrap<Role> ajaxDataWrap = findAll(Role.class, null, pageInfo, roleRepository);
		return ajaxDataWrap.copy(Role.class);
	}

	private <T extends BaseEntity> AjaxDataWrap<T> findAll(Class<T> clazz, Predicate predicate, PageInfo pageInfo,
			 QueryDslPredicateExecutor<T> repository) {
		Page<T> page = repository.findAll(predicate, CommonBeanUtils.copyPageInfoToPageable(pageInfo));
		AjaxDataWrap<T> ajaxDataWrap = CommonBeanUtils.copyPageToAjaxDataWrap(page, clazz);
		return ajaxDataWrap;
	}
}
