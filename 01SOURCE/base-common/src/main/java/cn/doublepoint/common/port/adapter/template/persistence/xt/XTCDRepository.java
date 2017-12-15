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

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import cn.doublepoint.common.domain.model.entity.xt.T_XT_CD;

public interface XTCDRepository extends JpaRepository<T_XT_CD,String>{

	/**
	 * 获取子菜单
	 * @param 上级菜单标识
	 * @return
	 */
	@Query("select cd from T_XT_CD cd order by cd.cdbs,cd.cdpx")
	public List<T_XT_CD> findAllXTCD(); 
	/**
	 * 获取最底层菜单
	 * @return
	 */
	@Query("select cd from T_XT_CD cd where cd.cdcj=1 order by cd.cdpx")
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
