/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月14日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.common.port.adapter.template.persistence.xt;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import cn.doublepoint.base.common.domain.model.commontype.XTCDConstant;
import cn.doublepoint.common.domain.model.entity.xt.T_XT_CD;
import cn.doublepoint.common.domain.model.viewmodel.xt.I_VT_XT_CD;

public interface XTCDRepository extends JpaRepository<T_XT_CD,String>,JpaSpecificationExecutor<T_XT_CD>{

	/**
	 * 获取子菜单
	 * @param 上级菜单标识
	 * @return
	 */
	@Query("select cd from T_XT_CD cd order by cd.cdbs,cd.cdpx")
	public List<T_XT_CD> findAllXTCD(); 
	
	/**
	 * 获取子菜单
	 * @param 上级菜单标识
	 * @return
	 */
	@Query("select cd,cd2.cdmc as zcdmc from T_XT_CD cd,T_XT_CD cd2 where cd.cdbs=cd2.sjcdbs order by cd.cdbs,cd.cdpx")
	public List<I_VT_XT_CD> findAllXTCD2(); 
	
	/**
	 * 获取最底层菜单
	 * @return
	 */
	@Query("select cd from T_XT_CD cd where cd.cdcj="+XTCDConstant.TREE_ROOT_NODE_CJ+" order by cd.cdpx")
	public List<T_XT_CD> findRootXTCD();
	
	/**
	 * 获取子菜单
	 * @param 上级菜单标识
	 * @return
	 */
	@Query("select cd from T_XT_CD cd where cd.sjcdbs=:sjcdbs  order by cd.cdpx")
	public List<T_XT_CD> findChildrenXTCD(@Param("sjcdbs") String sjcdbs); 
	
	public T_XT_CD findByCdbs(String cdbs);
}
