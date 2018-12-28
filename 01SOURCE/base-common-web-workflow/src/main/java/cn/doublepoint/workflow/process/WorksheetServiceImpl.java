package cn.doublepoint.workflow.process;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.commonutil.SequenceUtil;
import cn.doublepoint.commonutil.StringUtil;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
import cn.doublepoint.dto.domain.model.entity.sys.SysWorksheet;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;
import cn.doublepoint.dto.domain.model.vo.query.QueryParamList;

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
	public List<SysWorksheet> find(SysWorksheet worksheet, PageInfo pageInfo) {
		QueryParamList params=new QueryParamList();
		if(worksheet!=null){
			if(!StringUtil.isNullOrEmpty(worksheet.getWorksheetNo()))
				params.addParam("worksheetNo", worksheet.getWorksheetNo());
		}
		return JPAUtil.load(SysWorksheet.class,params, pageInfo);
	}

	/**
	 * 根据Id获取数据
	 * 
	 * @param id
	 * @return
	 */
	@Override
	public SysWorksheet getById(long id) {
		return JPAUtil.loadById(SysWorksheet.class, id);
	}
	
	

	/**
	 * 移除
	 * 
	 * @param worksheet
	 * @return
	 */
	@Override
	public boolean remove(SysWorksheet worksheet) {
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
	public boolean remove(List<SysWorksheet> worksheetList) {
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
	public boolean create(SysWorksheet worksheet) {
		if (StringUtil.isNullOrEmpty(worksheet.getWorksheetNo())) {
			worksheet.setId(SequenceUtil.getNextVal(SysWorksheet.class));
			worksheet.setCreateTime(DateTimeUtil.getCurrentDate());
		}
		worksheet.setModifyTime(DateTimeUtil.getCurrentDate());
		JPAUtil.create(worksheet);
		return true;
	}

	@Override
	public List<SysWorksheet> findAll(PageInfo pageInfo) {
		return JPAUtil.load(SysWorksheet.class, pageInfo);
	}

	/**
	 * 根据工作单编号获取工作单
	 * @param worksheetNo
	 * @return
	 */
	@Override
	public SysWorksheet getByWorksheetNo(String worksheetNo){
		SysWorksheet query=new SysWorksheet();
		query.setWorksheetNo(worksheetNo);
		List<SysWorksheet> list=find(query, null);
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
		SysWorksheet worksheet=getByWorksheetNo(worksheetNo);
		return worksheet.getInstanceId();
	}
}