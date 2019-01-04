package cn.doublepoint.common.port.adapter.template.persistence.sys.role;
import java.util.List;

import cn.doublepoint.common.domain.model.viewmodel.sys.VOMenuRole;
import cn.doublepoint.dto.domain.model.entity.sys.SysMenu;
import cn.doublepoint.dto.domain.model.entity.sys.SysMenuRole;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;


public interface MenuRoleService {

	/**
	 * 根据分页信息查询所有数据
	 * 
	 * @return 权限菜单关联
	 */
	public List<SysMenuRole> findAll(PageInfo pageInfo);
	
	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	public List<SysMenuRole> find(SysMenuRole menuRole,PageInfo pageInfo) ;
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	public SysMenuRole getById(Integer id);
	
	/**
	 * 移除
	 * @param menuRole
	 * @return
	 */
	public boolean remove(SysMenuRole menuRole);
	
	
	/**
	 * 移除
	 * @param menuRoleList
	 * @return
	 */
	public boolean remove(List<SysMenuRole> menuRoleList);
	
	/**
	 * 创建或更新数据
	 * @param menuRole
	 * @return
	 */
	public boolean saveOrUpdate(SysMenuRole menuRole) ;
	
	/**
	 * 创建或更新数据
	 * @param menuRole
	 * @return
	 */
	public boolean saveOrUpdate(List<SysMenuRole> menuRoleList) ;
	
	/**
	 * 根据roleId删除菜单角色绑定
	 * @param roleId
	 * @return
	 */
	public boolean removeByRoleId(Integer roleId);
	
	/**
	 * 
	 * @param roleId
	 * @return
	 */
	public List<VOMenuRole> getMenuRole(Integer roleId) ;
	
	/**
	 * 
	 * @param roleId
	 * @param query
	 * @return
	 */
	public List<VOMenuRole> findChildrenMenuRole(Integer roleId , SysMenu query);
	
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
    public List<String> getRightList(SysMenuRole mRole);

    /**
     * 根据roleId以及menuId获取数据
     * @param roleId
     * @param menuId
     * @return
     */
    public SysMenuRole getByRoleIdAndMenuId(Integer roleId,Integer menuId);
    
    /**
     * 根据角色判断是否查询当前角色关联
     * @param roleId
     * @return
     */
    public boolean isExistByRoleId(Integer roleId);
    
    /**
	 * 通过Menulink获取roleIds
	 * @param menuLink
	 * @return
	 */
    public List<String> getRoleIdsByMenuLink(String menuLink);
}