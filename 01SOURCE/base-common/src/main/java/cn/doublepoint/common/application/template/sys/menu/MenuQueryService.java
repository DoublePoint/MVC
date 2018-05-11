package cn.doublepoint.common.application.template.sys.menu;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Parameter;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.stereotype.Service;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.Query;
import com.querydsl.core.types.Predicate;
import com.querydsl.jpa.impl.JPAQueryFactory;

import cn.doublepoint.common.application.template.sys.BaseQueryService;
import cn.doublepoint.common.constant.XTConstant;
import cn.doublepoint.common.domain.model.entity.sys.Menu;
import cn.doublepoint.common.domain.model.entity.sys.QMenu;
import cn.doublepoint.common.domain.model.viewmodel.sys.VOMenu;
import cn.doublepoint.common.port.adapter.template.persistence.sys.menu.MenuRepository;
import cn.doublepoint.commonutil.domain.model.AjaxDataWrap;
import cn.doublepoint.commonutil.domain.model.CommonBeanUtils;
import cn.doublepoint.commonutil.domain.model.PageInfo;
import cn.doublepoint.commonutil.domain.model.StringUtil;
import cn.doublepoint.commonutil.domain.model.entity.BaseEntity;

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
	public AjaxDataWrap<VOMenu> findRootMenu(PageInfo pageInfo) {
		EntityManager entityManager=entityManagerFactory.createEntityManager();
		javax.persistence.Query qq=entityManager.createQuery("SELECT m,1 As aaa FROM Menu m where m.level=:level");
		qq.setParameter("level", XTConstant.TREE_ROOT_NODE_CJ);
		List list=qq.getResultList();
		QMenu query = QMenu.menu;
		Predicate predicate = query.level.eq(XTConstant.TREE_ROOT_NODE_CJ);
		AjaxDataWrap<Menu> dataWrap = findAll(Menu.class, predicate, pageInfo, menuRepository);
		AjaxDataWrap<VOMenu> ajaxDataWrap = dataWrap.copy(VOMenu.class);
		return ajaxDataWrap;
	}

	/**
	 * 查询最底层菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public AjaxDataWrap<VOMenu> findChildrenMenu(VOMenu menu, PageInfo pageInfo) {
		QMenu query = QMenu.menu;
		BooleanBuilder bb=new BooleanBuilder();
		if(StringUtil.isNotEmpty(menu.getId()))
			bb.and(query.parentId.eq(menu.getId()));
		AjaxDataWrap<Menu> dataWrap = findAll(Menu.class, bb.getValue(), pageInfo, menuRepository);
		return dataWrap.copy(VOMenu.class);
	}

	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public AjaxDataWrap<VOMenu> findAllMenu(PageInfo pageInfo) {
		AjaxDataWrap<Menu> ajaxDataWrap = findAll(Menu.class, null, pageInfo, menuRepository);
		return ajaxDataWrap.copy(VOMenu.class);
	}
	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public AjaxDataWrap<VOMenu> findAllMenu(VOMenu menu,PageInfo pageInfo) {
		AjaxDataWrap<Menu> ajaxDataWrap = findAll(Menu.class, null, pageInfo, menuRepository);
		return ajaxDataWrap.copy(VOMenu.class);
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

