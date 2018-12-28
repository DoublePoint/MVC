package cn.doublepoint.common.port.adapter.template.persistence.sys.droplist;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.commonutil.SequenceUtil;
import cn.doublepoint.commonutil.StringUtil;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
import cn.doublepoint.dto.domain.model.entity.sys.SysExtendProperty;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;
import cn.doublepoint.dto.domain.model.vo.query.QueryParam;
import cn.doublepoint.dto.domain.model.vo.query.QueryParamList;

@Service("extendPropertyService")
public class ExtendPropertyServiceImpl  implements ExtendPropertyService{

	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	@Override
	public List<SysExtendProperty> find(SysExtendProperty extendProperty,PageInfo pageInfo) {
		QueryParamList queryParamList = new QueryParamList();
		if(!StringUtil.isNullOrEmpty(extendProperty.getCode()))
		{
			queryParamList.addParam("code", "%"+extendProperty.getCode()+"%", QueryParam.RELATION_LIKE);
		}
		if(!StringUtil.isNullOrEmpty(extendProperty.getName()))
		{
			queryParamList.addParam("name", "%"+extendProperty.getName()+"%", QueryParam.RELATION_LIKE);
		}
		if(!StringUtil.isNullOrEmpty(extendProperty.getQuery()))
		{
			queryParamList.addParam("query","%"+extendProperty.getQuery()+"%", QueryParam.RELATION_LIKE);
		}
		return JPAUtil.load(SysExtendProperty.class,queryParamList, pageInfo);
	}
	
	/**
	 * 根据扩展属性代码查询
	 * 
	 * @return 
	 */
	@Override
	public SysExtendProperty findByCode(String code) {
		QueryParamList queryParamList=new QueryParamList();
		queryParamList.addParam("code", code);
		List<SysExtendProperty> list=JPAUtil.load(SysExtendProperty.class, queryParamList);
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
	public SysExtendProperty getById(long id){
		return JPAUtil.loadById(SysExtendProperty.class, id);
	}
	
	/**
	 * 移除
	 * @param extendProperty
	 * @return
	 */
	@Override
	public boolean remove(SysExtendProperty extendProperty){
		JPAUtil.remove(extendProperty);
		return true;
	}
	
	
	/**
	 * 移除
	 * @param extendPropertyList
	 * @return
	 */
	@Override
	public boolean remove(List<SysExtendProperty> extendPropertyList){
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
	public boolean saveOrUpdate(SysExtendProperty extendProperty) {
		if (extendProperty.getId() == null){
			extendProperty.setId(SequenceUtil.getNextVal(SysExtendProperty.class));
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
	public boolean saveOrUpdate(List<SysExtendProperty> extendPropertyList) {
		extendPropertyList.stream().forEach(item->{
			if (item.getId() == null){
				item.setId(SequenceUtil.getNextVal(SysExtendProperty.class));
				item.setCreateTime(DateTimeUtil.getCurrentDate());
			}
			item.setModifyTime(DateTimeUtil.getCurrentDate());
		});
		
		JPAUtil.saveOrUpdate(extendPropertyList);
		return true;
	}

	@Override
	public List<SysExtendProperty> findAll(PageInfo pageInfo) {
		return JPAUtil.load(SysExtendProperty.class,pageInfo);
	}
}