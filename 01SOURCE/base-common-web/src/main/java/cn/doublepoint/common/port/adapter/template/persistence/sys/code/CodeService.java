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
	 * 
	 * @param code
	 * @param pageInfo
	 * @return
	 */
	public List<Code> findClassify(Code code,PageInfo pageInfo) ;

	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	public List<Code> find(Code code,PageInfo pageInfo) ;
	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	public List<Code> findByClassify(String classify) ;
	
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
	 * 根据classify进行删除
	 * @param codeList
	 * @return
	 */
	public boolean removeByClassify(List<Code> codeList);
	
	
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

	/**
	 * 更新classify
	 * @param oldClassify
	 * @param newClassify
	 * @return
	 */
	public boolean updateByClassify(Code code);
	/**
	 * 更新classify
	 * @param oldClassify
	 * @param newClassify
	 * @return
	 */
	public boolean updateByClassify(List<Code> codeList);
}