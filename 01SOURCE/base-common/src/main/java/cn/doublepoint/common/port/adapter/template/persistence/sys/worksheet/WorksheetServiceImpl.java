package cn.doublepoint.common.port.adapter.template.persistence.sys.worksheet;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.doublepoint.common.domain.model.entity.sys.Worksheet;
import cn.doublepoint.common.util.SequenceUtil;
import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.commonutil.StringUtil;
import cn.doublepoint.commonutil.ajaxmodel.PageInfo;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;

@Service("worksheetService")
public class WorksheetServiceImpl  implements WorksheetService{

	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	@Override
	public List<Worksheet> find(Worksheet worksheet,PageInfo pageInfo) {
		return JPAUtil.load(Worksheet.class, pageInfo);
	}
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	@Override
	public Worksheet getById(long id){
		return JPAUtil.loadById(Worksheet.class, id);
	}
	
	/**
	 * 移除
	 * @param worksheet
	 * @return
	 */
	@Override
	public boolean remove(Worksheet worksheet){
		JPAUtil.remove(worksheet);
		return true;
	}
	
	
	/**
	 * 移除
	 * @param worksheetList
	 * @return
	 */
	@Override
	public boolean remove(List<Worksheet> worksheetList){
		worksheetList.stream().forEach(item -> {
			JPAUtil.remove(item);
		});
		return true;
	}
	
	/**
	 * 创建或更新数据
	 * @param worksheet
	 * @return
	 */
	@Override
	public boolean saveOrUpdate(Worksheet worksheet) {
		if (StringUtil.isNullOrEmpty(worksheet.getWorksheetNo())){
			worksheet.setId(SequenceUtil.getNextVal(Worksheet.class));
			worksheet.setCreateTime(DateTimeUtil.getCurrentDate());
		}
		worksheet.setModifyTime(DateTimeUtil.getCurrentDate());
		JPAUtil.saveOrUpdate(worksheet);
		return true;
	}
	
	/**
	 * 创建或更新数据
	 * @param worksheetList
	 * @return
	 */
	@Override
	public boolean saveOrUpdate(List<Worksheet> worksheetList) {
		worksheetList.stream().forEach(item->{
			if (item.getId() == null){
				item.setId(SequenceUtil.getNextVal(Worksheet.class));
				item.setCreateTime(DateTimeUtil.getCurrentDate());
			}
			item.setModifyTime(DateTimeUtil.getCurrentDate());
		});
		
		JPAUtil.saveOrUpdate(worksheetList);
		return true;
	}

	@Override
	public List<Worksheet> findAll(PageInfo pageInfo) {
		return JPAUtil.load(Worksheet.class,pageInfo);
	}
}