package cn.doublepoint.common.port.adapter.template.persistence.sys.code;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.commonutil.SequenceUtil;
import cn.doublepoint.commonutil.ajaxmodel.PageInfo;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
import cn.doublepoint.template.dto.domain.model.entity.sys.Code;

@Service("codeService")
public class CodeServiceImpl  implements CodeService{

	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	@Override
	public List<Code> find(Code code,PageInfo pageInfo) {
		return JPAUtil.load(Code.class, pageInfo);
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
}