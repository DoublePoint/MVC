package cn.doublepoint.workflow.port.adapter.service;
import java.util.List;

import cn.doublepoint.dto.domain.model.entity.sys.SysWorksheetAduit;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;


public interface WorksheetAduitService {

	/**
	 * 根据分页信息查询所有数据
	 * 
	 * @return 工作单审批表
	 */
	public List<SysWorksheetAduit> findAll(PageInfo pageInfo);
	
	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	public List<SysWorksheetAduit> find(SysWorksheetAduit worksheetAduit,PageInfo pageInfo) ;
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	public SysWorksheetAduit getById(long id);
	
	/**
	 * 移除
	 * @param worksheetAduit
	 * @return
	 */
	public boolean remove(SysWorksheetAduit worksheetAduit);
	
	
	/**
	 * 移除
	 * @param worksheetAduitList
	 * @return
	 */
	public boolean remove(List<SysWorksheetAduit> worksheetAduitList);
	
	/**
	 * 创建或更新数据
	 * @param worksheetAduit
	 * @return
	 */
	public boolean saveOrUpdate(SysWorksheetAduit worksheetAduit) ;
	
	/**
	 * 创建或更新数据
	 * @param worksheetAduit
	 * @return
	 */
	public boolean saveOrUpdate(List<SysWorksheetAduit> worksheetAduitList) ;

}