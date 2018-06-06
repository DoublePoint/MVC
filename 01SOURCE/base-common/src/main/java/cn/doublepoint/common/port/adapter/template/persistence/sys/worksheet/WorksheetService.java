package cn.doublepoint.common.port.adapter.template.persistence.sys.worksheet;
import java.util.List;

import cn.doublepoint.common.domain.model.entity.sys.Worksheet;
import cn.doublepoint.commonutil.ajaxmodel.PageInfo;


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
	public List<Worksheet> find(Worksheet worksheet,PageInfo pageInfo) ;
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	public Worksheet getById(long id);
	
	/**
	 * 移除
	 * @param worksheet
	 * @return
	 */
	public boolean remove(Worksheet worksheet);
	
	
	/**
	 * 移除
	 * @param worksheetList
	 * @return
	 */
	public boolean remove(List<Worksheet> worksheetList);
	
	/**
	 * 创建或更新数据
	 * @param worksheet
	 * @return
	 */
	public boolean create(Worksheet worksheet) ;
}