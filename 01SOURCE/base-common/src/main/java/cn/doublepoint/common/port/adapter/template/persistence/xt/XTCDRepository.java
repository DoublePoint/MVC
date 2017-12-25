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

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import cn.doublepoint.base.commonutil.domain.model.XTCDConstant;
import cn.doublepoint.base.commonutil.persistence.BaseRepository;
import cn.doublepoint.common.domain.model.entity.xt.CustomerProjection;
import cn.doublepoint.common.domain.model.entity.xt.T_XT_CD;

public interface XTCDRepository extends JpaRepository<T_XT_CD,Long>,JpaSpecificationExecutor<T_XT_CD>{
//	@Resource
//	JdbcTemplate template;
//	
//	public default <T extends BaseModel> List<T> executeQuery(String sql,final Class<T> clas){
//		return template.query(sql, new BeanPropertyRowMapper<T>(clas));
//	}
	
	/**
	 * 获取子菜单
	 * @param 上级菜单标识
	 * @return
	 */
	@Query("select cd from T_XT_CD cd order by cd.cdbs,cd.cdpx")
	public Page<T_XT_CD> findAllXTCD(Pageable  pageable); 
	
	/**
	 * 获取最底层菜单
	 * @return
	 */
	@Query("select cd from T_XT_CD cd where cd.cdcj="+XTCDConstant.TREE_ROOT_NODE_CJ+" order by cd.cdpx")
	public Page<T_XT_CD> findRootXTCD(Pageable  pageable);
	
	/**
	 * 获取子菜单
	 * @param 上级菜单标识
	 * @return
	 */
	@Query("select cd from T_XT_CD cd where cd.sjcdbs=:sjcdbs  order by cd.cdpx")
	public Page<T_XT_CD> findChildrenXTCD(@Param("sjcdbs") String sjcdbs,Pageable  pageable); 
	
	public T_XT_CD findByCdbs(String cdbs);
	
	/**
	 * 获取子菜单
	 * @param 上级菜单标识
	 * @return
	 */
	@Query(value="select new map(cd.cdmc,cd.cdbs) from T_XT_CD cd order by cd.cdbs,cd.cdpx")
	public  List<CustomerProjection> findReturnProjection(); 
	
	
}
