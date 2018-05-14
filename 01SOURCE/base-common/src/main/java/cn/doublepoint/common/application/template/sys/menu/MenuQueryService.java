package cn.doublepoint.common.application.template.sys.menu;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.doublepoint.common.application.template.sys.BaseQueryService;
import cn.doublepoint.common.constant.XTConstant;
import cn.doublepoint.common.domain.model.entity.sys.Menu;
import cn.doublepoint.commonutil.domain.model.PageInfo;
import cn.doublepoint.commonutil.domain.model.entity.BaseEntity;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
import cn.doublepoint.commonutil.port.adapter.persistence.QueryParamList;
import cn.doublepoint.commonutil.port.adapter.persistence.SortParamList;

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

	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	public Menu getById(long id){
		return JPAUtil.loadById(Menu.class, id);
	}
	
	/**
	 * 查询最底层菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<Menu> findRootMenu(PageInfo pageInfo) {
		QueryParamList queryParamList=new QueryParamList();
		queryParamList.addParam("level", XTConstant.TREE_ROOT_NODE_CJ);
		SortParamList sortParamList=new SortParamList();
		sortParamList.addParam("sn");
		List<Menu> list=JPAUtil.load(Menu.class, queryParamList,sortParamList);
		return list;
	}

	/**
	 * 查询最底层菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<Menu> findChildrenMenu(Menu menu, PageInfo pageInfo) {
		QueryParamList paramList=new QueryParamList();
		if(menu.getId()!=null)
			paramList.addParam("parentId",menu.getId());
		SortParamList sortParamList=new SortParamList();
		sortParamList.addParam("sn");
		return JPAUtil.load(Menu.class,paramList, pageInfo,sortParamList);
	}

	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<Menu> findAllMenu(PageInfo pageInfo) {
		SortParamList sortParamList=new SortParamList();
		sortParamList.addParam("sn");
		return findAll(Menu.class, null, pageInfo,sortParamList);
	}
	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<Menu> findAllMenu(Menu menu,PageInfo pageInfo) {
		SortParamList sortParamList=new SortParamList();
		sortParamList.addParam("sn");
		return findAll(Menu.class, null, pageInfo,sortParamList);
	}

	private <T extends BaseEntity> List<T> findAll(Class<T> clazz, QueryParamList parameterList, PageInfo pageInfo,SortParamList sortParamList) {
		return JPAUtil.load(clazz, parameterList, pageInfo,sortParamList);
	}
	
}

