package cn.doublepoint.common.port.adapter.template.persistence.sys.droplist;

import java.util.List;

import cn.doublepoint.dto.domain.model.entity.sys.ExtendProperty;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;

public interface ExtendPropertyService {

	/**
	 * 根据分页信息查询所有数据
	 * 
	 * @return 扩展属性定义
	 */
	public List<ExtendProperty> findAll(PageInfo pageInfo);

	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return
	 */
	public List<ExtendProperty> find(ExtendProperty extendProperty, PageInfo pageInfo);

	/**
	 * 根据扩展属性代码查询扩展属性
	 * 
	 * @param code
	 * @return
	 */
	public ExtendProperty findByCode(String code);

	/**
	 * 根据Id获取数据
	 * 
	 * @param id
	 * @return
	 */
	public ExtendProperty getById(long id);

	/**
	 * 移除
	 * 
	 * @param extendProperty
	 * @return
	 */
	public boolean remove(ExtendProperty extendProperty);

	/**
	 * 移除
	 * 
	 * @param extendPropertyList
	 * @return
	 */
	public boolean remove(List<ExtendProperty> extendPropertyList);

	/**
	 * 创建或更新数据
	 * 
	 * @param extendProperty
	 * @return
	 */
	public boolean saveOrUpdate(ExtendProperty extendProperty);

	/**
	 * 创建或更新数据
	 * 
	 * @param extendProperty
	 * @return
	 */
	public boolean saveOrUpdate(List<ExtendProperty> extendPropertyList);
}