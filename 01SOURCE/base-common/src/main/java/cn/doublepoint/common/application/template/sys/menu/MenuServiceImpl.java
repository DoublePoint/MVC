package cn.doublepoint.common.application.template.sys.menu;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.doublepoint.common.constant.XTConstant;
import cn.doublepoint.common.domain.model.entity.sys.Menu;
import cn.doublepoint.common.util.SequenceUtil;
import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.commonutil.StringUtil;
import cn.doublepoint.commonutil.ajaxmodel.PageInfo;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
import cn.doublepoint.commonutil.port.adapter.persistence.QueryParam;
import cn.doublepoint.commonutil.port.adapter.persistence.QueryParamList;
import cn.doublepoint.commonutil.port.adapter.persistence.SortParamList;

/**
 * 创 建 人： 刘磊
 * 
 * 创 建 时 间 ： 2017年10月14日
 * 
 * 类 说 明 ：菜单服务
 * 
 * 修 改 人： 修 改 日 期：
 */
@Service(value="menuService")
public class MenuServiceImpl implements MenuService{

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
		if(!StringUtil.isNullOrEmpty(menu.getName())){
			paramList.addParam("name","%"+menu.getName()+"%",QueryParam.RELATION_LIKE);
		}
		SortParamList sortParamList=new SortParamList();
		sortParamList.addParam("sn");
		return JPAUtil.load(Menu.class,paramList, pageInfo,sortParamList);
	}
	
	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<Menu> find(Menu menu,PageInfo pageInfo) {
		SortParamList sortParamList=new SortParamList();
		sortParamList.addParam("sn");
		return JPAUtil.load(Menu.class, pageInfo,sortParamList);
	}

	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<Menu> findAll(PageInfo pageInfo) {
		SortParamList sortParamList=new SortParamList();
		sortParamList.addParam("sn");
		return JPAUtil.load(Menu.class, pageInfo,sortParamList);
	}
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	public Menu getById(long id){
		return JPAUtil.loadById(Menu.class, id);
	}

	/**
	 * 移除菜单
	 * @param menu
	 * @return
	 */
	public boolean removeMenu(List<Menu> menuList) {
		menuList.stream().forEach(item -> {
			JPAUtil.remove(item);
		});
		return true;
	}
	

	/**
	 * 保存或更新
	 * @param menu
	 * @return
	 */
	public boolean saveOrUpdate(Menu menu) {
		if (menu.getParentId() == null) {
			menu.setLevel(Integer.valueOf(XTConstant.TREE_ROOT_NODE_CJ));
			menu.setParentId(0L);
		} else {
			Menu parentCd = getById(Long.valueOf(menu.getParentId()));
			if(parentCd==null){
				menu.setLevel(Integer.valueOf(XTConstant.TREE_ROOT_NODE_CJ));
				menu.setParentId(0L);
			}
			else
				menu.setLevel(parentCd.getLevel() + 1);
		}
		if (menu.getId() == null){
			menu.setId(SequenceUtil.getNextVal(Menu.class));
			menu.setCreateTime(DateTimeUtil.getCurrentDate());
		}
		menu.setModifyTime(DateTimeUtil.getCurrentDate());
		JPAUtil.saveOrUpdate(menu);
		return true;
	}
	
	/**
	 * 保存或更新
	 * @param menu
	 * @return
	 */
	public boolean saveOrUpdate(List<Menu> menuList) {
		menuList.stream().forEach(menu->{
			if (menu.getParentId() == null) {
				menu.setLevel(Integer.valueOf(XTConstant.TREE_ROOT_NODE_CJ));
				menu.setParentId(0L);
			} else {
				Menu parentCd = getById(Long.valueOf(menu.getParentId()));
				menu.setLevel(parentCd.getLevel() + 1);
			}
			if (menu.getId() == null){
				menu.setId(SequenceUtil.getNextVal(Menu.class));
				menu.setCreateTime(DateTimeUtil.getCurrentDate());
			}
			menu.setModifyTime(DateTimeUtil.getCurrentDate());
		});
		
		JPAUtil.saveOrUpdate(menuList);
		return true;
	}
	
}

