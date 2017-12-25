/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月25日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.infrastruture.xt;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import cn.doublepoint.common.domain.model.viewmodel.xt.VT_XT_CD;
import dao.JPAUtil;
public class JPAUtilTest  extends RepositoryTest{

	@Resource
	JPAUtil jpaUtil;
	
	@Test
	public void testquery() throws Exception{
		String insertSql="insert into XT_CD (cdcj, cdlj, cdmc, cdpx, cjsj, gxsj, sjcdbs, cdbs) values (?, ?, ?, ?, ?, ?, ?, ?)";
		List<VT_XT_CD> list=jpaUtil.executeQuery("select * from xt_cd limit 100,100", VT_XT_CD.class);
		jpaUtil.save2(list);
		System.out.println(list.size());
	}
}
