package cn.doublepoint.common.port.adapter.template.persistence.sys.code;
import java.util.List;

import cn.doublepoint.dto.domain.model.entity.sys.Code;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;


public interface CodeService {

	/**
	 * 根据分页信息查询所有数据
	 * 
	 * @return 系统代码编码
	 */
	public List<Code> findAll(PageInfo pageInfo);
	
	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	public List<Code> find(Code code,PageInfo pageInfo) ;
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	public Code getById(long id);
	
	/**
	 * 移除
	 * @param code
	 * @return
	 */
	public boolean remove(Code code);
	
	
	/**
	 * 移除
	 * @param codeList
	 * @return
	 */
	public boolean remove(List<Code> codeList);
	
	/**
	 * 创建或更新数据
	 * @param code
	 * @return
	 */
	public boolean saveOrUpdate(Code code) ;
	
	/**
	 * 创建或更新数据
	 * @param code
	 * @return
	 */
	public boolean saveOrUpdate(List<Code> codeList) ;

}