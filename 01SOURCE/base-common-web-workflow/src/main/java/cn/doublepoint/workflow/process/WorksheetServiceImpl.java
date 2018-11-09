package cn.doublepoint.workflow.process;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.commonutil.SequenceUtil;
import cn.doublepoint.commonutil.StringUtil;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
import cn.doublepoint.commonutil.port.adapter.persistence.QueryParamList;
import cn.doublepoint.dto.domain.model.entity.sys.Worksheet;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;

@Service("worksheetService")
public class WorksheetServiceImpl implements WorksheetService {

	@Autowired
	RestTemplate restTemplate;

	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return
	 */
	@Override
	public List<Worksheet> find(Worksheet worksheet, PageInfo pageInfo) {
		QueryParamList params=new QueryParamList();
		if(worksheet!=null){
			if(!StringUtil.isNullOrEmpty(worksheet.getWorksheetNo()))
				params.addParam("worksheetNo", worksheet.getWorksheetNo());
		}
		return JPAUtil.load(Worksheet.class,params, pageInfo);
	}

	/**
	 * 根据Id获取数据
	 * 
	 * @param id
	 * @return
	 */
	@Override
	public Worksheet getById(long id) {
		return JPAUtil.loadById(Worksheet.class, id);
	}
	
	

	/**
	 * 移除
	 * 
	 * @param worksheet
	 * @return
	 */
	@Override
	public boolean remove(Worksheet worksheet) {
		JPAUtil.remove(worksheet);
		return true;
	}

	/**
	 * 移除
	 * 
	 * @param worksheetList
	 * @return
	 */
	@Override
	public boolean remove(List<Worksheet> worksheetList) {
		worksheetList.stream().forEach(item -> {
			JPAUtil.remove(item);
		});
		return true;
	}

	/**
	 * 创建或更新数据
	 * 
	 * @param worksheet
	 * @return
	 */
	@Override
	public boolean create(Worksheet worksheet) {
		if (StringUtil.isNullOrEmpty(worksheet.getWorksheetNo())) {
			worksheet.setId(SequenceUtil.getNextVal(Worksheet.class));
			worksheet.setCreateTime(DateTimeUtil.getCurrentDate());
		}
		worksheet.setModifyTime(DateTimeUtil.getCurrentDate());
		JPAUtil.create(worksheet);
		return true;
	}

	@Override
	public List<Worksheet> findAll(PageInfo pageInfo) {
		return JPAUtil.load(Worksheet.class, pageInfo);
	}

	/**
	 * 根据工作单编号获取工作单
	 * @param worksheetNo
	 * @return
	 */
	@Override
	public Worksheet getByWorksheetNo(String worksheetNo){
		Worksheet query=new Worksheet();
		query.setWorksheetNo(worksheetNo);
		List<Worksheet> list=find(query, null);
		if(list==null||list.size()>0)
			return list.get(0);
		return null;
	}

	/**
	 * 根据工作单编号获取实例标识
	 * @param worksheetNo
	 * @return
	 */
	@Override
	public String getInstanceIdByWorksheetNo(String worksheetNo){
		Worksheet worksheet=getByWorksheetNo(worksheetNo);
		return worksheet.getInstanceId();
	}
}