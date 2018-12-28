package cn.doublepoint.workflow.port.adapter.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.commonutil.SequenceUtil;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
import cn.doublepoint.dto.domain.model.entity.sys.SysWorksheetAduit;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;

@Service("worksheetAduitService")
public class WorksheetAduitServiceImpl  implements WorksheetAduitService{

	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	@Override
	public List<SysWorksheetAduit> find(SysWorksheetAduit worksheetAduit,PageInfo pageInfo) {
		return JPAUtil.load(SysWorksheetAduit.class, pageInfo); 
	}
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	@Override
	public SysWorksheetAduit getById(long id){
		return JPAUtil.loadById(SysWorksheetAduit.class, id);
	}
	
	/**
	 * 移除
	 * @param worksheetAduit
	 * @return
	 */
	@Override
	public boolean remove(SysWorksheetAduit worksheetAduit){
		JPAUtil.remove(worksheetAduit);
		return true;
	}
	
	
	/**
	 * 移除
	 * @param worksheetAduitList
	 * @return
	 */
	@Override
	public boolean remove(List<SysWorksheetAduit> worksheetAduitList){
		worksheetAduitList.stream().forEach(item -> {
			JPAUtil.remove(item);
		});
		return true;
	}
	
	/**
	 * 创建或更新数据
	 * @param worksheetAduit
	 * @return
	 */
	@Override
	public boolean saveOrUpdate(SysWorksheetAduit worksheetAduit) {
		if (worksheetAduit.getId() == null){
			worksheetAduit.setId(SequenceUtil.getNextVal(SysWorksheetAduit.class));
			worksheetAduit.setCreateTime(DateTimeUtil.getCurrentDate());
		}
		worksheetAduit.setModifyTime(DateTimeUtil.getCurrentDate());
		JPAUtil.saveOrUpdate(worksheetAduit);
		return true;
	}
	
	/**
	 * 创建或更新数据
	 * @param worksheetAduitList
	 * @return
	 */
	@Override
	public boolean saveOrUpdate(List<SysWorksheetAduit> worksheetAduitList) {
		worksheetAduitList.stream().forEach(item->{
			if (item.getId() == null){
				item.setId(SequenceUtil.getNextVal(SysWorksheetAduit.class));
				item.setCreateTime(DateTimeUtil.getCurrentDate());
			}
			item.setModifyTime(DateTimeUtil.getCurrentDate());
		});
		
		JPAUtil.saveOrUpdate(worksheetAduitList);
		return true;
	}

	@Override
	public List<SysWorksheetAduit> findAll(PageInfo pageInfo) {
		return JPAUtil.load(SysWorksheetAduit.class,pageInfo);
	}
}