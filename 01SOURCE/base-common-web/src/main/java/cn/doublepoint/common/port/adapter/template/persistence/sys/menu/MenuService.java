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

import cn.doublepoint.dto.domain.model.entity.sys.SysMenu;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;


public interface MenuService {

	/**
	 * 查询最底层菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<SysMenu> findRootMenu(PageInfo pageInfo);

	/**
	 * 查询最底层菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<SysMenu> findChildrenMenu(SysMenu menu, PageInfo pageInfo);
	
	
	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<SysMenu> find(SysMenu menu,PageInfo pageInfo) ;

	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<SysMenu> findAll(PageInfo pageInfo);
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	public SysMenu getById(Integer id);
	
	/**
	 * 获取子节点数目
	 * @param menu
	 * @return
	 */
	public long getChildrenCount(Integer parentMenuId);
	
	/**
	 * 移除菜单
	 * @param menuList
	 * @return
	 */
	public boolean removeMenu(List<SysMenu> menuList);
	
	/**
	 * 创建或更新菜单
	 * @param menu
	 * @return
	 */
	public boolean saveOrUpdate(SysMenu menu) ;

	/**
	 * 创建或更新菜单
	 * @param menu
	 * @return
	 */
	public boolean saveOrUpdate(List<SysMenu> menuList) ;
}
