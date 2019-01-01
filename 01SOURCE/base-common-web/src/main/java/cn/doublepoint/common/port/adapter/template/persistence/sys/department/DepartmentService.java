/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月14日
* 
* 类   说   明 ：查询菜单服务
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.port.adapter.template.persistence.sys.department;

import java.util.List;

import cn.doublepoint.dto.domain.model.entity.sys.SysDepartment;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;


public interface DepartmentService {

	/**
	 * 查询最底层菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<SysDepartment> findRootDepartment(PageInfo pageInfo);

	/**
	 * 查询最底层菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<SysDepartment> findChildrenDepartment(SysDepartment department, PageInfo pageInfo);
	
	
	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<SysDepartment> find(SysDepartment department,PageInfo pageInfo) ;

	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<SysDepartment> findAll(PageInfo pageInfo);
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	public SysDepartment getById(Integer id);
	
	/**
	 * 获取子节点数目
	 * @param department
	 * @return
	 */
	public long getChildrenCount(Integer parentDepartmentId);
	
	/**
	 * 移除菜单
	 * @param departmentList
	 * @return
	 */
	public boolean removeDepartment(List<SysDepartment> departmentList);
	
	/**
	 * 创建或更新菜单
	 * @param department
	 * @return
	 */
	public boolean saveOrUpdate(SysDepartment department) ;

	/**
	 * 创建或更新菜单
	 * @param department
	 * @return
	 */
	public boolean saveOrUpdate(List<SysDepartment> departmentList) ;
}
