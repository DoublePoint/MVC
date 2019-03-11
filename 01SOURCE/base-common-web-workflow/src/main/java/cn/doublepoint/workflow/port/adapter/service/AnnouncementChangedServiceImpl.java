package cn.doublepoint.workflow.port.adapter.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.commonutil.SequenceUtil;
import cn.doublepoint.commonutil.StringUtil;
import cn.doublepoint.commonutil.domain.model.CommonBeanUtil;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
import cn.doublepoint.dto.domain.model.entity.sys.SysAnnouncementChanged;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;
import cn.doublepoint.dto.domain.model.vo.query.QueryParamList;

@Service("announcementChangedService")
public class AnnouncementChangedServiceImpl  implements AnnouncementChangedService{

	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	@Override
	public List<SysAnnouncementChanged> find(SysAnnouncementChanged announcementChanged,PageInfo pageInfo) {
		StringBuffer stringBuffer=new StringBuffer();
		stringBuffer.append("select ac from SysAnnouncementChanged ac where 1=1");
		QueryParamList params=new QueryParamList();
		if(announcementChanged!=null){
			if(!StringUtil.isNullOrEmpty(announcementChanged.getWorksheetNo())){
				stringBuffer.append(" and ac.worksheetNo=:worksheetNo");
				params.addParam("worksheetNo", announcementChanged.getWorksheetNo());
			}
		}
		List<Object> sourceList=JPAUtil.executeQuery(stringBuffer.toString(), params,pageInfo);
		return CommonBeanUtil.copyTo(sourceList, SysAnnouncementChanged.class);
	}
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	@Override
	public SysAnnouncementChanged getById(long id){
		return JPAUtil.loadById(SysAnnouncementChanged.class, id);
	}
	
	/**
	 * 移除
	 * @param announcementChanged
	 * @return
	 */
	@Override
	public boolean remove(SysAnnouncementChanged announcementChanged){
		JPAUtil.remove(announcementChanged);
		return true;
	}
	
	
	/**
	 * 移除
	 * @param announcementChangedList
	 * @return
	 */
	@Override
	public boolean remove(List<SysAnnouncementChanged> announcementChangedList){
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
	public boolean saveOrUpdate(SysAnnouncementChanged announcementChanged) {
		if (announcementChanged.getId() == null){
			announcementChanged.setId(SequenceUtil.getNextVal(SysAnnouncementChanged.class));
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
	public boolean saveOrUpdate(List<SysAnnouncementChanged> announcementChangedList) {
		announcementChangedList.stream().forEach(item->{
			if (item.getId() == null){
				item.setId(SequenceUtil.getNextVal(SysAnnouncementChanged.class));
				item.setCreateTime(DateTimeUtil.getCurrentDate());
			}
			item.setModifyTime(DateTimeUtil.getCurrentDate());
		});
		
		JPAUtil.saveOrUpdate(announcementChangedList);
		return true;
	}

	@Override
	public List<SysAnnouncementChanged> findAll(PageInfo pageInfo) {
		return JPAUtil.load(SysAnnouncementChanged.class,pageInfo);
	}
}