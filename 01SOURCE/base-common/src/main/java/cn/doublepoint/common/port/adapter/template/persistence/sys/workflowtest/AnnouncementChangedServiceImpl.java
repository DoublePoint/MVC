package cn.doublepoint.common.port.adapter.template.persistence.sys.workflowtest;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.doublepoint.common.util.SequenceUtil;
import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.commonutil.ajaxmodel.PageInfo;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
import cn.doublepoint.template.dto.domain.model.entity.sys.AnnouncementChanged;

@Service("announcementChangedService")
public class AnnouncementChangedServiceImpl  implements AnnouncementChangedService{

	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	@Override
	public List<AnnouncementChanged> find(AnnouncementChanged announcementChanged,PageInfo pageInfo) {
		return JPAUtil.load(AnnouncementChanged.class, pageInfo);
	}
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	@Override
	public AnnouncementChanged getById(long id){
		return JPAUtil.loadById(AnnouncementChanged.class, id);
	}
	
	/**
	 * 移除
	 * @param announcementChanged
	 * @return
	 */
	@Override
	public boolean remove(AnnouncementChanged announcementChanged){
		JPAUtil.remove(announcementChanged);
		return true;
	}
	
	
	/**
	 * 移除
	 * @param announcementChangedList
	 * @return
	 */
	@Override
	public boolean remove(List<AnnouncementChanged> announcementChangedList){
		announcementChangedList.stream().forEach(item -> {
			JPAUtil.remove(item);
		});
		return true;
	}
	
	/**
	 * 创建或更新数据
	 * @param announcementChanged
	 * @return
	 */
	@Override
	public boolean saveOrUpdate(AnnouncementChanged announcementChanged) {
		if (announcementChanged.getId() == null){
			announcementChanged.setId(SequenceUtil.getNextVal(AnnouncementChanged.class));
			announcementChanged.setCreateTime(DateTimeUtil.getCurrentDate());
		}
		announcementChanged.setModifyTime(DateTimeUtil.getCurrentDate());
		JPAUtil.saveOrUpdate(announcementChanged);
		return true;
	}
	
	/**
	 * 创建或更新数据
	 * @param announcementChangedList
	 * @return
	 */
	@Override
	public boolean saveOrUpdate(List<AnnouncementChanged> announcementChangedList) {
		announcementChangedList.stream().forEach(item->{
			if (item.getId() == null){
				item.setId(SequenceUtil.getNextVal(AnnouncementChanged.class));
				item.setCreateTime(DateTimeUtil.getCurrentDate());
			}
			item.setModifyTime(DateTimeUtil.getCurrentDate());
		});
		
		JPAUtil.saveOrUpdate(announcementChangedList);
		return true;
	}

	@Override
	public List<AnnouncementChanged> findAll(PageInfo pageInfo) {
		return JPAUtil.load(AnnouncementChanged.class,pageInfo);
	}
}