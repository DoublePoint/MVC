package cn.doublepoint.workflow.process;

import java.util.List;

import cn.doublepoint.dto.domain.model.entity.sys.SysWorksheet;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;

public interface WorksheetService {

	/**
	 * 根据分页信息查询所有数据
	 * 
	 * @return 工作单基本信息
	 */
	public List<SysWorksheet> findAll(PageInfo pageInfo);

	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return
	 */
	public List<SysWorksheet> find(SysWorksheet worksheet, PageInfo pageInfo);

	/**
	 * 根据Id获取数据
	 * 
	 * @param id
	 * @return
	 */
	public SysWorksheet getById(long id);

	/**
	 * 根据Id获取数据
	 * 
	 * @param id
	 * @return
	 */
	public SysWorksheet getByWorksheetNo(String worksheetNo);

	/**
	 * 根据工作单编号获取实例标识
	 * 
	 * @param worksheetNo
	 * @return
	 */
	public String getInstanceIdByWorksheetNo(String worksheetNo);

	/**
	 * 移除
	 * 
	 * @param worksheet
	 * @return
	 */
	public boolean remove(SysWorksheet worksheet);

	/**
	 * 移除
	 * 
	 * @param worksheetList
	 * @return
	 */
	public boolean remove(List<SysWorksheet> worksheetList);

	/**
	 * 创建或更新数据
	 * 
	 * @param worksheet
	 * @return
	 */
	public boolean create(SysWorksheet worksheet);

}