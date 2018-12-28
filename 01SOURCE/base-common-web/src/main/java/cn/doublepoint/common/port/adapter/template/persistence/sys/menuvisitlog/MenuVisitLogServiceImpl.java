package cn.doublepoint.common.port.adapter.template.persistence.sys.menuvisitlog;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.commonutil.SequenceUtil;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
import cn.doublepoint.dto.domain.model.entity.sys.SysMenuVisitLog;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;

@Service("menuVisitLogService")
public class MenuVisitLogServiceImpl  implements MenuVisitLogService {

	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	public List<SysMenuVisitLog> find(SysMenuVisitLog menuVisitLog,PageInfo pageInfo) {
		return JPAUtil.load(SysMenuVisitLog.class, pageInfo);
	}
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	public SysMenuVisitLog getById(long id){
		return JPAUtil.loadById(SysMenuVisitLog.class, id);
	}
	
	/**
	 * 移除
	 * @param menuVisitLog
	 * @return
	 */
	public boolean remove(SysMenuVisitLog menuVisitLog){
		JPAUtil.remove(menuVisitLog);
		return true;
	}
	
	
	/**
	 * 移除
	 * @param menuVisitLogList
	 * @return
	 */
	public boolean remove(List<SysMenuVisitLog> menuVisitLogList){
		menuVisitLogList.stream().forEach(item -> {
			JPAUtil.remove(item);
		});
		return true;
	}
	
	/**
	 * 创建或更新数据
	 * @param menuVisitLog
	 * @return
	 */
	public boolean saveOrUpdate(SysMenuVisitLog menuVisitLog) {
		if (menuVisitLog.getId() == null){
			menuVisitLog.setId(SequenceUtil.getNextVal(SysMenuVisitLog.class));
			menuVisitLog.setCreateTime(DateTimeUtil.getCurrentDate());
		}
		menuVisitLog.setModifyTime(DateTimeUtil.getCurrentDate());
		JPAUtil.saveOrUpdate(menuVisitLog);
		return true;
	}
	
	/**
	 * 创建或更新数据
	 * @param menuVisitLogList
	 * @return
	 */
	public boolean saveOrUpdate(List<SysMenuVisitLog> menuVisitLogList) {
		menuVisitLogList.stream().forEach(item->{
			if (item.getId() == null){
				item.setId(SequenceUtil.getNextVal(SysMenuVisitLog.class));
				item.setCreateTime(DateTimeUtil.getCurrentDate());
			}
			item.setModifyTime(DateTimeUtil.getCurrentDate());
		});
		
		JPAUtil.saveOrUpdate(menuVisitLogList);
		return true;
	}

	@Override
	public List<SysMenuVisitLog> findAll(PageInfo pageInfo) {
		return JPAUtil.load(SysMenuVisitLog.class,pageInfo);
	}

}