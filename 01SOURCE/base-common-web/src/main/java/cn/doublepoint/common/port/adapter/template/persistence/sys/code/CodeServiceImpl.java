package cn.doublepoint.common.port.adapter.template.persistence.sys.code;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.commonutil.SequenceUtil;
import cn.doublepoint.commonutil.StringUtil;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
import cn.doublepoint.dto.domain.model.entity.sys.SysCode;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;
import cn.doublepoint.dto.domain.model.vo.query.QueryParam;
import cn.doublepoint.dto.domain.model.vo.query.QueryParamList;
import cn.doublepoint.dto.domain.model.vo.query.SortParamList;

@Service("codeService")
public class CodeServiceImpl  implements CodeService{

	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	@Override
	public List<SysCode> find(SysCode code,PageInfo pageInfo) {
		if(code==null)
			return JPAUtil.load(SysCode.class, pageInfo);
		QueryParamList queryParamList = new QueryParamList();
		if(!StringUtil.isNullOrEmpty(code.getCode()))
		{
			queryParamList.addParam("code", "%"+code.getCode()+"%", QueryParam.RELATION_LIKE);
		}
		if(!StringUtil.isNullOrEmpty(code.getClassify()))
		{
			queryParamList.addParam("classify", code.getClassify());
		}
		
		return JPAUtil.load(SysCode.class, queryParamList,pageInfo);
	}
	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	@Override
	public List<SysCode> findByClassify(String classify) {
		QueryParamList queryParamList = new QueryParamList();
		queryParamList.addParam("classify", classify);
		SortParamList sortParamList=new SortParamList();
		sortParamList.addParam("displaySn");
		return JPAUtil.load(SysCode.class, queryParamList,sortParamList);
	}
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	@Override
	public SysCode getById(long id){
		return JPAUtil.loadById(SysCode.class, id);
	}
	
	/**
	 * 移除
	 * @param code
	 * @return
	 */
	@Override
	public boolean remove(SysCode code){
		JPAUtil.remove(code);
		return true;
	}
	
	
	/**
	 * 移除
	 * @param codeList
	 * @return
	 */
	@Override
	public boolean remove(List<SysCode> codeList){
		codeList.stream().forEach(item -> {
			JPAUtil.remove(item);
		});
		return true;
	}
	
	/**
	 * 创建或更新数据
	 * @param code
	 * @return
	 */
	@Override
	public boolean saveOrUpdate(SysCode code) {
		if (code.getId() == null){
			code.setId(SequenceUtil.getNextVal(SysCode.class));
			code.setCreateTime(DateTimeUtil.getCurrentDate());
		}
		code.setModifyTime(DateTimeUtil.getCurrentDate());
		JPAUtil.saveOrUpdate(code);
		return true;
	}
	
	/**
	 * 创建或更新数据
	 * @param codeList
	 * @return
	 */
	@Override
	public boolean saveOrUpdate(List<SysCode> codeList) {
		codeList.stream().forEach(item->{
			if (item.getId() == null){
				item.setId(SequenceUtil.getNextVal(SysCode.class));
				item.setCreateTime(DateTimeUtil.getCurrentDate());
			}
			item.setModifyTime(DateTimeUtil.getCurrentDate());
		});
		
		JPAUtil.saveOrUpdate(codeList);
		return true;
	}

	@Override
	public List<SysCode> findAll(PageInfo pageInfo) {
		return JPAUtil.load(SysCode.class,pageInfo);
	}

	@Override
	public List<SysCode> findClassify(SysCode code, PageInfo pageInfo) {
		StringBuilder sBuilder = new StringBuilder();
		QueryParamList paramList = new QueryParamList();
		sBuilder.append("select c from SysCode c where 1=1 ");
		if (!StringUtil.isNullOrEmpty(code.getCode())) {
			sBuilder.append(" and c.code like :code");
			paramList.addParam("code", "%" + code.getCode() + "%");
		}
		if (!StringUtil.isNullOrEmpty(code.getClassify())) {
			sBuilder.append(" and c.classify like :classify");
			paramList.addParam("classify", "%"+code.getClassify()+"%");
		}
		if (!StringUtil.isNullOrEmpty(code.getCodeName())) {
			sBuilder.append(" and c.codeName like :codeName");
			paramList.addParam("codeName", "%"+code.getCodeName()+"%");
		}
		sBuilder.append(" group by c.classify");
		List<SysCode> objcts = JPAUtil.executeQueryModel(sBuilder.toString(), paramList, SysCode.class);
		return objcts;
	}
	/**
	 * 根据classify进行删除
	 */
	@Override
	public boolean removeByClassify(List<SysCode> codeList) {
		StringBuilder sBuilder = new StringBuilder();
		QueryParamList paramList = new QueryParamList();
		sBuilder.append("delete from SysCode c where c.classify in :classifys ");
		List<String> classifys = codeList.stream().map(i->i.getClassify()).collect(Collectors.toList());
		paramList.addParam("classifys", classifys);
		JPAUtil.executeUpdate(sBuilder.toString(),paramList);
		return true;
	}

	@Override
	public boolean updateByClassify(SysCode code) {
		if(code == null)
			return true;
		String oldClassify = JPAUtil.loadById(SysCode.class,code.getId()).getClassify();
		StringBuilder sBuilder = new StringBuilder();
		QueryParamList paramList = new QueryParamList();
		sBuilder.append("update SysCode c set c.classify=:newClassify where c.classify=:oldClassify");
		paramList.addParam("newClassify", code.getClassify());
		paramList.addParam("oldClassify",oldClassify);
		JPAUtil.executeUpdate(sBuilder.toString(),paramList);
		return true;
	}
	@Override
	public boolean updateByClassify(List<SysCode> codeList) {
		if(codeList==null)
			return true;
		codeList.stream().forEach(this::updateByClassify);
		return true;
	}
}