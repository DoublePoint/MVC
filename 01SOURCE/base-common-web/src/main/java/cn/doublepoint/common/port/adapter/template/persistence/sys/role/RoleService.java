package cn.doublepoint.common.port.adapter.template.persistence.sys.role;
import java.util.List;

import cn.doublepoint.dto.domain.model.entity.sys.SysRole;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;


public interface RoleService {

	/**
	 * 根据分页信息查询所有数据
	 * 
	 * @return 系统角色
	 */
	public List<SysRole> findAll(PageInfo pageInfo);
	
	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	public List<SysRole> find(SysRole role,PageInfo pageInfo) ;
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	public SysRole getById(long id);
	
	/**
	 * 移除
	 * @param role
	 * @return
	 */
	public boolean remove(SysRole role)  throws Exception;
	
	
	/**
	 * 移除
	 * @param roleList
	 * @return
	 */
	public boolean remove(List<SysRole> roleList)  throws Exception;
	
	/**
	 * 创建或更新数据
	 * @param role
	 * @return
	 */
	public boolean saveOrUpdate(SysRole role) ;
	
	/**
	 * 创建或更新数据
	 * @param role
	 * @return
	 */
	public boolean saveOrUpdate(List<SysRole> roleList) ;

}