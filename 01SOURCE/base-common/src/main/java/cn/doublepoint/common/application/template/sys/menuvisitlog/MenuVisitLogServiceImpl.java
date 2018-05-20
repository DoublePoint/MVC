package cn.doublepoint.common.application.template.sys.menuvisitlog;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.doublepoint.common.domain.model.entity.sys.Menu;
import cn.doublepoint.common.domain.model.entity.sys.MenuVisitLog;
import cn.doublepoint.common.util.SequenceUtil;
import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.commonutil.ajaxmodel.PageInfo;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;

@Service("menuVisitLogService")
public class MenuVisitLogServiceImpl  implements MenuVisitLogService {

	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	public List<MenuVisitLog> find(MenuVisitLog menuVisitLog,PageInfo pageInfo) {
		return JPAUtil.load(MenuVisitLog.class, pageInfo);
	}
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	public MenuVisitLog getById(long id){
		return JPAUtil.loadById(MenuVisitLog.class, id);
	}
	
	/**
	 * 移除
	 * @param menuVisitLog
	 * @return
	 */
	public boolean remove(MenuVisitLog menuVisitLog){
		JPAUtil.remove(menuVisitLog);
		return true;
	}
	
	
	/**
	 * 移除
	 * @param menuVisitLogList
	 * @return
	 */
	public boolean remove(List<MenuVisitLog> menuVisitLogList){
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
	public boolean saveOrUpdate(MenuVisitLog menuVisitLog) {
		if (menuVisitLog.getId() == null){
			menuVisitLog.setId(SequenceUtil.getNextVal(MenuVisitLog.class));
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
	public boolean saveOrUpdate(List<MenuVisitLog> menuVisitLogList) {
		menuVisitLogList.stream().forEach(item->{
			if (item.getId() == null){
				item.setId(SequenceUtil.getNextVal(MenuVisitLog.class));
				item.setCreateTime(DateTimeUtil.getCurrentDate());
			}
			item.setModifyTime(DateTimeUtil.getCurrentDate());
		});
		
		JPAUtil.saveOrUpdate(menuVisitLogList);
		return true;
	}

	@Override
	public List<MenuVisitLog> findAll(PageInfo pageInfo) {
		return JPAUtil.load(MenuVisitLog.class,pageInfo);
	}

}