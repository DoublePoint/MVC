/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月14日
* 
* 类   说   明 ：查询菜单服务
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.port.adapter.template.persistence.sys.menu;

import java.util.List;

import cn.doublepoint.commonutil.ajaxmodel.PageInfo;
import cn.doublepoint.template.dto.domain.model.entity.sys.Menu;


public interface MenuService {

	/**
	 * 查询最底层菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<Menu> findRootMenu(PageInfo pageInfo);

	/**
	 * 查询最底层菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<Menu> findChildrenMenu(Menu menu, PageInfo pageInfo);
	
	
	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<Menu> find(Menu menu,PageInfo pageInfo) ;

	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<Menu> findAll(PageInfo pageInfo);
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	public Menu getById(long id);
	
	/**
	 * 获取子节点数目
	 * @param menu
	 * @return
	 */
	public long getChildrenCount(Long parentMenuId);
	
	/**
	 * 移除菜单
	 * @param menuList
	 * @return
	 */
	public boolean removeMenu(List<Menu> menuList);
	
	/**
	 * 创建或更新菜单
	 * @param menu
	 * @return
	 */
	public boolean saveOrUpdate(Menu menu) ;

}
