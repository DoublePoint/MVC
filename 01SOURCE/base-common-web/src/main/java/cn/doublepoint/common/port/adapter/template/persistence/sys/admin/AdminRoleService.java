/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月14日
* 
* 类   说   明 ：查询管理员权限服务
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.port.adapter.template.persistence.sys.admin;

import java.util.List;

import cn.doublepoint.dto.domain.model.entity.sys.SysAdminRole;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;


public interface AdminRoleService {

	/**
	 * 查询所有管理员权限
	 * 
	 * @return 最底层管理员权限列表
	 */
	public List<SysAdminRole> findRolesByAdminId(Integer adminId,PageInfo pageInfo) ;

	/**
	 * 查询所有管理员权限
	 * 
	 * @return 最底层管理员权限列表
	 */
	public List<SysAdminRole> findAll(PageInfo pageInfo);
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	public SysAdminRole getById(Integer id);
	
	/**
	 * 移除管理员权限
	 * @param menuList
	 * @return
	 */
	public boolean removeAdminRole(List<SysAdminRole> menuList);
	
	/**
	 * 创建或更新管理员权限
	 * @param adminRole
	 * @return
	 */
	public boolean saveOrUpdate(SysAdminRole adminRole) ;

	/**
	 * 创建或更新管理员权限
	 * @param adminRole
	 * @return
	 */
	public boolean saveOrUpdate(List<SysAdminRole> menuList) ;
}
