/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： ${datetime}
 * 
 * 类   说   明 ：${baseModel.entityModel.chName}维护类
 * 
 * 修   改   人：          修   改   日   期：
 */
package cn.doublepoint.common.service.template.sys.${baseModel.service.packageName};
import java.util.List;

import cn.doublepoint.common.domain.model.entity.sys.${baseModel.entityModel.entityClassName};
import cn.doublepoint.commonutil.ajaxmodel.PageInfo;


public interface ${baseModel.service.serviceClassName} {

	/**
	 * 根据分页信息查询所有数据
	 * 
	 * @return ${baseModel.entityModel.chName}
	 */
	public List<${baseModel.entityModel.entityClassName}> findAll(PageInfo pageInfo);
	
	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	public List<${baseModel.entityModel.entityClassName}> find(${baseModel.entityModel.entityClassName} ${baseModel.service.paramName},PageInfo pageInfo) ;
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	public ${baseModel.entityModel.entityClassName} getById(long id);
	
	/**
	 * 移除
	 * @param ${baseModel.service.paramName}
	 * @return
	 */
	public boolean remove(${baseModel.entityModel.entityClassName} ${baseModel.service.paramName});
	
	
	/**
	 * 移除
	 * @param ${baseModel.service.paramListName}
	 * @return
	 */
	public boolean remove(List<${baseModel.entityModel.entityClassName}> ${baseModel.service.paramListName});
	
	/**
	 * 创建或更新数据
	 * @param ${baseModel.service.paramName}
	 * @return
	 */
	public boolean saveOrUpdate(${baseModel.entityModel.entityClassName} ${baseModel.service.paramName}) ;
	
	/**
	 * 创建或更新数据
	 * @param ${baseModel.service.paramName}
	 * @return
	 */
	public boolean saveOrUpdate(List<${baseModel.entityModel.entityClassName}> ${baseModel.service.paramListName}) ;

}
