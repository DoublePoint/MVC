package cn.doublepoint.common.port.adapter.template.persistence.sys.workflowtest;
import java.util.List;

import cn.doublepoint.commonutil.ajaxmodel.PageInfo;
import cn.doublepoint.template.dto.domain.model.entity.sys.WorksheetAduit;


public interface WorksheetAduitService {

	/**
	 * 根据分页信息查询所有数据
	 * 
	 * @return 工作单审批表
	 */
	public List<WorksheetAduit> findAll(PageInfo pageInfo);
	
	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	public List<WorksheetAduit> find(WorksheetAduit worksheetAduit,PageInfo pageInfo) ;
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	public WorksheetAduit getById(long id);
	
	/**
	 * 移除
	 * @param worksheetAduit
	 * @return
	 */
	public boolean remove(WorksheetAduit worksheetAduit);
	
	
	/**
	 * 移除
	 * @param worksheetAduitList
	 * @return
	 */
	public boolean remove(List<WorksheetAduit> worksheetAduitList);
	
	/**
	 * 创建或更新数据
	 * @param worksheetAduit
	 * @return
	 */
	public boolean saveOrUpdate(WorksheetAduit worksheetAduit) ;
	
	/**
	 * 创建或更新数据
	 * @param worksheetAduit
	 * @return
	 */
	public boolean saveOrUpdate(List<WorksheetAduit> worksheetAduitList) ;

}