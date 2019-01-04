package cn.doublepoint.common.port.adapter.template.persistence.sys.admin;
import java.util.List;

import cn.doublepoint.dto.domain.model.entity.sys.SysAdmin;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;


public interface AdminService {

	/**
	 * 根据分页信息查询所有数据
	 * 
	 * @return 系统管理员
	 */
	public List<SysAdmin> findAll(PageInfo pageInfo);
	
	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	public List<SysAdmin> find(SysAdmin admin,PageInfo pageInfo) ;
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	public SysAdmin getById(Integer id);
	
	/**
	 * 移除
	 * @param admin
	 * @return
	 */
	public boolean remove(SysAdmin admin);
	
	
	/**
	 * 移除
	 * @param adminList
	 * @return
	 */
	public boolean remove(List<SysAdmin> adminList);
	
	/**
	 * 创建或更新数据
	 * @param admin
	 * @return
	 */
	public boolean saveOrUpdate(SysAdmin admin) ;
	
	/**
	 * 创建或更新数据
	 * @param admin
	 * @return
	 */
	public boolean saveOrUpdate(List<SysAdmin> adminList) ;
	
	/**
	 * 根据登录账号获取用户
	 * @param loginAccountNo
	 * @return
	 */
	public SysAdmin getByLoginAccountNo(String loginAccountNo);

}