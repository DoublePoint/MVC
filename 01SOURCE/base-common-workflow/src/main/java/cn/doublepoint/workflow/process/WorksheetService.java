package cn.doublepoint.workflow.process;

import java.util.List;

import cn.doublepoint.commonutil.ajaxmodel.PageInfo;
import cn.doublepoint.template.dto.domain.model.entity.sys.Worksheet;

public interface WorksheetService {

	/**
	 * 根据分页信息查询所有数据
	 * 
	 * @return 工作单基本信息
	 */
	public List<Worksheet> findAll(PageInfo pageInfo);

	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return
	 */
	public List<Worksheet> find(Worksheet worksheet, PageInfo pageInfo);

	/**
	 * 根据Id获取数据
	 * 
	 * @param id
	 * @return
	 */
	public Worksheet getById(long id);

	/**
	 * 根据Id获取数据
	 * 
	 * @param id
	 * @return
	 */
	public Worksheet getByWorksheetNo(String worksheetNo);

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
	public boolean remove(Worksheet worksheet);

	/**
	 * 移除
	 * 
	 * @param worksheetList
	 * @return
	 */
	public boolean remove(List<Worksheet> worksheetList);

	/**
	 * 创建或更新数据
	 * 
	 * @param worksheet
	 * @return
	 */
	public boolean create(Worksheet worksheet);

}