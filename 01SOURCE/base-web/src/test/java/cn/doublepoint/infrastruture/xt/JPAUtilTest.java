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

import static java.util.stream.Collectors.toList;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.beans.BeanUtils;

import cn.doublepoint.common.domain.model.entity.xt.Menu;
import cn.doublepoint.common.domain.model.viewmodel.xt.VMenu;
import cn.doublepoint.commonutil.domain.model.AjaxDataWrap;
import cn.doublepoint.commonutil.domain.model.CommonBeanUtils;
import cn.doublepoint.commonutil.domain.model.PageInfo;
import cn.doublepoint.commonutil.port.adapter.persistence.QueryParam;
import cn.doublepoint.commonutil.port.adapter.persistence.QueryParamList;
//import cn.doublepoint.jdbc.util.JDBCUtil;

public class JPAUtilTest extends RepositoryTest {

	/*@Resource
	JDBCUtil jpaUtil;*/

	/*@Test
	public void testquery() throws Exception {
		String insertSql = "insert into XT_CD (cdcj, cdlj, cdmc, cdpx, cjsj, gxsj, sjcdbs, cdbs) values (?, ?, ?, ?, ?, ?, ?, ?)";
		List<VMenu> list = jpaUtil.executeQuery("select * from xt_cd limit 100,100", VMenu.class);
		System.out.println(list.size());
	}

	@Test
	public void testbatchUpdate() {
		String insertSql = "insert into XT_CD (cdcj, cdlj, cdmc, cdpx, cjsj, gxsj, sjcdbs, cdbs) values (?, ?, ?, ?, ?, ?, ?, ?)";
		List<VMenu> list = jpaUtil.executeQuery("select * from xt_cd limit 100,100", VMenu.class);

		List<Menu> updateList = CommonBeanUtils.copyTo(list, Menu.class);

		jpaUtil.batchUpdate(updateList.stream().map(item -> {
			Menu t_XT_CD = new Menu();
			BeanUtils.copyProperties(item, t_XT_CD);
			t_XT_CD.setCdmc("------");
			return t_XT_CD;
		}).collect(toList()));
	}*/
	
	@Test
	public void testQueryList(){
		QueryParamList list=new QueryParamList();
		QueryParam params=new QueryParam();
		params.setName("cdbs");
		params.setValue("%1%");
		params.setRelation("LIKE");
		list.addParam(params);
		
		PageInfo pageInfo=new PageInfo();
		pageInfo.setCurrentPageNum(1);
		pageInfo.setPageSize(100);
		
//		AjaxDataWrap<Menu> list2=jpaUtil.load(Menu.class, list, pageInfo);
//		System.out.println(list2.size());
	}
	
}
