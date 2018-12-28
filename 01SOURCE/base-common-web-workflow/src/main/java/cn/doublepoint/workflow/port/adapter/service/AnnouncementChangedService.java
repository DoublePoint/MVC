package cn.doublepoint.workflow.port.adapter.service;
import java.util.List;

import cn.doublepoint.dto.domain.model.entity.sys.SysAnnouncementChanged;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;


public interface AnnouncementChangedService {

	/**
	 * 根据分页信息查询所有数据
	 * 
	 * @return 系统公告变更
	 */
	public List<SysAnnouncementChanged> findAll(PageInfo pageInfo);
	
	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	public List<SysAnnouncementChanged> find(SysAnnouncementChanged announcementChanged,PageInfo pageInfo) ;
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	public SysAnnouncementChanged getById(long id);
	
	/**
	 * 移除
	 * @param announcementChanged
	 * @return
	 */
	public boolean remove(SysAnnouncementChanged announcementChanged);
	
	
	/**
	 * 移除
	 * @param announcementChangedList
	 * @return
	 */
	public boolean remove(List<SysAnnouncementChanged> announcementChangedList);
	
	/**
	 * 创建或更新数据
	 * @param announcementChanged
	 * @return
	 */
	public boolean saveOrUpdate(SysAnnouncementChanged announcementChanged) ;
	
	/**
	 * 创建或更新数据
	 * @param announcementChanged
	 * @return
	 */
	public boolean saveOrUpdate(List<SysAnnouncementChanged> announcementChangedList) ;

}