package cn.doublepoint.common.application.template.sys.menu;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.stereotype.Service;

import com.querydsl.core.types.Predicate;

import cn.doublepoint.common.application.template.sys.BaseQueryService;
import cn.doublepoint.common.constant.XTConstant;
import cn.doublepoint.common.domain.model.entity.sys.Menu;
import cn.doublepoint.common.port.adapter.template.persistence.sys.menu.MenuRepository;
import cn.doublepoint.commonutil.domain.model.AjaxDataWrap;
import cn.doublepoint.commonutil.domain.model.CommonBeanUtils;
import cn.doublepoint.commonutil.domain.model.PageInfo;
import cn.doublepoint.commonutil.domain.model.StringUtil;
import cn.doublepoint.commonutil.domain.model.entity.BaseEntity;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
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
public class MenuQueryService extends BaseQueryService{

	@Resource
	MenuRepository menuRepository;
	
	@Autowired
	EntityManagerFactory entityManagerFactory;

	/**
	 * 查询最底层菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<Menu> findRootMenu(PageInfo pageInfo) {
		QueryParamList queryParamList=new QueryParamList();
		queryParamList.addParam("level", XTConstant.TREE_ROOT_NODE_CJ);
		List<Menu> list=JPAUtil.load(Menu.class, queryParamList);
		return list;
	}

	/**
	 * 查询最底层菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<Menu> findChildrenMenu(Menu menu, PageInfo pageInfo) {
		QueryParamList paramList=new QueryParamList();
		if(!StringUtil.isNullOrEmpty(menu.getId()))
			paramList.addParam("parentId",menu.getId());
		return JPAUtil.load(Menu.class,paramList, pageInfo);
	}

	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public AjaxDataWrap<Menu> findAllMenu(PageInfo pageInfo) {
		JPAUtil.load(Menu.class, pageInfo);
		AjaxDataWrap<Menu> ajaxDataWrap = findAll(Menu.class, null, pageInfo, menuRepository);
		return ajaxDataWrap.copy(Menu.class);
	}
	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public AjaxDataWrap<Menu> findAllMenu(Menu menu,PageInfo pageInfo) {
		AjaxDataWrap<Menu> ajaxDataWrap = findAll(Menu.class, null, pageInfo, menuRepository);
		return ajaxDataWrap.copy(Menu.class);
	}

	private <T extends BaseEntity> AjaxDataWrap<T> findAll(Class<T> clazz, Predicate predicate, PageInfo pageInfo,
			 QueryDslPredicateExecutor<T> repository) {
		Sort sort = new Sort(new Sort.Order(Sort.Direction.ASC,"sn"));
		if(pageInfo==null)
			pageInfo=new PageInfo();
		PageRequest pageRequest = CommonBeanUtils.copyPageInfoToPageable(pageInfo);
		Page<T> page = repository.findAll(predicate, pageRequest);
		AjaxDataWrap<T> ajaxDataWrap = CommonBeanUtils.copyPageToAjaxDataWrap(page, clazz);
		return ajaxDataWrap;
	}
	
}

