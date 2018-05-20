/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： ${datetime}
 * 
 * 类   说   明 ：${baseModel.entityModel.chName}维护类
 * 
 * 修   改   人：          修   改   日   期：
 */

package cn.doublepoint.common.service.template.sys.${baseModel.service.packageName}.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.doublepoint.common.constant.XTConstant;
import cn.doublepoint.common.domain.model.entity.sys.${baseModel.entityModel.entityClassName};
import cn.doublepoint.common.util.SequenceUtil;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;

@Service("${baseModel.service.annotationServiceName}")
public class ${baseModel.service.serviceClassName}Impl  implements ${baseModel.service.serviceClassName}{

	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	@Override
	public List<${baseModel.entityModel.entityClassName}> find(${baseModel.entityModel.entityClassName} ${baseModel.service.paramName},PageInfo pageInfo) {
		return JPAUtil.load(${baseModel.entityModel.entityClassName}.class, pageInfo);
	}
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	@Override
	public ${baseModel.entityModel.entityClassName} getById(long id){
		return JPAUtil.loadById(${baseModel.entityModel.entityClassName}.class, id);
	}
	
	/**
	 * 移除
	 * @param ${baseModel.service.paramName}
	 * @return
	 */
	@Override
	public boolean remove(${baseModel.entityModel.entityClassName} ${baseModel.service.paramName}){
		JPAUtil.remove(${baseModel.service.paramName});
		return true;
	}
	
	
	/**
	 * 移除
	 * @param ${baseModel.service.paramListName}
	 * @return
	 */
	@Override
	public boolean remove(List<${baseModel.entityModel.entityClassName}> ${baseModel.service.paramListName}){
		${baseModel.service.paramListName}.stream().forEach(item -> {
			JPAUtil.remove(item);
		});
		return true;
	}
	
	/**
	 * 创建或更新数据
	 * @param ${baseModel.service.paramName}
	 * @return
	 */
	@Override
	public boolean saveOrUpdate(${baseModel.entityModel.entityClassName} ${baseModel.service.paramName}) {
		if (${baseModel.service.paramName}.getId() == null){
			${baseModel.service.paramName}.setId(SequenceUtil.getNextVal(${baseModel.entityModel.entityClassName}.class));
			${baseModel.service.paramName}.setCreateTime(DateTimeUtil.getCurrentDate());
		}
		${baseModel.service.paramName}.setModifyTime(DateTimeUtil.getCurrentDate());
		JPAUtil.saveOrUpdate(${baseModel.service.paramName});
		return true;
	}
	
	/**
	 * 创建或更新数据
	 * @param ${baseModel.service.paramListName}
	 * @return
	 */
	@Override
	public boolean saveOrUpdate(List<${baseModel.entityModel.entityClassName}> ${baseModel.service.paramListName}) {
		${baseModel.service.paramListName}.stream().forEach(item->{
			if (item.getId() == null){
				item.setId(SequenceUtil.getNextVal(${baseModel.entityModel.entityClassName}.class));
				item.setCreateTime(DateTimeUtil.getCurrentDate());
			}
			item.setModifyTime(DateTimeUtil.getCurrentDate());
		});
		
		JPAUtil.saveOrUpdate(${baseModel.service.paramListName});
		return true;
	}

	@Override
	public List<${baseModel.entityModel.entityClassName}> findAll(PageInfo pageInfo) {
		return JPAUtil.load(${baseModel.entityModel.entityClassName}.class,pageInfo);
	}
}
