package cn.doublepoint.common.port.adapter.template.persistence.sys.droplist;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.commonutil.SequenceUtil;
import cn.doublepoint.commonutil.ajaxmodel.PageInfo;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
import cn.doublepoint.commonutil.port.adapter.persistence.QueryParamList;
import cn.doublepoint.template.dto.domain.model.entity.sys.ExtendProperty;

@Service("extendPropertyService")
public class ExtendPropertyServiceImpl  implements ExtendPropertyService{

	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	@Override
	public List<ExtendProperty> find(ExtendProperty extendProperty,PageInfo pageInfo) {
		return JPAUtil.load(ExtendProperty.class, pageInfo);
	}
	
	/**
	 * 根据扩展属性代码查询
	 * 
	 * @return 
	 */
	@Override
	public ExtendProperty findByCode(String code) {
		QueryParamList queryParamList=new QueryParamList();
		queryParamList.addParam("code", code);
		List<ExtendProperty> list=JPAUtil.load(ExtendProperty.class, queryParamList);
		if(list==null||list.size()==0)
			return null;
		return list.get(0);
	}
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	@Override
	public ExtendProperty getById(long id){
		return JPAUtil.loadById(ExtendProperty.class, id);
	}
	
	/**
	 * 移除
	 * @param extendProperty
	 * @return
	 */
	@Override
	public boolean remove(ExtendProperty extendProperty){
		JPAUtil.remove(extendProperty);
		return true;
	}
	
	
	/**
	 * 移除
	 * @param extendPropertyList
	 * @return
	 */
	@Override
	public boolean remove(List<ExtendProperty> extendPropertyList){
		extendPropertyList.stream().forEach(item -> {
			JPAUtil.remove(item);
		});
		return true;
	}
	
	/**
	 * 创建或更新数据
	 * @param extendProperty
	 * @return
	 */
	@Override
	public boolean saveOrUpdate(ExtendProperty extendProperty) {
		if (extendProperty.getId() == null){
			extendProperty.setId(SequenceUtil.getNextVal(ExtendProperty.class));
			extendProperty.setCreateTime(DateTimeUtil.getCurrentDate());
		}
		extendProperty.setModifyTime(DateTimeUtil.getCurrentDate());
		JPAUtil.saveOrUpdate(extendProperty);
		return true;
	}
	
	/**
	 * 创建或更新数据
	 * @param extendPropertyList
	 * @return
	 */
	@Override
	public boolean saveOrUpdate(List<ExtendProperty> extendPropertyList) {
		extendPropertyList.stream().forEach(item->{
			if (item.getId() == null){
				item.setId(SequenceUtil.getNextVal(ExtendProperty.class));
				item.setCreateTime(DateTimeUtil.getCurrentDate());
			}
			item.setModifyTime(DateTimeUtil.getCurrentDate());
		});
		
		JPAUtil.saveOrUpdate(extendPropertyList);
		return true;
	}

	@Override
	public List<ExtendProperty> findAll(PageInfo pageInfo) {
		return JPAUtil.load(ExtendProperty.class,pageInfo);
	}
}