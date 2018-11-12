package cn.doublepoint.generate.service;

import org.springframework.stereotype.Service;

import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.dto.domain.model.entity.sys.EntityFilter;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;
import cn.doublepoint.dto.service.BaseQueryService;

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

	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public AjaxDataWrap<EntityFilter> findAllEntityFilter(PageInfo pageInfo) {
		return null;
	}
	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public AjaxDataWrap<EntityFilter> findAllEntityFilter(EntityFilter menu,PageInfo pageInfo) {
		return null;
	}

	
}

