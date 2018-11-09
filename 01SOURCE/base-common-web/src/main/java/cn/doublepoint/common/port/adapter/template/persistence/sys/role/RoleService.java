package cn.doublepoint.common.port.adapter.template.persistence.sys.role;
import java.util.List;

import cn.doublepoint.dto.domain.model.entity.sys.Role;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;


public interface RoleService {

	/**
	 * 根据分页信息查询所有数据
	 * 
	 * @return 系统角色
	 */
	public List<Role> findAll(PageInfo pageInfo);
	
	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	public List<Role> find(Role role,PageInfo pageInfo) ;
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	public Role getById(long id);
	
	/**
	 * 移除
	 * @param role
	 * @return
	 */
	public boolean remove(Role role);
	
	
	/**
	 * 移除
	 * @param roleList
	 * @return
	 */
	public boolean remove(List<Role> roleList);
	
	/**
	 * 创建或更新数据
	 * @param role
	 * @return
	 */
	public boolean saveOrUpdate(Role role) ;
	
	/**
	 * 创建或更新数据
	 * @param role
	 * @return
	 */
	public boolean saveOrUpdate(List<Role> roleList) ;

}