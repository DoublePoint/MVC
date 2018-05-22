package cn.doublepoint.common.application.template.sys.login;
import java.util.List;

import cn.doublepoint.common.domain.model.entity.sys.Admin;
import cn.doublepoint.commonutil.ajaxmodel.PageInfo;


public interface AdminService {

	/**
	 * 根据分页信息查询所有数据
	 * 
	 * @return 系统管理员
	 */
	public List<Admin> findAll(PageInfo pageInfo);
	
	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	public List<Admin> find(Admin admin,PageInfo pageInfo) ;
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	public Admin getById(long id);
	
	/**
	 * 移除
	 * @param admin
	 * @return
	 */
	public boolean remove(Admin admin);
	
	
	/**
	 * 移除
	 * @param adminList
	 * @return
	 */
	public boolean remove(List<Admin> adminList);
	
	/**
	 * 创建或更新数据
	 * @param admin
	 * @return
	 */
	public boolean saveOrUpdate(Admin admin) ;
	
	/**
	 * 创建或更新数据
	 * @param admin
	 * @return
	 */
	public boolean saveOrUpdate(List<Admin> adminList) ;

}