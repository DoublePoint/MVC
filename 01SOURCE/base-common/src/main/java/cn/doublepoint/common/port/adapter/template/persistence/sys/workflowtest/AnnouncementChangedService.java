package cn.doublepoint.common.port.adapter.template.persistence.sys.workflowtest;
import java.util.List;

import cn.doublepoint.commonutil.ajaxmodel.PageInfo;
import cn.doublepoint.template.dto.domain.model.entity.sys.AnnouncementChanged;


public interface AnnouncementChangedService {

	/**
	 * 根据分页信息查询所有数据
	 * 
	 * @return 系统公告变更
	 */
	public List<AnnouncementChanged> findAll(PageInfo pageInfo);
	
	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	public List<AnnouncementChanged> find(AnnouncementChanged announcementChanged,PageInfo pageInfo) ;
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	public AnnouncementChanged getById(long id);
	
	/**
	 * 移除
	 * @param announcementChanged
	 * @return
	 */
	public boolean remove(AnnouncementChanged announcementChanged);
	
	
	/**
	 * 移除
	 * @param announcementChangedList
	 * @return
	 */
	public boolean remove(List<AnnouncementChanged> announcementChangedList);
	
	/**
	 * 创建或更新数据
	 * @param announcementChanged
	 * @return
	 */
	public boolean saveOrUpdate(AnnouncementChanged announcementChanged) ;
	
	/**
	 * 创建或更新数据
	 * @param announcementChanged
	 * @return
	 */
	public boolean saveOrUpdate(List<AnnouncementChanged> announcementChangedList) ;

}