package cn.doublepoint.common.port.adapter.template.persistence.sys.role;
import java.util.List;

import cn.doublepoint.common.domain.model.viewmodel.sys.VOMenuRole;
import cn.doublepoint.dto.domain.model.entity.sys.Menu;
import cn.doublepoint.dto.domain.model.entity.sys.MenuRole;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;


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
	
	/**
	 * 
	 * @param roleId
	 * @return
	 */
	public List<VOMenuRole> getMenuRole(Long roleId) ;
	
	/**
	 * 
	 * @param roleId
	 * @param query
	 * @return
	 */
	public List<VOMenuRole> findChildrenMenuRole(Long roleId , Menu query);
	
	/**
	 * 判断是否有写权限
	 * @param a
	 * @return
	 */
    public boolean isHasWriteRight(Integer a);
	
	/**
	 * 判断是否有读权限
	 * @param a
	 * @return
	 */
    public boolean isHasReadRight(Integer a);

    /**
     * 获取权限值列表
     * @param mRole
     * @return
     */
    public List<String> getRightList(VOMenuRole mRole);
    /**
     * 获取权限值列表
     * @param mRole
     * @return
     */
    public List<String> getRightList(MenuRole mRole);

    /**
     * 根据roleId以及menuId获取数据
     * @param roleId
     * @param menuId
     * @return
     */
    public MenuRole getByRoleIdAndMenuId(Long roleId,Long menuId);
    
    /**
     * 根据角色判断是否查询当前角色关联
     * @param roleId
     * @return
     */
    public boolean isExistByRoleId(Long roleId);
}