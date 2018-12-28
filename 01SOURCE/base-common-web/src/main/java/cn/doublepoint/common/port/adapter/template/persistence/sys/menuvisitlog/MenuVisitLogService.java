/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： 2018-05-20 22:07:493
 * 
 * 类   说   明 ：系统菜单访问日志维护类
 * 
 * 修   改   人：          修   改   日   期：
 */
package cn.doublepoint.common.port.adapter.template.persistence.sys.menuvisitlog;
import java.util.List;

import cn.doublepoint.dto.domain.model.entity.sys.SysMenuVisitLog;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;


public interface MenuVisitLogService {

	/**
	 * 根据分页信息查询所有数据
	 * 
	 * @return 系统菜单访问日志
	 */
	public List<SysMenuVisitLog> findAll(PageInfo pageInfo);
	
	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	public List<SysMenuVisitLog> find(SysMenuVisitLog menuVisitLog,PageInfo pageInfo) ;
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	public SysMenuVisitLog getById(long id);
	
	/**
	 * 移除
	 * @param menuVisitLog
	 * @return
	 */
	public boolean remove(SysMenuVisitLog menuVisitLog);
	
	
	/**
	 * 移除
	 * @param menuVisitLogList
	 * @return
	 */
	public boolean remove(List<SysMenuVisitLog> menuVisitLogList);
	
	/**
	 * 创建或更新数据
	 * @param menuVisitLog
	 * @return
	 */
	public boolean saveOrUpdate(SysMenuVisitLog menuVisitLog) ;
	
	/**
	 * 创建或更新数据
	 * @param menuVisitLog
	 * @return
	 */
	public boolean saveOrUpdate(List<SysMenuVisitLog> menuVisitLogList) ;

}