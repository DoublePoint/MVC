package cn.doublepoint.common.port.adapter.template.persistence.sys.role;
import java.util.List;

import cn.doublepoint.common.domain.model.entity.sys.MenuRole;
import cn.doublepoint.commonutil.ajaxmodel.PageInfo;


public interface MenuRoleService {

	/**
	 * 根据分页信息查询所有数据
	 * 
	 * @return 权限菜单关联
	 */
	public List<MenuRole> findAll(PageInfo pageInfo);
	
	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	public List<MenuRole> find(MenuRole menuRole,PageInfo pageInfo) ;
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	public MenuRole getById(long id);
	
	/**
	 * 移除
	 * @param menuRole
	 * @return
	 */
	public boolean remove(MenuRole menuRole);
	
	
	/**
	 * 移除
	 * @param menuRoleList
	 * @return
	 */
	public boolean remove(List<MenuRole> menuRoleList);
	
	/**
	 * 创建或更新数据
	 * @param menuRole
	 * @return
	 */
	public boolean saveOrUpdate(MenuRole menuRole) ;
	
	/**
	 * 创建或更新数据
	 * @param menuRole
	 * @return
	 */
	public boolean saveOrUpdate(List<MenuRole> menuRoleList) ;
	
	/**
	 * 根据roleId删除菜单角色绑定
	 * @param roleId
	 * @return
	 */
	public boolean removeByRoleId(Long roleId);

}