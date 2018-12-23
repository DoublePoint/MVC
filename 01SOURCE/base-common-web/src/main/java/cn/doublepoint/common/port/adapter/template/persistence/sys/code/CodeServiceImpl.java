package cn.doublepoint.common.port.adapter.template.persistence.sys.code;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.commonutil.SequenceUtil;
import cn.doublepoint.commonutil.StringUtil;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
import cn.doublepoint.dto.domain.model.entity.sys.Code;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;
import cn.doublepoint.dto.domain.model.vo.query.QueryParam;
import cn.doublepoint.dto.domain.model.vo.query.QueryParamList;
import cn.doublepoint.dto.domain.model.vo.query.SortParam;
import cn.doublepoint.dto.domain.model.vo.query.SortParamList;

@Service("codeService")
public class CodeServiceImpl  implements CodeService{

	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	@Override
	public List<Code> find(Code code,PageInfo pageInfo) {
		if(code==null)
			return JPAUtil.load(Code.class, pageInfo);
		QueryParamList queryParamList = new QueryParamList();
		if(!StringUtil.isNullOrEmpty(code.getCode()))
		{
			queryParamList.addParam("code", "%"+code.getCode()+"%", QueryParam.RELATION_LIKE);
		}
		if(!StringUtil.isNullOrEmpty(code.getClassify()))
		{
			queryParamList.addParam("classify", code.getClassify());
		}
		
		return JPAUtil.load(Code.class, queryParamList,pageInfo);
	}
	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	@Override
	public List<Code> findByClassify(String classify) {
		QueryParamList queryParamList = new QueryParamList();
		queryParamList.addParam("classify", classify);
		SortParamList sortParamList=new SortParamList();
		sortParamList.addParam("displaySn");
		return JPAUtil.load(Code.class, queryParamList,sortParamList);
	}
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	@Override
	public Code getById(long id){
		return JPAUtil.loadById(Code.class, id);
	}
	
	/**
	 * 移除
	 * @param code
	 * @return
	 */
	@Override
	public boolean remove(Code code){
		JPAUtil.remove(code);
		return true;
	}
	
	
	/**
	 * 移除
	 * @param codeList
	 * @return
	 */
	@Override
	public boolean remove(List<Code> codeList){
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
	public boolean saveOrUpdate(Code code) {
		if (code.getId() == null){
			code.setId(SequenceUtil.getNextVal(Code.class));
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
	public boolean saveOrUpdate(List<Code> codeList) {
		codeList.stream().forEach(item->{
			if (item.getId() == null){
				item.setId(SequenceUtil.getNextVal(Code.class));
				item.setCreateTime(DateTimeUtil.getCurrentDate());
			}
			item.setModifyTime(DateTimeUtil.getCurrentDate());
		});
		
		JPAUtil.saveOrUpdate(codeList);
		return true;
	}

	@Override
	public List<Code> findAll(PageInfo pageInfo) {
		return JPAUtil.load(Code.class,pageInfo);
	}

	@Override
	public List<Code> findClassify(Code code, PageInfo pageInfo) {
		StringBuilder sBuilder = new StringBuilder();
		QueryParamList paramList = new QueryParamList();
		sBuilder.append("select c from Code c where 1=1 ");
		if (!StringUtil.isNullOrEmpty(code.getCode())) {
			sBuilder.append(" and c.code like :code");
			paramList.addParam("code", "%" + code.getCode() + "%", QueryParam.RELATION_LIKE);
		}
		if (!StringUtil.isNullOrEmpty(code.getClassify())) {
			sBuilder.append(" and c.classify = :classify");
			paramList.addParam("classify", code.getClassify());
		}
		sBuilder.append(" group by c.classify");
		List<Code> objcts = JPAUtil.executeQueryModel(sBuilder.toString(), paramList, Code.class);
		return objcts;
	}
	/**
	 * 根据classify进行删除
	 */
	@Override
	public boolean removeByClassify(List<Code> codeList) {
		StringBuilder sBuilder = new StringBuilder();
		QueryParamList paramList = new QueryParamList();
		sBuilder.append("delete from Code c where c.classify in :classifys ");
		List<String> classifys = codeList.stream().map(i->i.getClassify()).collect(Collectors.toList());
		paramList.addParam("classifys", classifys);
		JPAUtil.executeUpdate(sBuilder.toString(),paramList);
		return true;
	}

	@Override
	public boolean updateByClassify(Code code) {
		if(code == null)
			return true;
		String oldClassify = JPAUtil.loadById(Code.class,code.getId()).getClassify();
		StringBuilder sBuilder = new StringBuilder();
		QueryParamList paramList = new QueryParamList();
		sBuilder.append("update Code c set c.classify=:newClassify where c.classify=:oldClassify");
		paramList.addParam("newClassify", code.getClassify());
		paramList.addParam("oldClassify",oldClassify);
		JPAUtil.executeUpdate(sBuilder.toString(),paramList);
		return true;
	}
	@Override
	public boolean updateByClassify(List<Code> codeList) {
		if(codeList==null)
			return true;
		codeList.stream().forEach(this::updateByClassify);
		return true;
	}
}